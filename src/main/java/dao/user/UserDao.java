package dao.user;

import entity.User;
import org.apache.ibatis.annotations.Param;


public interface UserDao {
	int inserJianLi(User uer);

	User getUserByPhone(String phone);

	int addUser(@Param("user") User user);
	
	int updeteuser(User user);
	
	int updateEmail(String Phone, String email);
	
	int updatePwd(String pwd, String phone);
}
