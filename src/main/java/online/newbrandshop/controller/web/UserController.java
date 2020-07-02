package online.newbrandshop.controller.web;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import online.newbrandshop.modal.BillEntity;
import online.newbrandshop.repository.*;
import online.newbrandshop.util.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class UserController {
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
    @RequestMapping("/user/profile")
    ModelAndView profile() throws JsonProcessingException {
        ModelAndView mav=new ModelAndView("web/profile");
        List<BillEntity>list=billRepository.findAllByCreatedBy(SecurityUtils.getPrincipal().getUsername());
        ObjectMapper mapper=new ObjectMapper();
        mav.addObject("list",mapper.writeValueAsString(list));
        return mav;
    }
    @RequestMapping("/AccessDenied")
    ModelAndView AccessDenied (){
        ModelAndView mav=new ModelAndView("web/AccessDenied");
        return mav;
    }

}
