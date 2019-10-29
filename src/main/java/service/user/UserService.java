package service.user;

import entity.User;

public interface UserService {
	int inserJianLi(User uer);

	User getUserByPhone(String phone);

	int updateuser(User user);
	
	int addUser(User user);
	
	int updateEmail(String Phone, String email);
	
	int updatePwd(String pwd, String phone);
}
