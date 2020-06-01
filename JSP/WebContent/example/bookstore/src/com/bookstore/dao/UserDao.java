package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bookstore.util.ConnectionUtil;
import com.bookstore.util.QueryUtil;
import com.bookstore.vo.User;

public class UserDao {

	public List<User> getNewUsers() throws Exception {
		List<User> users = new ArrayList<User>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQl("user.getNewUsers"));
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			User user = new User();
			
			user.setId(rs.getString("user_id"));
			user.setName(rs.getString("user_name"));
			user.setEmail(rs.getString("user_email"));
			user.setRegeisteredDate(rs.getDate("user_registered_date"));
			
			users.add(user);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return users;
	}
	
	public User getUserById(String userId) throws Exception {
		User user = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQl("user.getUserById"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			user = new User();
			
			user.setId(rs.getString("user_id"));
			user.setName(rs.getString("user_name"));
			user.setPassword(rs.getString("user_password"));
			user.setEmail(rs.getString("user_email"));
			user.setPoint(rs.getInt("user_point"));
			user.setRegeisteredDate(rs.getDate("user_registered_date"));
			
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return user;
	}
	
	
	public List<User> getAllUser() throws Exception {
		List<User> users = new ArrayList<User>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQl("user.getAllUsers"));
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			User user = new User();
			
			user.setId(rs.getString("user_id"));
			user.setName(rs.getString("user_name"));
			user.setEmail(rs.getString("user_email"));
			user.setPoint(rs.getInt("user_point"));
			user.setRegeisteredDate(rs.getDate("user_registered_date"));
			
			users.add(user);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return users;
	}
}
