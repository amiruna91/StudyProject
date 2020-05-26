package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.bookstore.util.ConnectionUtil;
import com.bookstore.util.QueryUtil;
import com.bookstore.vo.Like;

public class LikeDao {
	
	public void insertLike(Like like) throws Exception {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQl("like.insertLike"));
		pstmt.setInt(1, like.getBookNo());
		pstmt.setString(2, like.getUserId());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
}
