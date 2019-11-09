package service.typeTwo;

import dao.typeTwo.TypeTwoDao;
import entity.TypeTwo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("typetwoservice")
public class TypeTwoServiceImpl implements TypeTwoService {
@Resource
private TypeTwoDao typeTwoDao;
    @Override
    public List<TypeTwo> selecttypeTwo(int id) {
        return typeTwoDao.selecttypeTwo1(id);
    }

    @Override
    public List<TypeTwo> selecttypeTwo() {
        return typeTwoDao.selecttypeTwo();
    }
}
