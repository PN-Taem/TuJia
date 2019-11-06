package dao.user;

import entity.User;


public interface UserDao {
	int inserJianLi(User uer);

	User getUserByPhone(String phone);

	int addUser(User user);
	
	int updeteuser(User user);
	
	int updateEmail(String Phone, String email);
	
	int updatePwd(String pwd, String phone);
}
