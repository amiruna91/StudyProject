package com.simple.service;

import com.simple.dao.UserDao;
import com.simple.vo.User;

public class UserService {

	private UserDao userDao = new UserDao();
	
	// 새 사용자 가입 서비스
	public boolean addNewUser(User user) throws Exception {
		// 전달받은 사용자 아이디로 사용자 정보를 조회한다.
		// 사용자 정보가 존재하면 false를 반환한다.
		User otherUser = userDao.getUserById(user.getId());
		
		if (otherUser != null) {
			return false;
		}
		
		// 사용자 정보가 존재하지 않으면 전달받은 사용자정보를 저장한다.
		// true를 반환한다.
		userDao.insertUser(user);
		return true;
	}
	
	// 사용자 로그인 서비스
	public User loginCheck(String id, String password) throws Exception {
		// 전달받은 아이디로 사용자 정보를 조회한다.
		// 사용자 정보가 존재하지 않으면 null 반환
		// 비밀번호가 일치하지 않으면 null 반환
		// 그 외는 조회된 사용자 정보를 반환한다.
		User savedUser = userDao.getUserById(id);
		
		if (savedUser == null) {
			return null;
		}
		
		if (!savedUser.getPassword().equals(password)){
			return null;
		}
		
		return savedUser;
	}
}
