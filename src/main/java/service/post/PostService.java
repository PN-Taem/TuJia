package service.post;

import java.util.List;

import entity.PageYing;
import entity.Post;

public interface PostService {
	
	List<Post> selectType();
	List<Post> getPostByTypeOrAddress(String type, String address, int levelType);

	void fengyePage(PageYing pageYing, String typeId, String address, int levle);
	
	int insertPost(Post post);
	
	int updatePost(Post post);

	int deletepost(int id);
}
