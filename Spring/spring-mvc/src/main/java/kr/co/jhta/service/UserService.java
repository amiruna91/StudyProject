package kr.co.jhta.service;

import kr.co.jhta.vo.User;

public interface UserService {

	User getUserDetail(String userId);
	void addNewUser(User user);
	User login(String userId, String userPwd);
}
