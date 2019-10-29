package service.admin;

import entity.Admin;

public interface AdminService {

	
	Admin getAdminByName(String name);
	
	int updatePwdByName(String name, String pwd);
}
