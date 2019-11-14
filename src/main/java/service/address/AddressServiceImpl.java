package service.address;

import dao.address.AddressDao;
import entity.Address;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service("addRessservice")
public class AddressServiceImpl implements AddressService{
    @Resource
    private AddressDao addressDao;
    @Override
    public List<Address> getAddressesList() {
        return addressDao.getAddressesList();
    }
}
