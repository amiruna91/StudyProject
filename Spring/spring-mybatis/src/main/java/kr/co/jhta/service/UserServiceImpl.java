package kr.co.jhta.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.dao.UserDao;
import kr.co.jhta.exception.DuplicatedUserException;
import kr.co.jhta.exception.UnauthenticatedUserException;
import kr.co.jhta.vo.User;

/**
 * 사용자에게 제공되는 서비스를 직접 구현하는 구현 클래스
 * @author USER
 *
 */
@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;

	@Override
	public void addNewUser(User user) {
		User savedUser = userDao.getUserById(user.getId());
		if (savedUser != null) {
			throw new DuplicatedUserException("["+user.getId()+"]는 사용할 수 없는 아이디 입니다.");
		}
		
		userDao.insertUser(user);
	}

	@Override
	public User login(String id, String password) {
		User user = userDao.getUserById(id);
		if (user == null) {
			throw new UnauthenticatedUserException("아이디 혹은 비밀번호가 올바르지 않습니다.");
		}
		if (!user.getPassword().equals(password)) {
			throw new UnauthenticatedUserException("아이디 혹은 비밀번호가 올바르지 않습니다.");
		}
		
		return user;
	}
	
	
}
