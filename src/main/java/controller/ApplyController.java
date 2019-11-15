package controller;

import entity.Apply;
import entity.LvLi;
import entity.Post;
import entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import service.apply.ApplyService;
import service.lvLi.LvLiService;
import service.post.PostService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequestMapping("apply")
public class ApplyController {
    @Resource
    private ApplyService applyService;
    @Resource
    private PostService postService;
    @Resource
    private LvLiService lvLiService;

    @RequestMapping(value = "/tougao.html")
    public String tougao(@RequestParam(value = "posid", required = false) String posid, HttpSession session) {
        session.setAttribute("pid", posid);
        return "amdin1";
    }

    //个人
    @RequestMapping(value = "/caozuobao.html")
    public String caozuogbao(HttpSession session, @RequestParam(value = "caozuo", required = false) String caozuo,
                             @RequestParam(value = "pid", required = false) String pid, HttpServletRequest request) {
        session.setAttribute("caozuo", "bao");
        session.setAttribute("bao", "bao");
        User user = (User) request.getSession().getAttribute("user");
        session.setAttribute("user", user);
        List<Post> list = postService.selectType();
        Post p = null;
        for (Post item : list) {
            if (item.getPostid() == Integer.parseInt(pid)) {
                p = item;
                break;
            }
        }
        session.setAttribute("pos", p);
        return "GeRen";
    }

    @RequestMapping(value = "/addApply", method = RequestMethod.POST)
    @ResponseBody
    public boolean add(HttpSession session,
                       @RequestParam(value = "name", required = false) String name,
                       @RequestParam(value = "datetime", required = false) String datetime,
                       @RequestParam(value = "email", required = false) String email,
                       @RequestParam(value = "phone", required = false) String phone,
                       @RequestParam(value = "hang", required = false) String hang,
                       @RequestParam(value = "zhi", required = false) String zhi,
                       @RequestParam(value = "city", required = false) String city,
                       @RequestParam(value = "nan",required = false)String nan,
                       @RequestParam(value = "userName",required = false)String userName,
                       @RequestParam(value = "workday",required = false)String workday,
                       @RequestParam(value = "postAddress",required = false)String postAddress,
                       @RequestParam(value = "postName",required = false)String postName,
                       HttpServletRequest request) {
        Apply u = new Apply();
        User user = (User) request.getSession().getAttribute("user");
        session.setAttribute("user", user);
        u.setName(name);
        u.setSex(nan);
        u.setBirthday(datetime);
        System.out.println(u.getBirthday());
        u.setEmail(email);
        u.setPhone(userName);
        u.setWorkday(workday);
        u.setTaty(hang);
        u.setPost(zhi);
        u.setCity(city);
        u.setAddress(postAddress);
        u.setPostname(postName);
        u.setUserphone(phone);
        int count = applyService.addApply(u);
        if (count != 0) {

            return true;
        } else {
            return false;
        }
    }

    @RequestMapping(value = "/lvli.html")
    public String lvli() {

        return "lvli";
    }

    //履历
    @RequestMapping(value = "/addlvli")
    public boolean addlvli(HttpSession session, HttpServletRequest request) {
        LvLi lv = new LvLi();
        lv.setUnit(request.getParameter("danwei"));
        lv.setPost(request.getParameter("zhiwei"));
        lv.setWorktime(request.getParameter("timeq"));
        lv.setDuty(request.getParameter("zhize"));
        int count = lvLiService.getAddLvLi(lv);
        if (count == 1) {
            return true;
        } else {
            return false;
        }
    }

    @RequestMapping("/toGeRen.html")
    public String toGeRen(HttpSession session){
        User user=(User)session.getAttribute("user");
        List<Apply> list =applyService.selectAll(user.getPhone());
        session.setAttribute("applys",list);
        return "shenqing";
    }

    @RequestMapping("toJianLi.html")
    public String toJianLi(){
        return "Jianli";
    }

    @RequestMapping("toXiuGai.html")
    public String toXiuGai(){
        return "xiugai";
    }
    @RequestMapping("shenQing.html")
    public String shenQing(){
        return "shenqing";
    }

    @RequestMapping(value = "/xiuApy.html")
    public String xiuApy(HttpServletRequest request,HttpSession session){
        User user = (User) request.getSession().getAttribute("user");
        List<Apply> list = applyService.selectAll(user.getPhone());
       String id = request.getParameter("userIdu");

        Apply a = new Apply();
        for (Apply apply2 : list) {
            if (apply2.getId() == Integer.parseInt(id)) {

                a.setAddress(apply2.getAddress());
                a.setBirthday(apply2.getBirthday());
                a.setCity(apply2.getCity());
                a.setEmail(apply2.getEmail());
                a.setId(apply2.getId());
                a.setName(apply2.getName());
                a.setPhone(apply2.getPhone());
                a.setPost(apply2.getPost());
                a.setPostname(apply2.getPostname());
                a.setSex(apply2.getSex());
                a.setState(apply2.getState());
                a.setTaty(apply2.getTaty());
                a.setUserphone(apply2.getUserphone());
                a.setWorkday(apply2.getWorkday());
                System.out.println(a.toString());
                session.setAttribute("applyu", a);
                return "GeRen";
            }
        }

        return "";
    }

    @RequestMapping(value = "/delApy.html")
    public String delApy(HttpServletRequest request, HttpSession session){
        String did=request.getParameter("userIdd");
        User user = (User) request.getSession().getAttribute("user");
        int count = applyService.deleteApply(Integer.parseInt(did));
        if (count == 1) {
            return "redirect:/apply/toGeRen.html";
        } else {
            return "redirect:/apply/toGeRen.html";
        }
    }
}
