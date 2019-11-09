package service.typeThree;

import dao.typeThree.TypeThreeDao;
import entity.TypeThree;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("typethreeservice")
public class TypeThreeServiceImpl implements TypeThreeService{
    @Resource
    private TypeThreeDao typeThreeDao;
    @Override
    public List<TypeThree> selectThree(int id, int id2) {
        return null;
    }
    @Override
    public List<TypeThree> selectThree() {
        return null;
    }
}
