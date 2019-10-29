package dao.apply;

import java.util.List;

import entity.Apply;

public interface ApplyDao {
	List<Apply> selectAll(String phone);
	
	int deleteApply(int id);
	
	int addApply(Apply apply);
	
	int updateAppky(Apply apply);
}
