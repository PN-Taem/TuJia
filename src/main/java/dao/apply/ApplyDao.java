package dao.apply;

import java.util.List;

import entity.Apply;
import org.apache.ibatis.annotations.Param;

public interface ApplyDao {
	List<Apply> selectAll(String phone);
	
	int deleteApply(int id);

	int addApply(@Param("apply") Apply apply);
	
	int updateAppky(@Param("apply") Apply apply);
}
