package com.withice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.withice.dto.CartDetailDto;
import com.withice.util.ConnectionUtil;
import com.withice.util.QueryUtil;
import com.withice.vo.Cart;

public class CartDao {

	public void insertCart(Cart cart) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("cart.insertCart"));
		pstmt.setInt(1, cart.getProductNo());
		pstmt.setInt(2, cart.getProductAmount());
		pstmt.setString(3, cart.getUserId());
		pstmt.executeUpdate();
		
		connection.close();
		pstmt.close();
	}
	
	public List<CartDetailDto> getCartDetail (String userId) throws SQLException {
		List<CartDetailDto> details = new ArrayList<CartDetailDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("cart.getAllCartByUserId"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			CartDetailDto detail = new CartDetailDto();
			detail.setProductAmount(rs.getInt("cart_product_amount"));
			detail.setProductName(rs.getString("product_name"));
			detail.setProductPrice(rs.getInt("product_price"));
			detail.setProductThumbnail(rs.getString("product_thumbnail"));
			detail.setProductNo(rs.getInt("pno"));
			detail.setCartNo(rs.getInt("cart_no"));
			detail.setCateNo(rs.getInt("cate_no"));
			details.add(detail);
		}
		connection.close();
		pstmt.close();
		rs.close();
		
		return details;
	}
	public void deleteCart(int productNo) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("cart.deleteCart"));
		pstmt.setInt(1, productNo);
		pstmt.executeUpdate();
		connection.close();
		pstmt.close();
	}
	
	public void deleteAllCart() throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("cart.deleteAllCart"));
		pstmt.executeUpdate();
		connection.close();
		pstmt.close();
	}
	
	public Cart getCartByCartNo(int cartNo) throws SQLException {
		Cart cart = null;
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("cart.getCartByCartNo"));
		pstmt.setInt(1, cartNo);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			cart = new Cart();
			cart.setCartNo(rs.getInt("cart_no"));
			cart.setCartRegisteredDate(rs.getDate("cart_registered_date"));
			cart.setProductAmount(rs.getInt("cart_product_amount"));
			cart.setProductNo(rs.getInt("product_no"));
			cart.setUserId(rs.getString("user_id"));
		}
		connection.close();
		pstmt.close();
		rs.close();
		return cart;
	}
	
	public Cart getCartByProductNo(int productNo) throws SQLException {
		Cart cart = null;
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("cart.getCartByProductNo"));
		pstmt.setInt(1, productNo);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			cart = new Cart();
			cart.setCartNo(rs.getInt("cart_no"));
			cart.setCartRegisteredDate(rs.getDate("cart_registered_date"));
			cart.setProductAmount(rs.getInt("cart_product_amount"));
			cart.setProductNo(rs.getInt("product_no"));
			cart.setUserId(rs.getString("user_id"));
		}
		connection.close();
		pstmt.close();
		rs.close();
		return cart;
	}
	public List<Cart> getCartByCartsType() throws SQLException {
		List<Cart> carts = new ArrayList<Cart>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("cart.getCartsByCartType"));
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			Cart cart = new Cart();
			cart.setCartNo(rs.getInt("cart_no"));
			cart.setCartRegisteredDate(rs.getDate("cart_registered_date"));
			cart.setProductAmount(rs.getInt("cart_product_amount"));
			cart.setProductNo(rs.getInt("product_no"));
			cart.setUserId(rs.getString("user_id"));
			cart.setCartType(rs.getString("cart_type"));
			
			carts.add(cart);
		}
		connection.close();
		pstmt.close();
		rs.close();
		
		return carts;
	}
	
	public void updateCart (int amount, String userId, int productNo) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("cart.updateCart"));
		pstmt.setInt(1, amount);
		pstmt.setString(2, userId);
		pstmt.setInt(3, productNo);
		pstmt.executeUpdate();
		connection.close();
		pstmt.close();
	}
}
