package com.simple.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.simple.util.ConnectionUtil;
import com.simple.util.QueryUtil;
import com.simple.vo.Reply;

public class ReplyDao {

	public List<Reply> getReplyById(String userId) throws Exception {
		List<Reply> replys = new ArrayList<Reply>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQl("reply.getReplyById"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Reply reply = new Reply();
			reply.setReplyNo(rs.getInt("reply_no"));
			reply.setWriter(rs.getString("reply_writer"));
			reply.setContent(rs.getString("reply_content"));
			reply.setDelYN(rs.getString("reply_del_yn"));
			reply.setCreateDate(rs.getDate("reply_create_date"));
			reply.setBoardNo(rs.getInt("board_no"));
			
			replys.add(reply);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return replys;
	}
	
	public List<Reply> getReplysByBoardNo(int boardNo) throws Exception {
		List<Reply> replys = new ArrayList<Reply>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQl("reply.getReplysByBoardNo"));
		pstmt.setInt(1, boardNo);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Reply reply = new Reply();
			reply.setReplyNo(rs.getInt("reply_no"));
			reply.setWriter(rs.getString("reply_writer"));
			reply.setContent(rs.getString("reply_content"));
			reply.setDelYN(rs.getString("reply_del_yn"));
			reply.setCreateDate(rs.getDate("reply_create_date"));
			reply.setBoardNo(rs.getInt("board_no"));
			
			replys.add(reply);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return replys;
	}
	
	public void insertReply(Reply reply) throws Exception {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQl("reply.insertReply"));
		pstmt.setString(1, reply.getWriter());
		pstmt.setString(2, reply.getContent());
		pstmt.setInt(3, reply.getBoardNo());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
}
