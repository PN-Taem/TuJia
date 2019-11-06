package service.user;

import dao.user.UserDao;
import entity.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("userService")
public class UserServiceImpl implements UserService{
    @Resource
    private UserDao userDao;
    @Override
    public int inserJianLi(User uer) {
        return userDao.inserJianLi(uer);
    }

    @Override
    public User getUserByPhone(String phone) {
        return userDao.getUserByPhone(phone);
    }

    @Override
    public int updateuser(User user) {
        return userDao.updeteuser(user);
    }

    @Override
    public int addUser(User user) {
        return userDao.addUser(user);
    }

    @Override
    public int updateEmail(String phone, String email) {
        return userDao.updateEmail(phone,email);
    }

    @Override
    public int updatePwd(String pwd, String phone) {
        return userDao.updatePwd(pwd,phone);
    }
}
