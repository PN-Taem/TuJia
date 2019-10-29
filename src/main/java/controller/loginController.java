package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("login")
public class loginController {
    @RequestMapping(value = "/login")
    private String login(){
        return "login";
    }
}
