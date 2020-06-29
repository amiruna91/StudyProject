package com.withice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.withice.util.ConnectionUtil;
import com.withice.util.QueryUtil;
import com.withice.vo.Reply;

public class ReplyDao {

	public void registerReply(Reply reply) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("reply.registerreply"));
		
		pstmt.setString(1, reply.getContent());
		pstmt.setString(2, reply.getUserId());
		pstmt.setInt(3, reply.getReviewNo());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public List<Reply> getReplyByNo(int reviewNo) throws SQLException {
		List<Reply> replyList = new ArrayList<Reply>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("reply.getreplyByNo"));
		pstmt.setInt(1, reviewNo);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Reply reply = new Reply();
			reply.setReplyNo(rs.getInt("reply_no"));
			reply.setUserId(rs.getString("user_id"));
			reply.setContent(rs.getString("reply_content"));
			reply.setRegisteredDate(rs.getDate("REPLY_REGISTERED_DATE"));
			reply.setReviewNo(rs.getInt("review_no"));
			
			replyList.add(reply);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return replyList;
	}
	
	public void updateReply(Reply reply) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("reply.updatereply"));
		
		pstmt.setString(1, reply.getContent());
		pstmt.setInt(2, reply.getReplyNo());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void deleteReply(int replyNo) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("reply.deleteReply"));
		
		pstmt.setInt(1, replyNo);
		pstmt.executeUpdate();
		connection.close();
		pstmt.close();
	}
}
