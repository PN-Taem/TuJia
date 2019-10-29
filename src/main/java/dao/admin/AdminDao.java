package dao.admin;

import entity.Admin;

public interface AdminDao {

	Admin getAdminByName(String name);
	
	int updatePwdByName(String name, String pwd);
}
