package service.post;

import dao.post.PostDao;
import entity.PageYing;
import entity.Post;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("postService")
public class PostServiceImpl implements PostService {

    @Resource
    private PostDao postDao;
    @Override
    public List<Post> selectType() {

        return postDao.selectType();
    }

    @Override
    public int getPostCount(){
        int count = 0;
        try {
            count = postDao.getPostCount();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return count;
    }


    @Override
    public List<Post> getPostByTypeOrAddress(String type, String address, int levelType) {
        return postDao.getPostByTypeOrAddress(type,address,levelType);
    }

    @Override
    public void fengyePage(PageYing pageYing, String typeId, String address, int levle) {
        System.out.println("typeId"+typeId+"address"+address+"levle"+levle);
        int size=postDao.countYing(typeId,address,levle);
        pageYing.setTotalCount(size);
        List<Post> list=postDao.selectYingBytage((pageYing.getPageNo()-1)*5, pageYing.getPagesize(),typeId,address,levle);
        pageYing.setYings(list);
    }

    @Override
    public int insertPost(Post post) {
        return postDao.insertPost(post);
    }

    @Override
    public int updatePost(Post post) {
        return postDao.updatePost(post);
    }

    @Override
    public int deletepost(int id) {
        return postDao.deletepost(id);
    }
}
