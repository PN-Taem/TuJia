package service.apply;

import dao.apply.ApplyDao;
import entity.Apply;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("applyService")
public class ApplyServiceImpl implements ApplyService{
    @Resource
    private ApplyDao applyDao;
    @Override
    public List<Apply> selectAll(String phone) {
        return applyDao.selectAll(phone);
    }

    @Override
    public int deleteApply(int id) {
        return applyDao.deleteApply(id);
    }

    @Override
    public int addApply(Apply apply) {
        return applyDao.addApply(apply);
    }

    @Override
    public int updateAppky(Apply apply) {
        return applyDao.updateAppky(apply);
    }
}
