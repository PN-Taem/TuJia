package service.apply;

import java.util.List;

import entity.Apply;

public interface ApplyService {
	List<Apply> selectAll(String phone);
	
	int deleteApply(int id);
	
	int addApply(Apply apply);
	
	int updateAppky(Apply apply);
}
