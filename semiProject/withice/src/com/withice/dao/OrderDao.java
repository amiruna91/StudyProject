package com.withice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.withice.dto.OrderDetailWithProductName;
import com.withice.dto.OrderDtoWithDetails;
import com.withice.dto.OrderListDto;
import com.withice.dto.OrderWithUserName;
import com.withice.util.ConnectionUtil;
import com.withice.util.JdbcHelper;
import com.withice.util.JdbcHelper.RowMapper;
import com.withice.util.QueryUtil;
import com.withice.vo.Order;
import com.withice.vo.OrderAddress;
import com.withice.vo.OrderDetail;

public class OrderDao {

	public void insertOrder(Order order) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.insertOrder"));
		pstmt.setInt(1, order.getPrice());
		pstmt.setString(2, order.getUserId());
		pstmt.executeUpdate();
		
		connection.close();
		pstmt.close();
	}
	
	public void insertOrderDetail(OrderDetail orderDetail) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.insertOrderDetail"));
		pstmt.setInt(1, orderDetail.getPrice());
		pstmt.setInt(2, orderDetail.getAmount());
		pstmt.setInt(3, orderDetail.getProductNo());
		pstmt.setInt(4, orderDetail.getOrderNo());
		pstmt.executeUpdate();
		
		connection.close();
		pstmt.close();
	}
	
	public void insertOrderAddress(OrderAddress orderAddress) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.insertOrderAddress"));
		pstmt.setInt(1, orderAddress.getPostalCode());
		pstmt.setString(2, orderAddress.getMainAddress());
		pstmt.setString(3, orderAddress.getSubAddress());
		pstmt.setString(4, orderAddress.getPhone());
		pstmt.setString(5, orderAddress.getReceiver());
		pstmt.setString(6, orderAddress.getContent());
		pstmt.setString(7, orderAddress.getTelephone());
		pstmt.setInt(8, orderAddress.getOrderNo());
		pstmt.executeUpdate();
		
		connection.close();
		pstmt.close();
	}
	
	public Order getOrderNoByUserIdRownum (String userId) throws SQLException {
		Order order = null;
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getOrderNoByUserIdRownum"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			order = new Order();
			order.setNo(rs.getInt("order_no"));
			order.setPrice(rs.getInt("order_price"));
			order.setRegisteredDate(rs.getDate("order_registered_date"));
			order.setStatus(rs.getString("order_status"));
			order.setUserId(rs.getString("user_id"));
		}
		connection.close();
		pstmt.close();
		rs.close();
		
		return order;
	}
	public List<OrderListDto> getOrderByUserId (String userId) throws SQLException {
		List<OrderListDto> orders = new ArrayList<OrderListDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getOrderByUserId"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			OrderListDto list = new OrderListDto();
			list.setOrderAmount(rs.getInt("order_amount"));
			list.setOrderDetailNo(rs.getInt("order_detail_no"));
			list.setOrderNo(rs.getInt("ono"));
			list.setOrderStatus(rs.getString("order_status"));
			list.setProductNo(rs.getInt("pno"));
			list.setRegisteredDate(rs.getDate("order_registered_date"));
			list.setUserId(rs.getString("user_id"));
			list.setCateNo(rs.getInt("cate_no"));
			list.setProductThumbnail(rs.getString("product_thumbnail"));
			list.setProductName(rs.getString("product_name"));
			list.setOrderPrice(rs.getInt("order_detail_price"));
			
			orders.add(list);
		}
		connection.close();
		pstmt.close();
		rs.close();
		
		return orders;
	}
	
	public List<OrderListDto> getOrderByUserIdMax (String userId) throws SQLException {
		List<OrderListDto> orders = new ArrayList<OrderListDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getOrderByUserIdMax"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			OrderListDto list = new OrderListDto();
			list.setOrderStatus(rs.getString("order_status"));
			list.setRegisteredDate(rs.getDate("order_registered_date"));
			list.setOrderNo(rs.getInt("order_no"));
			list.setUserId(rs.getString("user_id"));
			list.setOrderAmount(rs.getInt("order_amount"));
			list.setProductNo(rs.getInt("product_no"));
			list.setOrderDetailNo(rs.getInt("order_detail_no"));
			list.setCateNo(rs.getInt("cate_no"));
			list.setProductThumbnail(rs.getString("product_thumbnail"));
			list.setProductName(rs.getString("product_name"));
			list.setOrderPrice(rs.getInt("order_detail_price"));
			
			orders.add(list);
		}
		connection.close();
		pstmt.close();
		rs.close();
		
		return orders;
	}
	
	public int getOrderCountByNo(int no) throws SQLException {
		int a = 0;
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getOrderCountByNo"));
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
	
		while(rs.next()) {
			a = rs.getInt("CNT");
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return a;
	}
	
	public List<OrderWithUserName> getOrderStatusWithName() throws SQLException {
		return JdbcHelper.selectList(QueryUtil.getSQL("order.getOrderStatusWithName"), new RowMapper<OrderWithUserName>() {
			@Override
			public OrderWithUserName mapRow(ResultSet rs) throws SQLException {
				OrderWithUserName order = new OrderWithUserName();
				order.setNo(rs.getInt("order_no"));
				order.setDate(rs.getDate("order_registered_date"));
				order.setStatus(rs.getString("order_status"));
				order.setUserId(rs.getString("user_id"));
				order.setUserName(rs.getString("address_receiver"));
				return order;
			}
		});
	}
	
	public Order getOrderByNo(int orderNo) throws SQLException {
		return JdbcHelper.selectOne(QueryUtil.getSQL("order.getOrderByNo"), new RowMapper<Order>() {
			@Override
			public Order mapRow(ResultSet rs) throws SQLException {
				Order order = new Order();
				order.setNo(rs.getInt("order_no"));
				order.setPrice(rs.getInt("order_price"));
				order.setStatus(rs.getString("order_status"));
				order.setRegisteredDate(rs.getDate("order_registered_date"));
				order.setUserId(rs.getString("user_id"));
				return order;
			}
		}, orderNo);
	}
	
	public void updateOrder(Order order) throws SQLException {
		JdbcHelper.update(QueryUtil.getSQL("order.updateOrder"), order.getRegisteredDate(),
				order.getStatus(), order.getUserId(), order.getPrice(), order.getNo());
	}
	
	public int getOrderByStatusN() throws SQLException {
		int cnt = 0;
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("order.getOrderByStatusN"));
		ResultSet rs = pstmt.executeQuery();
	
		if(rs.next()) {
			cnt = rs.getInt("CNT");
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return cnt;
	}
	
	public OrderDtoWithDetails getOrderDtoWithDetails(int orderNo) throws SQLException {
		return JdbcHelper.selectOne(QueryUtil.getSQL("order.getOrderDtoWithDetails"), new RowMapper<OrderDtoWithDetails>() {
			@Override
			public OrderDtoWithDetails mapRow(ResultSet rs) throws SQLException {
				OrderDtoWithDetails order = new OrderDtoWithDetails();
				order.setUserName(rs.getString("address_receiver"));
				order.setPhoneNumber(rs.getString("address_phone"));
				order.setMainAddress(rs.getString("address_main"));
				order.setSubAddress(rs.getString("address_sub"));
				return order;
			}
		}, orderNo);
	}
	
	public List<OrderDetailWithProductName> getOrderDetailsByOrderNo(int orderNo) throws SQLException {
		return JdbcHelper.selectList(QueryUtil.getSQL("order.getOrderDetailsByOrderNo"), new RowMapper<OrderDetailWithProductName>() {
			@Override
			public OrderDetailWithProductName mapRow(ResultSet rs) throws SQLException {
				OrderDetailWithProductName order = new OrderDetailWithProductName();
				order.setNo(rs.getInt("order_detail_no"));
				order.setPrice(rs.getInt("order_detail_price"));
				order.setAmount(rs.getInt("order_amount"));
				order.setProductNo(rs.getInt("product_no"));
				order.setProductName(rs.getString("product_name"));
				order.setOrderNo(rs.getInt("order_no"));
				return order;
			}
		}, orderNo);
	}
}
