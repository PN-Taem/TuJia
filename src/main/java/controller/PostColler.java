package controller;

import dao.address.AddressDao;
import dao.typeTwo.TypeTwoDao;
import entity.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.address.AddressService;
import service.post.PostService;
import service.typeOne.TypeOneService;
import service.typeThree.TypeThreeService;
import service.typeTwo.TypeTwoService;
import tools.Constants;
import tools.MyUTF;
import tools.PageSupport;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.event.ListDataEvent;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/post")
//控制层
public class PostColler {
    @Resource
    private PostService postService;
    @Resource
    private TypeOneService one;
    @Resource
    private TypeTwoService two;
    @Resource
    private TypeThreeService typeThreeService;
    @Resource
    private AddressService addressService;
    @Resource
    private  PostService post;

    //显示招聘的所有
    @RequestMapping("/selectAll.html")
    public String postLis7t(HttpServletRequest request, HttpSession session) {
        String opr=request.getParameter("opr");
        String baoString=request.getParameter("caozuo");
        session.setAttribute("caozuo", baoString);
        //获取类型表信息
        List<TypeOne> listone=one.selectOnes();
        List<TypeOne> typeList=new ArrayList<TypeOne>();
        for (TypeOne lone : listone) {
            typeList.add(lone);
            List<TypeTwo> listtwo=two.selecttypeTwo(lone.getId());
            if (listtwo!=null) {
                for (TypeTwo typeTwo : listtwo) {
                    typeList.add(typeTwo);
                    List<TypeThree> thelisThrees=typeThreeService.selectThree(lone.getId(),typeTwo.getId());
                    if (thelisThrees!=null){
                        for (TypeTwo typeThree : thelisThrees) {
                            typeList.add(typeThree);
                        }
                    }
                }
            }
        }
        //	List<Post> postList=null;
        PageYing py=null;
        int pageNo=1;
        if (request.getParameter("pageNo")!=null) {
            pageNo=Integer.parseInt(request.getParameter("pageNo"));
        }

        py=new PageYing();

        py.setPageNo(pageNo);
        String typeName=null;
        String typeName2="";
        String youname=request.getParameter("yourName");
        if (youname==null) {
            youname="-1";
        }
        System.out.println("youname"+youname);
        String typeid=youname;
        String addressId=request.getParameter("addressName");//地点id
        if (addressId==null) {
            addressId="-1";
        }
//			System.out.println(request.getParameter("souName"));
        if (!typeid.equals("-1")) {
            typeName=request.getParameter("souName");
            session.setAttribute("souname", typeName);
            typeName2=typeName.substring(0,typeName.lastIndexOf("-")+1);
        }
        session.setAttribute("yourName",youname);
        session.setAttribute("addressName",addressId);
        if (typeid.equals("-1")&&addressId.equals("-1")) {
            post.fengyePage(py, null, null, 0);

        }else{
            addressId=request.getParameter("addressName");
            if (typeid.equals("-1")) {
                typeid=null;
            }if (addressId.equals("-1")) {
                addressId=null;
            }
            //获取职位表信息
            //System.out.println("类型Id:"+typeid+"  地址id"+addressId+" 级别"+typeName2.length()+" 页码"+pageNo);
            post.fengyePage(py, typeid, addressId, typeName2.length());
        }
        //获取地点信息
        List<Address> addressesList = addressService.getAddressesList();
        request.getSession().setAttribute("posts", py);//职位表
        System.out.println(py.getYings().toString());
        session.setAttribute("addressList", addressesList);//地址表
        session.setAttribute("list", typeList);//类型表
        String addressIndex=request.getParameter("addressNameIndex");
        String typeIndex=request.getParameter("yourNameIndex");
        if (addressIndex==null&&typeIndex==null) {
            addressIndex=0+"";
            typeIndex=0+"";
        }
        //System.out.println("总页码"+py.getTotalPage()+"   当前页码"+py.getPageNo());
        String list=py.getYings().size()+"";
        session.setAttribute("size", list);
        session.setAttribute("addressIndex", addressIndex);
        session.setAttribute("typeIndex", typeIndex);
        return "ZhaoPin";
    }


}
