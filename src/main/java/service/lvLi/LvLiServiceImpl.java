package service.lvLi;

import dao.lvLi.LvLiDao;
import entity.LvLi;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
@Service("lvLiService")
public class LvLiServiceImpl implements LvLiService {
@Resource
private LvLiDao liDao;
    @Override
    public int getAddLvLi(LvLi lv) {
        return liDao.getAddLvLi(lv);
    }
}
