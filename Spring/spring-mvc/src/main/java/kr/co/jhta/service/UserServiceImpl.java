package kr.co.jhta.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.jhta.dao.UserDao;
import kr.co.jhta.vo.User;

@Transactional
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Override
	public User getUserDetail(String userId) {
		return userDao.getUserById(userId);
	}

	@Override
	public void addNewUser(User user) {
		userDao.insertUser(user);
	}

	@Override
	public User login(String userId, String userPwd) {
		User user = userDao.getUserById(userId);
		
		if (user == null) {
			return null;
		}
		
		if (!user.getPassword().equals(userPwd)) {			
			return null;
		}
		return user;
	}
	
}
