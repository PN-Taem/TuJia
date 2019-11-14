package service.apply;

import java.util.List;

import entity.Apply;
import org.apache.ibatis.annotations.Param;

public interface ApplyService {
	List<Apply> selectAll(String phone);

	int deleteApply(int id);

	int addApply(Apply apply);

	int updateAppky(@Param("apply") Apply apply);
}
