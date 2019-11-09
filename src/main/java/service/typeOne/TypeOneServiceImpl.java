package service.typeOne;

import dao.typeOne.TypeOneDao;
import entity.TypeOne;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("typeoneservice")
public class TypeOneServiceImpl implements TypeOneService{
    @Resource
    private TypeOneDao typeOnedao;


    @Override
    public List<TypeOne> selectOnes() {
        return typeOnedao.selectOnes();
    }
}
