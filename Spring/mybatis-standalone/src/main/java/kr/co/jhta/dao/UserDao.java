package kr.co.jhta.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.jhta.util.MybatisUtil;
import kr.co.jhta.vo.User;

public class UserDao {

	public void insertUser(User user) {
		SqlSession session = MybatisUtil.getSqlSession();
		
		try {
			session.insert("insertUser", user);
			session.commit();
		} finally {
			session.close();
		}
	}
	

	public void deleteAllUsers() {
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			session.delete("deleteAllUsers");
			session.commit();
		} finally {
			session.close();
		}
	}

	public void deleteUserById(String userId) {
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			session.delete("deleteUserById", userId);
			session.commit();
		} finally {
			session.close();
		}
	}

	public void updateUser(User user) {
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			session.update("updateUser", user);
			session.commit();
		} finally {
			session.close();
		}
	}

	// select: N행N열, parameter: 없음, result:User, 최종값: List<User>
	public List<User> getAllUsers() {
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			List<User> users = session.selectList("getAllUsers");
			return users;
		} finally {
			session.close();
		}
	}

	public List<User> getUsersByNames(String userName) {
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			List<User> users = session.selectList("getUsersByNames", userName);
			return users;
		} finally {
			session.close();
		}
	}

	public User getUserById(String userId) {
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			User user = session.selectOne("getUserById", userId);
			return user;
		} finally {
			session.close();
		}
	}

	public User getUserByEmail(String userEmail) {
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			User user = session.selectOne("getUserByEmail", userEmail);
			return user;
		} finally {
			session.close();
		}
	}
	
	// select: 1행 1열, parameter:없음, result:int, 최종값:int
	public int getUsersCount() {
		SqlSession session = MybatisUtil.getSqlSession();
		try {
			return session.selectOne("getUsersCount");
		} finally {
			session.close();
		}
	}
}
