package dao.post;

import java.util.List;

import entity.Post;
import org.apache.ibatis.annotations.Param;


public interface PostDao {

   //	显示所有
	List<Post> selectType();

	//总数量
	public int getPostCount();

	List<Post> getPostByTypeOrAddress( @Param("type") String type,
									   @Param("address")  String address,
									  @Param("levelType") int levelType);
	
	List<Post> selectYingBytage(@Param("pageno")int pageno, @Param("pagesize")int pagesize,
								@Param("typeId")String typeId,@Param("address") String address,
								@Param("levle")int levle);

	int countYing(@Param("typeId") String typeId,@Param("addressId")String addressId,
				  @Param("level") int level);
	
	int insertPost(Post post);
	
	int updatePost(Post post);
	
	int deletepost(int id);
}
