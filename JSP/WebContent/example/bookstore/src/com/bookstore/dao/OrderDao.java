package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bookstore.dto.OrderDto;
import com.bookstore.util.ConnectionUtil;
import com.bookstore.util.QueryUtil;
import com.bookstore.vo.Order;

public class OrderDao {

	public void insertOrder(Order order) throws Exception {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQl("order.insertOrder"));
		pstmt.setString(1, order.getUserId());
		pstmt.setInt(2, order.getBookNo());
		pstmt.setInt(3, order.getPrice());
		pstmt.setInt(4, order.getAmount());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public List<OrderDto> getOrderByUserId(String userId) throws Exception {
		List<OrderDto> orders = new ArrayList<OrderDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQl("order.getOrderByUserId"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			OrderDto order = new OrderDto();
			order.setOrderNo(rs.getInt("order_no"));
			order.setUserId(rs.getString("user_id"));
			order.setBookNo(rs.getInt("book_no"));
			order.setBookTitle(rs.getString("book_title"));
			order.setOrderPrice(rs.getInt("order_price"));
			order.setAmount(rs.getInt("order_amount"));
			order.setRegisteredDate(rs.getDate("order_registered_date"));
			order.setWriteReveiw(rs.getInt("write_review"));
			order.setIsLike(rs.getInt("is_like"));
			
			orders.add(order);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return orders;
	}
	
	public List<OrderDto> getAllOrders() throws Exception {
		List<OrderDto> orders = new ArrayList<OrderDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQl("order.getAllOrders"));
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			OrderDto order = new OrderDto();
			order.setOrderNo(rs.getInt("order_no"));
			order.setUserName(rs.getString("user_name"));
			order.setBookTitle(rs.getString("book_title"));
			order.setOrderPrice(rs.getInt("order_price"));
			order.setAmount(rs.getInt("order_amount"));
			order.setRegisteredDate(rs.getDate("order_registered_date"));
			
			orders.add(order);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return orders;
	}
	
	public List<OrderDto> getOrdersByGenre(String genre) throws Exception {
		List<OrderDto> orders = new ArrayList<OrderDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQl("order.getOrdersByGenre"));
		pstmt.setString(1, genre);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			OrderDto order = new OrderDto();
			order.setOrderNo(rs.getInt("order_no"));
			order.setUserName(rs.getString("user_name"));
			order.setBookTitle(rs.getString("book_title"));
			order.setOrderPrice(rs.getInt("order_price"));
			order.setAmount(rs.getInt("order_amount"));
			order.setRegisteredDate(rs.getDate("order_registered_date"));
			
			orders.add(order);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return orders;
	}
}
