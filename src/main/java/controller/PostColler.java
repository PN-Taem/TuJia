package controller;


import entity.Post;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import service.post.PostService;
import tools.Constants;
import tools.PageSupport;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;
@Controller
//@RequestMapping("/post")
//控制层

public class PostColler {
    @Resource
    private PostService postService;
    @RequestMapping("/login.html")
    public String login(){
        return "index";
    }

    //显示招聘的所有
        @RequestMapping("/selectAll.html")
    public String postLis7t(HttpServletRequest request) {
        //查询列表
        String pageIndex = request.getParameter("pageIndex");
        int postListRole = 0;
        List<Post> postList = null;
        //设置页面容量
        int pageSize = Constants.pageSize;
        //当前页码
        int currentPageNo = 1;

            System.out.println(pageIndex);
        if (pageIndex != null) {

                currentPageNo = Integer.valueOf(pageIndex);

        }

        //总数量
        int totalCount = postService.getPostCount();

        //总页数
        PageSupport pages = new PageSupport();
        pages.setCurrentPageNo(currentPageNo);
        pages.setPageSize(pageSize);
        pages.setTotalCount(totalCount);

        int totalPageCount = pages.getTotalPageCount();

        //控制首页和尾页
        if (currentPageNo < 1) {
            currentPageNo = 1;
        } else if (currentPageNo > totalPageCount) {
            currentPageNo = totalPageCount;
        }
        postList = postService.selectType();

        request.setAttribute("postList", postList);
        request.setAttribute("totalPageCount", totalPageCount);
        request.setAttribute("totalCount", totalCount);
        request.setAttribute("currentPageNo", currentPageNo);
        for (Post list : postList) {
                System.out.println(list.getTypeName()+"++++++"+list.getAddress()+"++++++"+list.getPostid()==null);
            }
        return "ZhaoPin";
    }


}
