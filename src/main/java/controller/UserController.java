package controller;

import entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.user.UserService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
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


    @RequestMapping(value ="/doLogin",method = RequestMethod.POST)
    @ResponseBody
    public boolean doLogin(String phone, String passWord, HttpSession session){
        User user=userService.getUserByPhone(phone);
        System.out.println(user.getPhone().equals(phone));
        if (user==null){
            session.setAttribute("loing", false);
            return false;
            }else{
                if (user.getPwd().equals(passWord)){
                    System.out.println(user.getPhone());
                    session.setAttribute("user",user);
                    session.setAttribute("loing", true);
                    return true;
                }else{
                    session.setAttribute("loing", false);
                    return false;
                }
        }
    }
    @RequestMapping(value ="/dozhuce")
    public String dozhuce(@RequestParam(value = "zphone",required = false)String zphone,
                          @RequestParam(value = "zemail",required = false)String zemail,
                          @RequestParam(value = "zpassWord",required = false)String zpassWord,
                          HttpSession session) {
            User user=new User();
            user.setEmail(zemail);
            user.setPwd(zpassWord);
            user.setPhone(zphone);
           int count= userService.addUser(user);
        System.out.println(zphone);
        if (count==1) {
           session.setAttribute("user", user);
            session.setAttribute("loing", true);
        return "shouye";
        }else{
            return "add";
        }
    }
    @RequestMapping("/add.html")
    public String add(){
        return "add";
    }

    @RequestMapping(value ="/dophone",method = RequestMethod.POST)
    @ResponseBody
    public boolean phone(HttpSession session,@RequestParam(value = "phone",required = false)String phone){
        User u=userService.getUserByPhone(phone);
        System.out.println(u);
        if(u!=null){
            System.out.println(phone);
            return false;
        }else{
            System.out.println(phone);
            return true;
        }

    }
}
