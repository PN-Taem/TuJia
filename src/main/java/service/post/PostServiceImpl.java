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
        return null;
    }

    @Override
    public void fengyePage(PageYing pageYing, String typeId, String address, int levle) {

    }

    @Override
    public int insertPost(Post post) {
        return 0;
    }

    @Override
    public int updatePost(Post post) {
        return 0;
    }

    @Override
    public int deletepost(int id) {
        return 0;
    }
}
