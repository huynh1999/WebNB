package online.newbrandshop.API;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonObject;
import online.newbrandshop.modal.*;
import online.newbrandshop.repository.*;
import online.newbrandshop.security.MyUser;
import online.newbrandshop.util.SecurityUtils;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.*;

@RestController
@RequestMapping("/api")
public class API {
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
    @GetMapping(value = "/category/{cate}" ,produces = "application/json;charset=UTF-8")
    String FindCategory(@PathVariable("cate")String cate) throws JsonProcessingException {
        Pageable pageRequest= new PageRequest(0,1);
        List<ProductEntity>list=categoryRepository.findOneByCategoryName(cate).getListProducts();
        ObjectMapper mapper=new ObjectMapper();
        Collections.reverse(list);
        return mapper.writeValueAsString(list);
    }
    @GetMapping(value = "/content/{id}",produces = "application/json;charset=UTF-8")
    String ChiTiet(@PathVariable("id")Long id){
        return productRepository.findById(id).getContent();
    }

    @GetMapping(value = "/size/{id}",produces = "application/json;charset=UTF-8")
    String Size(@PathVariable("id")Long id){
        return productRepository.findById(id).getSize();
    }

    @GetMapping(value = "/product/{id}",produces = "application/json;charset=UTF-8")
    String CheckOutInf(@PathVariable("id")Long id) throws JsonProcessingException {
        ProductEntity productEntity=productRepository.findById(id);
        productEntity.getListCategories();
        ObjectMapper mapper=new ObjectMapper();
        return mapper.writeValueAsString(productEntity);
    }
    @PostMapping(value = "/checkUsername",produces = "application/json;charset=UTF-8")
    String CheckUserName(@RequestBody JsonNode node)
    {
        UserEntity userEntity=userRepository.findOneByUserNameAndActive(node.get("username").asText(),1);
        if(userEntity==null)return "ok";
        else return "error";
    }
    @PostMapping("user/changePass")
    String ChangePass(@RequestBody String body) throws IOException {
        try{
            ObjectMapper mapper=new ObjectMapper();
            UserEntity userEntity=null;
            try {
                userEntity=userRepository.findOneByUserNameAndActive(SecurityUtils.getPrincipal().getUsername(),1);
            }
            catch (Exception e){return "error";}
            JsonNode node=mapper.readTree(body);
            String oldPass=node.get("oldPass").asText();
            String newPass=node.get("newPass").asText();
            String renewPass=node.get("renewPass").asText();
            if(!newPass.equals(renewPass)){return "error";};
            if(BCrypt.checkpw(oldPass,userEntity.getPassword()))
            {
                userEntity.setPassword(BCrypt.hashpw(newPass,BCrypt.gensalt(10)));
                userRepository.save(userEntity);
                return "ok";
            }
        }
        catch (Exception e){return "error";};
        return "error";
    }
    @PostMapping(value = "/login-facebook")
    public String loginfb(HttpServletRequest request, @RequestBody String bd) throws IOException {
        ObjectMapper mapper=new ObjectMapper();
        JsonNode node=mapper.readTree(bd);
        boolean enabled = true;
        boolean accountNonExpired = true;
        boolean credentialsNonExpired = true;
        boolean accountNonLocked = true;
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        UserEntity entity=userRepository.findOneByUserNameAndActive(node.get("id").asText(),1);
        if(entity!=null)
        {
            if(!(node.get("name").asText().equals(entity.getProfileUserEntity().getName())&&node.get("email").asText().equals(entity.getEmail())))
            {
                entity.getProfileUserEntity().setName(node.get("name").asText());
                entity.setEmail(node.get("email").asText());
                userRepository.save(entity);
            }
        }
        else {
            UserEntity userEntity = new UserEntity();
            userEntity.setUserName(node.get("id").asText());
            userEntity.setEmail(node.get("email").asText());
            userEntity.setActive(1);
            RoleUserEntity role = roleUserRepository.findOneById(2);
            userEntity.setRoleUserEntity(role);
            ProfileUserEntity profileUserEntity = new ProfileUserEntity();
            profileUserEntity.setName(node.get("name").asText());
            profileUserEntity.setPhonenumber("");
            profileUserEntity.setAddress("");
            userEntity.setProfileUserEntity(profileUserEntity);
            profileUserEntity.setUserEntity(userEntity);
            userRepository.save(userEntity);
            entity=userRepository.findOneByUserNameAndActive(node.get("id").asText(),1);
        }
        authorities.add(new SimpleGrantedAuthority("customer"));
        UserDetails userDetail = new MyUser(entity.getUserName(), "", enabled, accountNonExpired, credentialsNonExpired,
                accountNonLocked, authorities);
        ((MyUser)userDetail).setName(entity.getProfileUserEntity().getName());
        ((MyUser)userDetail).setEmail(entity.getEmail());
        ((MyUser)userDetail).setAddress(entity.getProfileUserEntity().getAddress());
        ((MyUser)userDetail).setPhonenumber(entity.getProfileUserEntity().getPhonenumber());
        UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetail, null,
                userDetail.getAuthorities());
        authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
        SecurityContextHolder.getContext().setAuthentication(authentication);
        System.out.println("done");
        return "ok";
    }
    @PostMapping("/user/changeInfo")
    public  String ChangeInfo(@RequestBody String body, HttpServletRequest request, Authentication auth) throws IOException {
        try
        {
            ObjectMapper mapper=new ObjectMapper();
            JsonNode node=mapper.readTree(body);
            UserEntity entity=userRepository.findOneByUserNameAndActive(SecurityUtils.getPrincipal().getUsername(),1);
            entity.getProfileUserEntity().setName(node.get("name").asText());
            entity.getProfileUserEntity().setAddress(node.get("address").asText());
            entity.getProfileUserEntity().setPhonenumber(node.get("phone").asText());
            entity.setEmail(node.get("email").asText());
            userRepository.save(entity);
            List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
            UserDetails userDetail = SecurityUtils.getPrincipal();
            ((MyUser)userDetail).setName(entity.getProfileUserEntity().getName());
            ((MyUser)userDetail).setEmail(entity.getEmail());
            ((MyUser)userDetail).setAddress(entity.getProfileUserEntity().getAddress());
            ((MyUser)userDetail).setPhonenumber(entity.getProfileUserEntity().getPhonenumber());
            UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetail,auth.getCredentials(),
                    userDetail.getAuthorities());
            authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
            SecurityContextHolder.getContext().setAuthentication(authentication);
            return "ok";
        }
        catch (Exception e) {
            return "error";
        }
    }
    @GetMapping(value = "/getTypeAndCategory",produces = "application/json;charset=UTF-8")
    public String GetTypeAndCategory() throws JsonProcessingException {
        List<NameTypeEntity>entities=nameTypeRepository.findAll();
        ObjectMapper mapper=new ObjectMapper();
        return mapper.writeValueAsString(entities);
    }
    @GetMapping(value = "/getRecommendProduct/{idproduct}",produces = "application/json;charset=UTF-8")
    public String GetRecommendProduct(@PathVariable("idproduct")long idproduct) throws JsonProcessingException {
        ProductEntity productEntity=productRepository.findById(idproduct);
        if(productEntity==null)productEntity=productRepository.findById((long)200);
        List<CategoryEntity>categoryEntityList=productEntity.getListCategories();
        List<ProductEntity>list=new ArrayList<>();
        for(int i=0;i<categoryEntityList.size();i++)
        {
            list.addAll(categoryEntityList.get(i).getListProducts());
        }
        Random random=new Random();
        List<ProductEntity>re=new ArrayList<>();
        re.add(productEntity);
        for(int i=0;i<3;i++)
        {
            ProductEntity productEntity1=list.get(random.nextInt(list.size()));
            if(re.contains(productEntity1))
            {
                i--;
            }
            else re.add(productEntity1);

        }
        re.remove(0);
        ObjectMapper mapper=new ObjectMapper();
        return mapper.writeValueAsString(re);
    }
    @PostMapping(value = "/search",produces = "application/json;charset=UTF-8")
    public String search(@RequestBody JsonNode node) throws JsonProcessingException {
        System.out.println(node.get("keyword").asText());
        List<ProductEntity>list=productRepository.search(node.get("keyword").asText());
        ObjectMapper mapper=new ObjectMapper();
        return mapper.writeValueAsString(list);
    }
}
