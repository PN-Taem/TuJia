package dao.typeTwo;

import java.util.List;

import entity.TypeTwo;

public interface TypeTwoDao {
	List<TypeTwo> selecttypeTwo(int id);
	List<TypeTwo> selecttypeTwo();
}
