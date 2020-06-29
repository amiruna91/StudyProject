package com.withice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.withice.util.ConnectionUtil;
import com.withice.util.QueryUtil;
import com.withice.vo.Mileage;

public class MileageDao {

	public List<Mileage> getMileageById(String userId) throws SQLException {
		List<Mileage> mileages = new ArrayList<Mileage>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("mileage.getMileageById"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Mileage mileage = new Mileage();
			mileage.setContent(rs.getString("mileage_content"));
			mileage.setUserId(rs.getString("user_id"));
			mileage.setRegisteredDate(rs.getDate("mileage_registered_date"));
			mileage.setGetMileage(rs.getInt("get_mileage"));
			mileage.setMileageOrder(rs.getInt("mileage_order"));
			
			mileages.add(mileage);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return mileages;
	}
	
	public int getMileageCount(String userId) throws SQLException {
		int rowCount = 0;
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("mileage.getMileageCount"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		rowCount = rs.getInt("cnt");
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return rowCount;
	}
	
	public List<Mileage> getMileageByRange(String userId, int beginNumber, int endNumber) throws SQLException {
		List<Mileage> mileages = new ArrayList<Mileage>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("mileage.getMileageByRange"));
		pstmt.setString(1, userId);
		pstmt.setInt(2, beginNumber);
		pstmt.setInt(3, endNumber);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Mileage mileage = new Mileage();
			mileage.setNo(rs.getInt("mileage_no"));
			mileage.setContent(rs.getString("mileage_content"));
			mileage.setRegisteredDate(rs.getDate("mileage_registered_date"));
			mileage.setUserId(rs.getString("user_id"));
			mileage.setGetMileage(rs.getInt("get_mileage"));
			mileage.setMileageOrder(rs.getInt("mileage_order"));
			
			mileages.add(mileage);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return mileages;
	}
	
	public void registerMileage(Mileage mileage) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("mileage.registerMileage"));
		
		pstmt.setString(1, mileage.getContent());
		pstmt.setString(2, mileage.getUserId());
		pstmt.setInt(3, mileage.getGetMileage());
		pstmt.setInt(4, mileage.getMileageOrder());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
}
