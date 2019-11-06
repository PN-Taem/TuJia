package controller;

import entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.user.UserService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
   private UserService userService;
    @RequestMapping("/index.html")
    public String index(String opr,HttpSession session){
        return "shouye";
    }
    @RequestMapping("/login.html")
    public String login(){
        return "index";
    }

    @RequestMapping(value ="/doLogin",method = RequestMethod.POST)
    @ResponseBody
    public boolean doLogin(String phone, String passWord, HttpSession session){
        User user=userService.getUserByPhone(phone);
        System.out.println(phone);
        System.out.println(user.getPwd());
        System.out.println(passWord);
        if (user==null){
            session.setAttribute("loing", false);
            System.out.println(false);
            return false;
            }else{
                if (user.getPwd().equals(passWord)){
                    System.out.println(false);
                    session.setAttribute("user",user);
                    session.setAttribute("loing", true);
                    return true;
                }else{
                    System.out.println(true);
                    session.setAttribute("loing", false);
                    return false;
                }
        }
    }
}
