package com.withice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.withice.dto.WishListDetailDto;
import com.withice.util.ConnectionUtil;
import com.withice.util.QueryUtil;
import com.withice.vo.WishList;

public class WishListDao {

	public void insertWishList(WishList wishList) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("wish.insertWishList"));
		pstmt.setInt(1, wishList.getProductNo());
		pstmt.setString(2, wishList.getUserId());
		pstmt.executeUpdate();
		
		connection.close();
		pstmt.close();
	}
	
	public List<WishListDetailDto> getWishListDetail (String userId) throws SQLException {
		List<WishListDetailDto> details = new ArrayList<WishListDetailDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("wish.wishListProducts"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			WishListDetailDto detail = new WishListDetailDto();
			detail.setProductName(rs.getString("product_name"));
			detail.setProductNo(rs.getInt("pno"));
			detail.setProductPrice(rs.getInt("product_price"));
			detail.setProductThumbnail(rs.getString("product_thumbnail"));
			detail.setCateNo(rs.getInt("cate_no"));
			details.add(detail);
		}
		connection.close();
		pstmt.close();
		rs.close();
		
		return details;
	}
	
	public void deleteWishList(int productNo) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("wish.deleteWishList"));
		pstmt.setInt(1, productNo);
		pstmt.executeUpdate();
		connection.close();
		pstmt.close();
	}
	
	public void deleteAllWishList() throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("wish.deleteAllWishList"));
		pstmt.executeUpdate();
		connection.close();
		pstmt.close();
	}
	public int getWishListCount(String userId) throws SQLException {
		int rowCount = 0;
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("wish.getWishListCount"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next());{
			rowCount = rs.getInt("cnt");			
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return rowCount;
	}
	public List<WishListDetailDto> getWishsByRange(String userId, int beginNumber, int endNumber) throws SQLException {
		List<WishListDetailDto> details = new ArrayList<WishListDetailDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("wish.getWishListByRange"));
		pstmt.setString(1, userId);
		pstmt.setInt(2, beginNumber);
		pstmt.setInt(3, endNumber);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			WishListDetailDto detail = new WishListDetailDto();
			detail.setProductName(rs.getString("product_name"));
			detail.setProductNo(rs.getInt("pno"));
			detail.setProductPrice(rs.getInt("product_price"));
			detail.setProductThumbnail(rs.getString("product_thumbnail"));
			detail.setCateNo(rs.getInt("cate_no"));
			details.add(detail);
		}
		connection.close();
		pstmt.close();
		rs.close();
		
		return details;
	}
	
	public WishList getWishListByProductNo(int productNo) throws SQLException {
		WishList wishList = null;
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("wish.getWishListByProductNo"));
		pstmt.setInt(1, productNo);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			wishList = new WishList();
			wishList.setProductNo(rs.getInt("product_no"));
			wishList.setUserId(rs.getString("user_id"));
			wishList.setWishListNo(rs.getInt("wishlist_no"));
			
		}
		connection.close();
		pstmt.close();
		rs.close();
		
		return wishList;
	}
}
