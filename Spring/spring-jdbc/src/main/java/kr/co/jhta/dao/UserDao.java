package kr.co.jhta.dao;

import java.util.List;

import kr.co.jhta.vo.User;

public interface UserDao {

	void insertUser(User user);
	void deleteAllUser();
	void deleteUserById(String userId);
	void updateUser(User user);
	User getUserById(String userId);
	List<User> getAllUser();
	List<User> getUserByName(String userName);
}
