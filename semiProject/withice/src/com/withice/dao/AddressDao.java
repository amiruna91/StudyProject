package com.withice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.withice.util.ConnectionUtil;
import com.withice.util.QueryUtil;
import com.withice.vo.Address;

public class AddressDao {

	public void registerAddress(Address address) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("address.registerAddress"));
		
		pstmt.setString(1, address.getName());
		pstmt.setInt(2, address.getPostalCode());
		pstmt.setString(3, address.getMain());
		pstmt.setString(4, address.getSub());
		pstmt.setString(5, address.getTelphone());
		pstmt.setString(6, address.getPhone());
		pstmt.setString(7, address.getReceiver());
		pstmt.setString(8, address.getUserid());
		pstmt.setInt(9, address.getHome());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public List<Address> getAddressesById(String userId) throws SQLException {
		List<Address> addresses = new ArrayList<Address>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("address.getAddressById"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Address address = new Address();
			address = new Address();
			address.setNo(rs.getInt("address_no"));
			address.setName(rs.getString("address_name"));
			address.setPostalCode(rs.getInt("address_postal_code"));
			address.setMain(rs.getString("address_main"));
			address.setSub(rs.getString("address_sub"));
			address.setTelphone(rs.getString("address_telphone"));
			address.setPhone(rs.getString("address_phone"));
			address.setReceiver(rs.getString("address_receiver"));
			address.setUserid(rs.getString("user_id"));
			address.setHome(rs.getInt("address_home"));
			
			addresses.add(address);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return addresses;
	}
	
	public Address getAddressHomeByUserId(String userId) throws SQLException {
		Address address = null;
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("address.getAddressByHomeNo"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			address = new Address();
			address.setNo(rs.getInt("address_no"));
			address.setName(rs.getString("address_name"));
			address.setPostalCode(rs.getInt("address_postal_code"));
			address.setMain(rs.getString("address_main"));
			address.setSub(rs.getString("address_sub"));
			address.setTelphone(rs.getString("address_telphone"));
			address.setPhone(rs.getString("address_phone"));
			address.setReceiver(rs.getString("address_receiver"));
			address.setUserid(rs.getString("user_id"));
			address.setHome(rs.getInt("address_home"));
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return address;
	}
	
	public Address getAddressByNo(int no) throws SQLException {
		Address address = null;
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("address.getAdressByNo"));
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			address = new Address();
			address.setName(rs.getString("address_name"));
			address.setPostalCode(rs.getInt("address_postal_code"));
			address.setMain(rs.getString("address_main"));
			address.setSub(rs.getString("address_sub"));
			address.setTelphone(rs.getString("address_telphone"));
			address.setPhone(rs.getString("address_phone"));
			address.setReceiver(rs.getString("address_receiver"));
			address.setHome(rs.getInt("address_home"));
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return address;
	}
	
	public void updateAddressById(Address address) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("address.updateAddressById"));
		
		pstmt.setString(1, address.getName());
		pstmt.setString(2, address.getReceiver());
		pstmt.setInt(3, address.getPostalCode());
		pstmt.setString(4, address.getMain());
		pstmt.setString(5, address.getSub());
		pstmt.setString(6, address.getTelphone());
		pstmt.setString(7, address.getPhone());
		pstmt.setInt(8, address.getHome());
		pstmt.setString(9, address.getUserid());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void updateAddressByNo(Address address) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("address.updateAddressByNo"));
		
		pstmt.setString(1, address.getName());
		pstmt.setString(2, address.getReceiver());
		pstmt.setInt(3, address.getPostalCode());
		pstmt.setString(4, address.getMain());
		pstmt.setString(5, address.getSub());
		pstmt.setString(6, address.getTelphone());
		pstmt.setString(7, address.getPhone());
		pstmt.setInt(8, address.getHome());
		pstmt.setInt(9, address.getNo());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void deleteAddress(int no) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("address.deleteAddress"));
		pstmt.setInt(1, no);
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void updateAddressHome(Address address) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("address.updateAddressHome"));
		

		pstmt.setInt(1, address.getHome());
		pstmt.setInt(2, address.getNo());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
}
