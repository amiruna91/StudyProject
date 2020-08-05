package kr.co.jhta.dao;

import kr.co.jhta.vo.User;

public interface UserDao {

	User getUserById(String userId);
	void insertUser(User user);
}
