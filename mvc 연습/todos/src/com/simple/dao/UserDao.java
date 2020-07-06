package com.simple.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.simple.util.JdbcHelper;
import com.simple.util.JdbcHelper.RowMapper;
import com.simple.util.QueryUtil;
import com.simple.vo.User;

public class UserDao {

	public void insertUser(User user) throws SQLException {
		JdbcHelper.insert(QueryUtil.getSQL("user.insertUser"), user.getId(), user.getName(),
				user.getPassword(), user.getEmail());
	}
	
	public User getUserById(String userId) throws SQLException {
		
		return JdbcHelper.selectOne(QueryUtil.getSQL("user.getUserById"), new RowMapper<User>() {
			@Override
			public User mapRow(ResultSet rs) throws SQLException {
				User user = new User();
				user.setId(rs.getString("user_id"));
				user.setName(rs.getString("user_name"));
				user.setPassword(rs.getString("user_password"));
				user.setEmail(rs.getString("user_email"));
				user.setCreateDate(rs.getDate("user_created_date"));
				return user;
			}
		}, userId);
	}
}
