package dao.typeThree;

import java.util.List;

import entity.TypeThree;

public interface TypeThreeDao {
List<TypeThree> selectThree(int id1, int id2);
List<TypeThree> selectThree();
}
