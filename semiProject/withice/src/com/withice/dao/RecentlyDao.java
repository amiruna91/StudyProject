package com.withice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.withice.dto.RecentlyDetailDto;
import com.withice.util.ConnectionUtil;
import com.withice.util.QueryUtil;
import com.withice.vo.Recently;


public class RecentlyDao {

	public void insertRecently(Recently recently) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("recently.insertRecently"));
		pstmt.setInt(1, recently.getProductNo());
		pstmt.setString(2, recently.getUserId());
		pstmt.executeUpdate();
		
		connection.close();
		pstmt.close();
	}
	
	public List<RecentlyDetailDto> getRecentlyDetail (String userId) throws SQLException {
		List<RecentlyDetailDto> details = new ArrayList<RecentlyDetailDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("recently.recentlyProducts"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			RecentlyDetailDto detail = new RecentlyDetailDto();
			detail.setRecentlyNo(rs.getInt("recently_no"));
			detail.setProductPrice(rs.getInt("product_price"));
			detail.setProductThumbnail(rs.getString("product_thumbnail"));
			detail.setProductComment(rs.getString("product_comment"));
			detail.setProductName(rs.getString("product_name"));
			detail.setProductNo(rs.getInt("product_no"));
			detail.setCateNo(rs.getInt("cate_no"));
			details.add(detail);
		}
		connection.close();
		pstmt.close();
		rs.close();
		
		return details;
	}
	
	public void deleteRecently(int recentlyNo) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("recently.deleteRecently"));
		pstmt.setInt(1, recentlyNo);
		pstmt.executeUpdate();
		
		connection.close();
		pstmt.close();
	}
}
