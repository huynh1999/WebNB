package online.newbrandshop.API;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import online.newbrandshop.modal.*;
import online.newbrandshop.repository.*;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpSession;
import java.io.BufferedOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@RequestMapping("/admin/api/")
public class AdminApi {
    @Autowired
    UserRepository userRepository;
    @Autowired
    ProfileUserRepository profileUserRepository;
    @Autowired
    RoleUserRepository roleUserRepository;
    @Autowired
    ImageRepository imageRepository;
    @Autowired
    ProductRepository productRepository;
    @Autowired
    BillRepository billRepository;
    @Autowired
    CategoryRepository categoryRepository;
    @Autowired
    MenuRepository menuRepository;
    @Autowired
    NameTypeRepository nameTypeRepository;


    @GetMapping(value = "/getCategory",produces = "application/json;charset=UTF-8")
    public String GetCategory()
    {
        List<CategoryEntity>categoryEntities=categoryRepository.findAll();
        StringBuilder rebody= new StringBuilder();
        for (CategoryEntity categoryEntity : categoryEntities) {
            rebody.append("|" + categoryEntity.getCategoryName());
        }
        return rebody.toString();
    }
    @GetMapping(value = "/getCategory/{id}",produces = "application/json;charset=UTF-8")
    public String GetCategoryProduct(@PathVariable("id")long id) throws JsonProcessingException {
        ProductEntity entity=productRepository.adminFindById(id);
        List<CategoryEntity>categoryEntities=entity.getListCategories();
        ObjectMapper mapper=new ObjectMapper();
        return mapper.writeValueAsString(categoryEntities);
    }
    @PostMapping("/updateProduct")
    public String UpdateProduct(@RequestBody JsonNode node)
    {
        ProductEntity entity=productRepository.findById(node.get("id").asLong());
        List<CategoryEntity>categoryEntityList=new ArrayList<>();
        for (JsonNode node1:node.get("lsCate")
             ) {
           categoryEntityList.add(categoryRepository.findOneByCategoryName(node1.asText()));
        }
        entity.setListCategories(categoryEntityList);
        entity.setContent(node.get("content").asText());
        entity.setPrice(node.get("price").asText());
        entity.setName(node.get("name").asText());
        entity.setSize(node.get("size").asText());
        entity.setActive(node.get("active").asInt());
        productRepository.save(entity);
        return "ok";
    }
    @GetMapping(value = "/product/{id}",produces = "application/json;charset=UTF-8")
    String Data(@PathVariable("id")Long id) throws JsonProcessingException {
        ProductEntity productEntity=productRepository.adminFindById(id);
        productEntity.getListCategories();
        ObjectMapper mapper=new ObjectMapper();
        return mapper.writeValueAsString(productEntity);
    }
    @GetMapping(value = "/category/{cate}" ,produces = "application/json;charset=UTF-8")
    String FindCategory(@PathVariable("cate")String cate) throws JsonProcessingException {
        List<ProductEntity>list=categoryRepository.findOneByCategoryName(cate).getListProducts();
        ObjectMapper mapper=new ObjectMapper();
        Collections.reverse(list);
        return mapper.writeValueAsString(list);
    }
    @PostMapping(value = "/addType",produces = "application/json;charset=UTF-8")
    public String AddType(@RequestBody JsonNode node)
    {
        try {
            NameTypeEntity entity=new NameTypeEntity();
            entity.setNameType(node.get("name").asText());
            nameTypeRepository.save(entity);
        }
        catch (Exception e){
            return "error";
        }
        return "ok";

    }
    @PostMapping(value = "/addCategoryCode",produces = "application/json;charset=UTF-8")
    public String AddCategoryCode(@RequestBody JsonNode node)
    {
        try {
            CategoryEntity entity=new CategoryEntity();
            entity.setCategoryName(node.get("code").asText());
            categoryRepository.save(entity);
        }
        catch (Exception e){
            return "error";
        }
        return "ok";

    }
    @PostMapping(value = "/addCategoryToType",produces = "application/json;charset=UTF-8")
    public String AddCategoryToType(@RequestBody JsonNode node)
    {
        try{
            MenuEntity menuEntity=new MenuEntity();
            CategoryEntity categoryEntity=categoryRepository.findOneByCategoryName(node.get("categoryCode").asText());
            if(categoryEntity==null)return "error";
            menuEntity.setNameCategory(categoryEntity.getCategoryName());
            menuEntity.setNameMenu(node.get("categoryMenu").asText());
            NameTypeEntity nameTypeEntity=nameTypeRepository.findFirstByNameType(node.get("nameType").asText());
            menuEntity.setType(nameTypeEntity);
            menuRepository.save(menuEntity);
        }
        catch (Exception e){
            return "error";
        }
        return "ok";
    }
    @DeleteMapping("/deleteType")
    public String DeleteType(@RequestBody JsonNode node)
    {
        try {
            NameTypeEntity nameTypeEntity=nameTypeRepository.findFirstByNameType(node.get("name").asText());
            nameTypeRepository.delete(nameTypeEntity);
            return "ok";
        }
        catch (Exception e){
            return "error";
        }
    }
    @DeleteMapping("/deleteMenu")
    public String DeleteMenu(@RequestBody JsonNode node)
    {
        try {
            MenuEntity menuEntity=menuRepository.findByNameAndType(node.get("nameCate").asText(),node.get("nameType").asText());
            menuRepository.delete(menuEntity);
            return "ok";
        }
        catch (Exception e){
            return "error";
        }
    }
    @GetMapping(value = "/getBillByStatus/{status}",produces = "application/json;charset=UTF-8")
    public String GetBillByStatus(@PathVariable("status")int status) throws JsonProcessingException {
        List<BillEntity>list=billRepository.findAllByStatus(status);
        Collections.reverse(list);
        return new ObjectMapper().writeValueAsString(list);
    }
    @GetMapping(value = "/getBillById/{id}",produces =  "application/json;charset=UTF-8")
    public String getBillById(@PathVariable("id")long id) throws JsonProcessingException {
        ObjectMapper mapper=new ObjectMapper();
        JSONObject jsonObject=new JSONObject();
        BillEntity billEntity=billRepository.findById(id);
        return mapper.writeValueAsString(billEntity.getPayerEntity());
    }
    @PostMapping(value = "/setStatus")
    public String setStatus(@RequestBody JsonNode node)
    {
        try{
            String statusContent;
            switch (node.get("status").asInt()) {
                case 0:
                    statusContent="Đã tiếp nhận";
                    break;
                case 1:
                    statusContent="Đã xác nhận đơn hàng";
                    break;
                case 2:
                    statusContent="Đang vận chuyển";
                    break;
                case 3:
                    statusContent="Giao hàng thành công";
                    break;
                case 4:
                    statusContent="Đã hủy";
                    break;
                default:
                    statusContent="";
            }
            BillEntity billEntity=billRepository.findById(node.get("id").asLong());
            if(billEntity.getStatus()>=3)return "error";
            billEntity.setStatus(node.get("status").asInt());
            JSONObject jsonObject=new JSONObject();
            Date date = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");
            formatter.setTimeZone(TimeZone.getTimeZone("GMT+7"));
            jsonObject.put("date", formatter.format(date));
            jsonObject.put("content",statusContent);
            JSONArray array=new JSONArray(billEntity.getDetails());
            array.put(jsonObject);
            billEntity.setDetails(array.toString());
            billRepository.save(billEntity);
            return "ok";
        }
        catch (Exception e){
            return "error";
        }
    }
    @GetMapping("/getAllImg")
    public String getAllImg() throws JsonProcessingException {
        List<ImageEntity>imageEntities=imageRepository.findAll();
        ObjectMapper mapper=new ObjectMapper();
        Collections.reverse(imageEntities);
        return mapper.writeValueAsString(imageEntities);
    }

}
