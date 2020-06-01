package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bookstore.dto.BoardDto;
import com.bookstore.util.ConnectionUtil;
import com.bookstore.util.QueryUtil;
import com.bookstore.vo.Board;

public class BoardDao {

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
			board.setDelYN(rs.getString("board_del_yn"));
			board.setRegisteredDate(rs.getDate("board_registered_date"));
			
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
		pstmt.setString(4, board.getPassword());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public BoardDto getBoardWtihRepByNo(int boardNo) throws Exception {
		BoardDto board = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQl("board.getBoardWtihReplyByNo"));
		pstmt.setInt(1, boardNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			board = new BoardDto();
			board.setBoardNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setContent(rs.getString("board_content"));
			board.setRegisteredDate(rs.getDate("board_registered_date"));
			board.setReply(rs.getInt("reply"));
			board.setHit(rs.getInt("board_hit"));
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return board;
	}
	
	public List<Board> getBoardByTitle(String searchKeyword) throws Exception {
		List<Board> boards = new ArrayList<Board>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQl("board.getBoardByTitle"));
		pstmt.setString(1, searchKeyword);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Board board = new Board();
			
			board.setBoardNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setContent(rs.getString("board_content"));
			board.setHit(rs.getInt("board_hit"));
			board.setDelYN(rs.getString("board_del_yn"));
			board.setRegisteredDate(rs.getDate("board_registered_date"));
			
			boards.add(board);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return boards;
	}
	
	public List<Board> getBoardByWriter(String searchKeyword) throws Exception {
		List<Board> boards = new ArrayList<Board>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQl("board.getBoardByWriter"));
		pstmt.setString(1, searchKeyword);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Board board = new Board();
			
			board.setBoardNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setContent(rs.getString("board_content"));
			board.setHit(rs.getInt("board_hit"));
			board.setDelYN(rs.getString("board_del_yn"));
			board.setRegisteredDate(rs.getDate("board_registered_date"));
			
			boards.add(board);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return boards;
	}
	
	public List<Board> getBoardByContent(String searchKeyword) throws Exception {
		List<Board> boards = new ArrayList<Board>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQl("board.getBoardByContent"));
		pstmt.setString(1, searchKeyword);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Board board = new Board();
			
			board.setBoardNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setContent(rs.getString("board_content"));
			board.setHit(rs.getInt("board_hit"));
			board.setDelYN(rs.getString("board_del_yn"));
			board.setRegisteredDate(rs.getDate("board_registered_date"));
			
			boards.add(board);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return boards;
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
			board.setRegisteredDate(rs.getDate("board_registered_date"));
			board.setHit(rs.getInt("board_hit"));
			board.setPassword(rs.getString("board_password"));
			board.setDelYN(rs.getString("board_del_yn"));
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return board;
	}
	
	public void updateBoard(Board board) throws Exception {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQl("board.updateBoard"));
		pstmt.setString(1, board.getTitle());
		pstmt.setString(2, board.getContent());
		pstmt.setString(3, board.getWriter());
		pstmt.setInt(4, board.getBoardNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void deleteBoard(Board board) throws Exception {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQl("board.deleteBoard"));
		pstmt.setString(1, board.getDelYN());
		pstmt.setInt(2, board.getBoardNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
}
