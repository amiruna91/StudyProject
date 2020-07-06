package com.simple.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.simple.util.JdbcHelper;
import com.simple.util.JdbcHelper.RowMapper;
import com.simple.util.QueryUtil;
import com.simple.vo.User;

public class UserDao {

	public User getUserById(String userId) throws SQLException {
		return JdbcHelper.selectOne(QueryUtil.getSQl("user.getUserById"), new RowMapper<User>() {
			@Override
			public User mapRow(ResultSet rs) throws SQLException {
				User user = new User();
				user.setId(rs.getString("user_id"));
				user.setPassword(rs.getString("user_password"));
				user.setName(rs.getString("user_name"));
				user.setEmail(rs.getString("user_email"));
				user.setPoint(rs.getInt("user_point"));
				user.setRegisteredDate(rs.getDate("user_registered_date"));
				return user;
			}
		}, userId);
	}
}
