package com.withice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.withice.util.ConnectionUtil;
import com.withice.util.QueryUtil;
import com.withice.vo.User;

public class UserDao {

	public void registerUser(User user) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.registerUser"));
		
		pstmt.setString(1, user.getId());
		pstmt.setString(2, user.getPassword());
		pstmt.setString(3, user.getName());
		pstmt.setString(4, user.getTelephone());
		pstmt.setString(5, user.getPhone());
		pstmt.setString(6, user.getSnsCheck());
		pstmt.setString(7, user.getEmail());
		pstmt.setString(8, user.getGender());
		pstmt.setString(9, user.getBirth());
		pstmt.setString(10, user.getLocation());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public User getUserSimpleInfo(String userId) throws SQLException {
		User user = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.getUserSimpleInfo"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			user = new User();
			user.setId(rs.getString("user_id"));
			user.setPassword(rs.getString("user_password"));
			user.setName(rs.getString("user_name"));
			user.setAdmin(rs.getString("user_is_admin"));
			user.setDrop(rs.getString("user_drop"));
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return user;
	}
	
	public User getUserById(String userId) throws SQLException {
		User user = null;
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.getUserById"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			user = new User();
			user.setId(rs.getString("user_id"));
			user.setPassword(rs.getString("user_password"));
			user.setName(rs.getString("user_name"));
			user.setTelephone(rs.getString("user_telephone"));
			user.setPhone(rs.getString("user_phone"));
			user.setSnsCheck(rs.getString("user_sns_checkyn"));
			user.setEmail(rs.getString("user_email"));
			user.setGender(rs.getString("user_gender"));
			user.setBirth(rs.getString("user_birth"));
			user.setLocation(rs.getString("user_location"));
			user.setGrade(rs.getString("user_grade"));
			user.setRegisteredDate(rs.getDate("user_registered_date"));
			user.setAdmin(rs.getString("user_is_admin"));
			user.setTotalMileages(rs.getInt("total_mileages"));
			user.setUsableMileage(rs.getInt("usable_mileage"));
			user.setUsedMileage(rs.getInt("used_mileage"));
			user.setDrop(rs.getString("user_drop"));
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return user;
	}
	
	public void updateUser(User user) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.updateUser"));
		
		pstmt.setString(1, user.getPassword());
		pstmt.setString(2, user.getTelephone());
		pstmt.setString(3, user.getPhone());
		pstmt.setString(4, user.getSnsCheck());
		pstmt.setString(5, user.getEmail());
		pstmt.setString(6, user.getBirth());
		pstmt.setString(7, user.getLocation());
		pstmt.setString(8, user.getDrop());
		pstmt.setString(9, user.getId());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void updateUserByMileage(User user) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.updateUserByMileage"));
		
		pstmt.setString(1, user.getPassword());
		pstmt.setString(2, user.getTelephone());
		pstmt.setString(3, user.getPhone());
		pstmt.setString(4, user.getSnsCheck());
		pstmt.setString(5, user.getEmail());
		pstmt.setString(6, user.getBirth());
		pstmt.setString(7, user.getLocation());
		pstmt.setInt(8, user.getTotalMileages());
		pstmt.setInt(9, user.getUsableMileage());
		pstmt.setInt(10, user.getUsedMileage());
		pstmt.setString(11, user.getId());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
}
