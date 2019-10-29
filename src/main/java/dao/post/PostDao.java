package dao.post;

import java.util.List;

import entity.Post;



public interface PostDao {
	List<Post> selectType();
	
	
	List<Post> getPostByTypeOrAddress(String type, String address, int levelType);
	
	List<Post> selectYingBytage(int pageno, int pagesize, String typeId, String address, int levle);

	int countYing(String typeId, String addressId, int level);
	
	int insertPost(Post post);
	
	int updatePost(Post post);
	
	int deletepost(int id);
}
