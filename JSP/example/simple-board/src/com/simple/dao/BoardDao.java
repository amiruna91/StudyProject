package com.simple.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.simple.util.ConnectionUtil;
import com.simple.util.QueryUtil;
import com.simple.vo.Board;

public class BoardDao {

	public List<Board> getBoardsById(String userId) throws Exception {
		List<Board> boards = new ArrayList<Board>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQl("board.getBoardsById"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Board board = new Board();
			board.setBoardNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setContent(rs.getString("board_content"));
			board.setHit(rs.getInt("board_hit"));
			board.setReplyCnt(rs.getInt("board_reply_cnt"));
			board.setDelYN(rs.getString("board_del_yn"));
			board.setCreateDate(rs.getDate("board_create_date"));
			
			boards.add(board);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return boards;
	}
	
	public List<Board> getAllBoards() throws Exception {
		List<Board> boards = new ArrayList<Board>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQl("board.getAllBoards"));
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Board board = new Board();
			board.setBoardNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setContent(rs.getString("board_content"));
			board.setHit(rs.getInt("board_hit"));
			board.setReplyCnt(rs.getInt("board_reply_cnt"));
			board.setDelYN(rs.getString("board_del_yn"));
			board.setCreateDate(rs.getDate("board_create_date"));
			
			boards.add(board);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return boards;
	}
	
	public void insertBoard(Board board) throws Exception {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQl("board.insertBoard"));
		pstmt.setString(1, board.getTitle());
		pstmt.setString(2, board.getWriter());
		pstmt.setString(3, board.getContent());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void updateBoard(Board board) throws Exception {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQl("board.updateBoard"));
		pstmt.setString(1, board.getTitle());
		pstmt.setString(2, board.getContent());
		pstmt.setInt(3, board.getReplyCnt());
		pstmt.setInt(4, board.getHit());
		pstmt.setString(5, board.getDelYN());
		pstmt.setInt(6, board.getBoardNo());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public Board getBoardByNo(int boardNo) throws Exception {
		Board board = null;
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQl("board.getBoardByNo"));
		pstmt.setInt(1, boardNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			board = new Board();
			
			board.setBoardNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setContent(rs.getString("board_content"));
			board.setHit(rs.getInt("board_hit"));
			board.setReplyCnt(rs.getInt("board_reply_cnt"));
			board.setDelYN(rs.getString("board_del_yn"));
			board.setCreateDate(rs.getDate("board_create_date"));
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return board;
	}
}
