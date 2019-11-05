package service.post;

import java.util.List;

import entity.PageYing;
import entity.Post;

public interface PostService {

	//	显示所有
	List<Post> selectType();

	//总数量
	public int getPostCount();

	List<Post> getPostByTypeOrAddress(String type, String address, int levelType);

	void fengyePage(PageYing pageYing, String typeId, String address, int levle);
	
	int insertPost(Post post);
	
	int updatePost(Post post);

	int deletepost(int id);
}
