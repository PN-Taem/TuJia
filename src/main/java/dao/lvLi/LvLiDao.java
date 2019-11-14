package dao.lvLi;

import entity.LvLi;
import org.apache.ibatis.annotations.Param;

public interface LvLiDao {

	int getAddLvLi(@Param("lv") LvLi lv);

}
