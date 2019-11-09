package dao.post;


import entity.Post;
import service.post.PostService;
import service.post.PostServiceImpl;

import javax.annotation.Resource;
import java.util.List;

public class Test {
    public static void main(String [] args){
        PostService postService=new PostServiceImpl();
       List<Post> list= postService.selectType();
        System.out.println(list.size());
        for (Post item:list) {
            System.out.println(item.getPostid());
        }
    }
}
