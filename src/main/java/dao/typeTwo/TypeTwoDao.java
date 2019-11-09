package dao.typeTwo;

import java.util.List;

import entity.TypeTwo;
import org.apache.ibatis.annotations.Param;

public interface TypeTwoDao {
	List<TypeTwo> selecttypeTwo1(@Param("id") int id);
	List<TypeTwo> selecttypeTwo();
}
