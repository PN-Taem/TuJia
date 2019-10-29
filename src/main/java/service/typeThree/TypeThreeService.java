package service.typeThree;

import java.util.List;

import entity.TypeThree;

public interface TypeThreeService {
	List<TypeThree> selectThree(int id, int id2);
	List<TypeThree> selectThree();
}
