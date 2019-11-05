package dao.post;

import java.util.List;

import entity.Post;
import org.apache.ibatis.annotations.Param;


public interface PostDao {

   //	显示所有
	List<Post> selectType();

	//总数量
	public int getPostCount();

	List<Post> getPostByTypeOrAddress(String type, String address, int levelType);
	
	List<Post> selectYingBytage(int pageno, int pagesize, String typeId, String address, int levle);

	int countYing(String typeId, String addressId, int level);
	
	int insertPost(Post post);
	
	int updatePost(Post post);
	
	int deletepost(int id);
}
