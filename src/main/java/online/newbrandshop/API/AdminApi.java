package online.newbrandshop.API;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import online.newbrandshop.modal.*;
import online.newbrandshop.repository.*;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpSession;
import java.io.BufferedOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

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


    @GetMapping("/getCategory")
    public String GetCategory()
    {
        List<CategoryEntity>categoryEntities=categoryRepository.findAll();
        StringBuilder rebody= new StringBuilder();
        for (CategoryEntity categoryEntity : categoryEntities) {
            rebody.append("|" + categoryEntity.getCategoryName());
        }
        return rebody.toString();
    }
    @GetMapping("/getCategory/{id}")
    public String GetCategoryProduct(@PathVariable("id")long id) throws JsonProcessingException {
        ProductEntity entity=productRepository.findById(id);
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
        productRepository.save(entity);
        return "ok";
    }
    @PostMapping("/addType")
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
    @PostMapping("/addCategoryCode")
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
    @PostMapping("/addCategoryToType")
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
}
