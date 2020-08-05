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
		// TODO Auto-generated method stub
		
	}
	
	
}
