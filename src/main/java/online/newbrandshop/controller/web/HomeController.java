package online.newbrandshop.controller.web;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.google.gson.Gson;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import online.newbrandshop.modal.*;
import online.newbrandshop.repository.*;
import online.newbrandshop.security.MyUser;
import online.newbrandshop.service.EmailService;
import online.newbrandshop.service.PaypalService;
import online.newbrandshop.util.SecurityUtils;
import online.newbrandshop.util.Utils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMailMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
public class HomeController {
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
    EmailService emailService;
    @Autowired
    PaypalService paypalService;

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public ModelAndView homePage(HttpSession session) {
        ModelAndView mav = new ModelAndView("web/home");
        mav.addObject("topProduct",productRepository.orderbySold());
        return mav;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView loginPage(HttpSession session) {
        if (SecurityUtils.isAuthenticanted()) {
            return new ModelAndView("redirect:/home");
        }
        ModelAndView mav = new ModelAndView("web/login");
        return mav;
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return new ModelAndView("redirect:/home?logoutSuccess");
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@RequestParam("username") String userName, @RequestParam("fullname") String fullName
            , @RequestParam("phone") String phone, @RequestParam("email") String email
            , @RequestParam("password") String password, @RequestParam("address") String address) {
        try {
            Pattern regex = Pattern.compile("[a-zA-Z0-9 ]{6,15}");
            Pattern regex1 = Pattern.compile("[a-z0-9]{6,15}");
            if (!(regex.matcher(password).matches() && regex1.matcher(userName).matches())) {
                throw new Exception("error");
            }
            UserEntity userEntity = new UserEntity();
            userEntity.setUserName(userName);
            userEntity.setEmail(email);
            userEntity.setActive(1);
            userEntity.setPassword(BCrypt.hashpw(password, BCrypt.gensalt(10)));
            RoleUserEntity role = roleUserRepository.findOneById(2);
            userEntity.setRoleUserEntity(role);
            ProfileUserEntity profileUserEntity = new ProfileUserEntity();
            profileUserEntity.setAddress(address);
            profileUserEntity.setName(fullName);
            profileUserEntity.setPhonenumber(phone);
            userEntity.setProfileUserEntity(profileUserEntity);
            profileUserEntity.setUserEntity(userEntity);
            userRepository.save(userEntity);
        } catch (Exception e) {
            return "redirect:login?errorRegister";
        }
        return "redirect:login?successRegister";
    }

    @RequestMapping("/category/{cate}")
    ModelAndView category() {
        ModelAndView mav = new ModelAndView("web/category");
        return mav;
    }

    @RequestMapping("/registerWeb")
    ModelAndView registerWeb() {
        ModelAndView mav = new ModelAndView("web/register");
        return mav;
    }

    @RequestMapping("/product/{idproduct}")
    ModelAndView chitiet(@PathVariable("idproduct") Long id) {
        ModelAndView mav = new ModelAndView("web/chitietsp");
        ProductEntity productEntity = productRepository.findById(id);
        mav.addObject("item", productEntity);
        return mav;
    }


    @RequestMapping("/hethongcuahang")
    ModelAndView hethongcuahang() {
        ModelAndView mav = new ModelAndView("web/hethongcuahang");
        return mav;
    }

    @RequestMapping("/thongtinshop")
    ModelAndView thongtinshop() {
        ModelAndView mav = new ModelAndView("web/thongtinshop");
        return mav;
    }

    @RequestMapping("/help")
    ModelAndView help() {
        ModelAndView mav = new ModelAndView("web/help");
        return mav;
    }

    @RequestMapping("/chitietdonhang")
    ModelAndView chitietdonhang() {
        ModelAndView mav = new ModelAndView("web/chitietdonhang");
        return mav;
    }

    @RequestMapping("/search")
    public ModelAndView search() {
        return new ModelAndView("web/search");
    }

    //
    //
    @RequestMapping("/cart")
    ModelAndView cart() {
        ModelAndView mav = new ModelAndView("web/checkout");
        return mav;
    }

    @RequestMapping("/errorHandle")
    ModelAndView error() {
        ModelAndView mav = new ModelAndView("web/error");
        return mav;
    }

    @RequestMapping("bill/{nameBill}")
    public ModelAndView GetBill(@PathVariable("nameBill") String nameBill) throws IOException {
        BillEntity billEntity = billRepository.findByBillName(nameBill);
        ModelAndView modelAndView = new ModelAndView("/web/chitietlichsu");
        if (billEntity.getCreatedBy().equals("anonymousUser")) {
            modelAndView.addObject("data", billEntity.getContent());
            modelAndView.addObject("total", new String(billEntity.getTotalMoney()));
        } else {
            if (SecurityUtils.isAuthenticanted()) {
                if (SecurityUtils.getPrincipal().getUsername().equals(billEntity.getCreatedBy())) {
                    modelAndView.addObject("data", billEntity.getContent());
                    modelAndView.addObject("total", new String(billEntity.getTotalMoney()));
                } else {
                    modelAndView.addObject("total", 0);
                    modelAndView.addObject("data", "error");
                }
            } else {
                modelAndView.addObject("data", "error");
                modelAndView.addObject("total", new String(billEntity.getTotalMoney()));
            }
        }

        return modelAndView;
    }

    @RequestMapping("tracking/{nameBill}")
    public ModelAndView GetTracking(@PathVariable("nameBill") String nameBill) throws IOException {
        BillEntity billEntity = billRepository.findByBillName(nameBill);
        ModelAndView modelAndView = new ModelAndView("/web/chitietdonhang");
        modelAndView.addObject("details", "123");
        modelAndView.addObject("status", billEntity.getStatus());
        if (billEntity.getCreatedBy().equals("anonymousUser")) {
            modelAndView.addObject("data", billEntity.getContent());
            modelAndView.addObject("details", billEntity.getDetails());
            modelAndView.addObject("total", new String(billEntity.getTotalMoney()));
        } else {
            if (SecurityUtils.isAuthenticanted()) {
                if (SecurityUtils.getPrincipal().getUsername().equals(billEntity.getCreatedBy())) {
                    modelAndView.addObject("data", billEntity.getContent());
                    modelAndView.addObject("total", new String(billEntity.getTotalMoney()));
                    modelAndView.addObject("details", billEntity.getDetails());
                } else {
                    modelAndView.addObject("total", 0);
                    modelAndView.addObject("data", "error");
                }
            } else {
                modelAndView.addObject("data", "error");
                modelAndView.addObject("total", new String(billEntity.getTotalMoney()));
            }
        }

        return modelAndView;
    }

    @RequestMapping(value = "/checkout", method = RequestMethod.POST)
    String checkout(@RequestParam("content") String content, @RequestParam("name") String name
            , @RequestParam("address") String address, @RequestParam("phone") String phone
            , @RequestParam("email") String email) throws IOException {
        try {
            String nameBill = Utils.GetNameBill();
            ObjectMapper mapper = new ObjectMapper();
            BillEntity billEntity = new BillEntity();
            billEntity.setBillName(nameBill);
            billEntity.setStatus(0);
            BigInteger totalMoney = new BigInteger("0");
            JsonNode nodes = mapper.readTree(content);
            JSONArray jsonArray = new JSONArray();
            for (JsonNode single : nodes) {
                ProductEntity productEntity = productRepository.findById((long) single.get("id").asInt());
                JsonNode sizeData = mapper.readTree(productEntity.getSize());
                if (sizeData.get(single.get("size").asText()).asInt() < single.get("amount").asInt()) {
                    throw new Exception("Error Amount at checkout controller");
                } else {
                    productEntity.setSold(productEntity.getSold() + single.get("amount").asInt());
                    ((ObjectNode) sizeData).put(single.get("size").asText(), sizeData.get(single.get("size").asText()).asInt() - single.get("amount").asInt());
                    productEntity.setSize(sizeData.toString());
                    productRepository.save(productEntity);
                }
                JSONObject json = new JSONObject();
                json.put("id", productEntity.getId());
                json.put("price", (new BigInteger(productEntity.getPrice().replaceAll("\\D+", "")).multiply(new BigInteger(single.get("amount").asText()))).toString());
                json.put("img", productEntity.getUrl1());
                json.put("amount", single.get("amount").asInt());
                json.put("name", productEntity.getName());
                json.put("size", single.get("size").asText());
                jsonArray.put(json);
                totalMoney = totalMoney.add(new BigInteger(productEntity.getPrice().replaceAll("\\D+", "")).multiply(new BigInteger(single.get("amount").asText())));
            }
            JSONObject jsonObject = new JSONObject();
            JSONArray array = new JSONArray();
            Date date = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");
            formatter.setTimeZone(TimeZone.getTimeZone("GMT+7"));
            jsonObject.put("date", formatter.format(date));
            jsonObject.put("content", "Đã tiếp nhận đơn hàng");
            array.put(jsonObject);
            billEntity.setDetails(array.toString());
            billEntity.setContent(jsonArray.toString());
            billEntity.setTotalMoney(totalMoney.toString());
            billEntity.setPaymentMethod("COD");
            PayerEntity payerEntity = new PayerEntity();
            payerEntity.setName(name);
            payerEntity.setEmail(email);
            payerEntity.setAddress(address);
            payerEntity.setPhone(phone);
            billEntity.setPayerEntity(payerEntity);
            payerEntity.setBillEntity(billEntity);
            billRepository.save(billEntity);
            emailService.SendMailConfirmBill(billEntity);
            return "redirect:/bill/" + nameBill;
        } catch (Exception e) {
            System.out.println(e.toString());
            return "redirect:/cart?error";
        }

    }

    //checkout Paypal
    @RequestMapping(value = "/checkout/paypal", method = RequestMethod.POST)
    String Paypal(@RequestParam("content") String content, @RequestParam("name") String name
            , @RequestParam("address") String address, @RequestParam("phone") String phone
            , @RequestParam("email") String email, HttpServletRequest request) {
        try {
            String nameBill = Utils.GetNameBill();
            ObjectMapper mapper = new ObjectMapper();
            BillEntity billEntity = new BillEntity();
            billEntity.setBillName(nameBill);
            billEntity.setStatus(0);
            BigInteger totalMoney = new BigInteger("0");
            JsonNode nodes = mapper.readTree(content);
            JSONArray jsonArray = new JSONArray();
            for (JsonNode single : nodes) {
                ProductEntity productEntity = productRepository.findById((long) single.get("id").asInt());
                JsonNode sizeData = mapper.readTree(productEntity.getSize());
                if (sizeData.get(single.get("size").asText()).asInt() < single.get("amount").asInt()) {
                    throw new Exception("Error Amount at checkout controller");
                } else {
                    productEntity.setSold(productEntity.getSold() + single.get("amount").asInt());
                    ((ObjectNode) sizeData).put(single.get("size").asText(), sizeData.get(single.get("size").asText()).asInt() - single.get("amount").asInt());
                    productEntity.setSize(sizeData.toString());
                    productRepository.save(productEntity);
                }
                JSONObject json = new JSONObject();
                json.put("id", productEntity.getId());
                json.put("price", (new BigInteger(productEntity.getPrice().replaceAll("\\D+", "")).multiply(new BigInteger(single.get("amount").asText()))).toString());
                json.put("img", productEntity.getUrl1());
                json.put("amount", single.get("amount").asInt());
                json.put("name", productEntity.getName());
                json.put("size", single.get("size").asText());
                jsonArray.put(json);
                totalMoney = totalMoney.add(new BigInteger(productEntity.getPrice().replaceAll("\\D+", "")).multiply(new BigInteger(single.get("amount").asText())));
            }
            JSONObject jsonObject = new JSONObject();
            JSONArray array = new JSONArray();
            Date date = new Date();
            SimpleDateFormat formatter = new SimpleDateFormat("dd-M-yyyy hh:mm:ss");
            formatter.setTimeZone(TimeZone.getTimeZone("GMT+7"));
            jsonObject.put("date", formatter.format(date));
            jsonObject.put("content", "Đã tiếp nhận đơn hàng");
            array.put(jsonObject);
            billEntity.setDetails(array.toString());
            billEntity.setContent(jsonArray.toString());
            billEntity.setTotalMoney(totalMoney.toString());
            billEntity.setPaymentMethod("PAYPAL");
            PayerEntity payerEntity = new PayerEntity();
            payerEntity.setName(name);
            payerEntity.setEmail(email);
            payerEntity.setAddress(address);
            payerEntity.setPhone(phone);

            try {
                Payment payment = paypalService.createPayment(
                        totalMoney.doubleValue() / 22000,
                        "USD",
                        "paypal",
                        "sale",
                        "payment description",
                        "https://newbrandshop.online/checkout/paypal/cancel",
                        "https://newbrandshop.online/checkout/paypal/success");
                request.getSession().setAttribute("bill", billEntity);
                request.getSession().setAttribute("payer", payerEntity);
                for (Links links : payment.getLinks()) {
                    if (links.getRel().equals("approval_url")) {
                        return "redirect:" + links.getHref();
                    }
                }
            } catch (PayPalRESTException e) {
                return "/error";
            }
        } catch (Exception e) {
            System.out.println(e.toString());
            return "redirect:/cart?error";
        }
        return "/error";
    }

    @RequestMapping("/checkout/paypal/cancel")
    public String cancelPay() {
        return "redirect:/cart?error";
    }

    @RequestMapping("/checkout/paypal/success")
    public String successPay(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId, HttpServletRequest request) {
        BillEntity billEntity = (BillEntity) request.getSession().getAttribute("bill");
        PayerEntity payerEntity=(PayerEntity)request.getSession().getAttribute("payer");
        billEntity.setPayerEntity(payerEntity);
        payerEntity.setBillEntity(billEntity);
        try {
            Payment payment = paypalService.executePayment(paymentId, payerId);
            if (payment.getState().equals("approved")) {
                billRepository.save(billEntity);
                return "redirect:/bill/" + billEntity.getBillName();
            }
        } catch (PayPalRESTException e) {

        }
        return "redirect:/cart?error";
    }

}
