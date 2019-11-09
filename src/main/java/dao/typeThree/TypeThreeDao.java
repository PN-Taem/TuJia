package dao.typeThree;

import java.util.List;

import entity.TypeThree;
import org.apache.ibatis.annotations.Param;

public interface TypeThreeDao {
List<TypeThree> selectThree2(@Param("id")int id1,@Param("id2")int id2);
List<TypeThree> selectThree();
}
