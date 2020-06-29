package com.withice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.withice.util.ConnectionUtil;
import com.withice.util.JdbcHelper;
import com.withice.util.QueryUtil;
import com.withice.util.JdbcHelper.RowMapper;
import com.withice.vo.ManagerBoard;
import com.withice.vo.ManagerBoardCate;


public class ManagerBoardDao {
	
	public List<ManagerBoardCate> getCates() throws SQLException {
		List<ManagerBoardCate> cates  = new ArrayList<ManagerBoardCate>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("managerBoard.gerCates"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			ManagerBoardCate cate = new ManagerBoardCate();
			
			cate.setNo(rs.getInt("MANAGER_BOARD_CATE_NO"));
			cate.setTitle(rs.getString("MANAGER_BOARD_CATE_NAME"));
			
			cates.add(cate);
			
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return cates;
	}
	
	public int getnoticesTotalCnt() throws SQLException {
		
		return JdbcHelper.selectOne(QueryUtil.getSQL("noticesBoard.getTotalCnt"), new RowMapper<Integer>() {
			@Override
			public Integer mapRow(ResultSet rs) throws SQLException {
				return rs.getInt("cnt");
			}
		});
	}
	
	
	public int getEventsTotalCnt() throws SQLException {
		
		return JdbcHelper.selectOne(QueryUtil.getSQL("eventBoard.getTotalCnt"), new RowMapper<Integer>() {
			@Override
			public Integer mapRow(ResultSet rs) throws SQLException {
				return rs.getInt("cnt");
			}
		});
	}
	
	public List<ManagerBoard> getNotices(int begin, int end) throws SQLException {
		List<ManagerBoard> notices = new ArrayList<ManagerBoard>();
	
		Connection connection = ConnectionUtil.getConnection();
		
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("noticesBoard.getNotices").toString());
		pstmt.setInt(1, begin);
		pstmt.setInt(2, end);
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			ManagerBoard notice = new ManagerBoard();
			notice.setNo(rs.getInt("MANAGER_BOARD_NO"));
			notice.setTitle(rs.getString("MANAGER_BOARD_TITLE"));
			notice.setContent(rs.getString("MANAGER_BOARD_CONTENT"));
			notice.setViewCnt(rs.getInt("MANAGER_BOARD_VIEW_COUNT"));
			notice.setRegistedDate(rs.getDate("MANAGER_BOARD_REGISTERED_DATE"));
		
			notice.setUserId(rs.getString("USER_ID"));
			notice.setCateNo(rs.getInt("MANAGER_BOARD_CATE_NO"));

			
			notices.add(notice);
		}
		rs.close();
		pstmt.close();
		connection.close();

		return notices;
	}
	
	public List<ManagerBoard> getEvents(int begin, int end) throws SQLException {
		List<ManagerBoard> events = new ArrayList<ManagerBoard>();
		
		Connection connection = ConnectionUtil.getConnection();
		
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("eventBoard.getEvents").toString());
		pstmt.setInt(1, begin);
		pstmt.setInt(2, end);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			ManagerBoard event = new ManagerBoard();
			event.setNo(rs.getInt("MANAGER_BOARD_NO"));
			event.setTitle(rs.getString("MANAGER_BOARD_TITLE"));
			event.setContent(rs.getString("MANAGER_BOARD_CONTENT"));
			event.setViewCnt(rs.getInt("MANAGER_BOARD_VIEW_COUNT"));
			event.setRegistedDate(rs.getDate("MANAGER_BOARD_REGISTERED_DATE"));
			event.setUserId(rs.getString("USER_ID"));
			event.setCateNo(rs.getInt("MANAGER_BOARD_CATE_NO"));
			event.setCateName(rs.getString("MANAGER_BOARD_CATE_NAME"));
			
			
			events.add(event);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return events;
	}
	
	public void insertBoard(ManagerBoard managerBoard) throws SQLException {
		JdbcHelper.insert(QueryUtil.getSQL("managerBoard.insertBoard"), managerBoard.getContent(), managerBoard.getCateNo(), managerBoard.getTitle(), managerBoard.getUserId());
	}
	
	public ManagerBoard getManagerBoardByNo(int no) throws SQLException {
		return JdbcHelper.selectOne(QueryUtil.getSQL("managerBoard.getManagerBoardByNo"), new RowMapper<ManagerBoard>() {
			@Override
			public ManagerBoard mapRow(ResultSet rs) throws SQLException {
				ManagerBoard board = new ManagerBoard();
				board.setNo(rs.getInt("manager_board_no"));
				board.setTitle(rs.getString("manager_board_title"));
				board.setContent(rs.getString("manager_board_content"));
				board.setViewCnt(rs.getInt("manager_board_view_count"));
				board.setRegistedDate(rs.getDate("manager_board_registered_date"));
				board.setCateName(rs.getString("manager_board_cate_name"));
				board.setUserId(rs.getString("user_id"));
				board.setCateNo(rs.getInt("manager_board_cate_no"));
				return board;
			}
		}, no);
	}
	
	public void updateManagerBoardByNo(ManagerBoard board) throws SQLException {
		JdbcHelper.update(QueryUtil.getSQL("managerBoard.updateManagerBoardByNo"), board.getTitle(),
				board.getContent(), board.getViewCnt(), board.getNo());
	}
	
	
	public ManagerBoard preView (int managerBoardNo, int cateNo) throws SQLException {
		return JdbcHelper.selectOne(QueryUtil.getSQL("noticesBoard.preView"), new RowMapper<ManagerBoard>() {
			@Override
			public ManagerBoard mapRow(ResultSet rs) throws SQLException {
				ManagerBoard board = new ManagerBoard();
				board.setNo(rs.getInt("manager_board_no"));
				board.setTitle(rs.getString("manager_board_title"));
				board.setContent(rs.getString("manager_board_content"));
				board.setViewCnt(rs.getInt("manager_board_view_count"));
				board.setRegistedDate(rs.getDate("manager_board_registered_date"));
		
				board.setUserId("user_id");
				board.setCateNo(rs.getInt("manager_board_cate_no"));
				return board;
			}
		},cateNo , managerBoardNo);
	}
	
	public ManagerBoard afterView (int managerBoardNo, int cateNo) throws SQLException {
		return JdbcHelper.selectOne(QueryUtil.getSQL("noticesBoard.afterView"), new RowMapper<ManagerBoard>() {
			@Override
			public ManagerBoard mapRow(ResultSet rs) throws SQLException {
				ManagerBoard board = new ManagerBoard();
				board.setNo(rs.getInt("manager_board_no"));
				board.setTitle(rs.getString("manager_board_title"));
				board.setContent(rs.getString("manager_board_content"));
				board.setViewCnt(rs.getInt("manager_board_view_count"));
				board.setRegistedDate(rs.getDate("manager_board_registered_date"));
			
				board.setUserId("user_id");
				board.setCateNo(rs.getInt("manager_board_cate_no"));
				return board;
			}
		},cateNo ,managerBoardNo);
	}
	
	public void deleteNotice(ManagerBoard managerBoard) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("noticesBoard.deleteNotice"));
		pstmt.setInt(1, managerBoard.getNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}

	public void updateEvent(ManagerBoard managerBoard) throws SQLException {
		JdbcHelper.update(QueryUtil.getSQL("eventBoard.updateEvent"), managerBoard.getTitle(), managerBoard.getCateNo(), managerBoard.getNo());
	}
	
	public void updateNotice(ManagerBoard managerBoard) throws SQLException {
		JdbcHelper.update(QueryUtil.getSQL("noticesBoard.updateNotice"), managerBoard.getTitle(), managerBoard.getNo());
	}
	
	public List<ManagerBoard> getTopfive() throws SQLException {
		List<ManagerBoard> topfives = new ArrayList<ManagerBoard>();
		
		Connection connection = ConnectionUtil.getConnection();
		
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("managerBoard.getTopfive").toString());
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			ManagerBoard topfive = new ManagerBoard();
			topfive.setNo(rs.getInt("MANAGER_BOARD_NO"));
			topfive.setTitle(rs.getString("MANAGER_BOARD_TITLE"));
			topfive.setContent(rs.getString("MANAGER_BOARD_CONTENT"));
			topfive.setViewCnt(rs.getInt("MANAGER_BOARD_VIEW_COUNT"));
			topfive.setRegistedDate(rs.getDate("MANAGER_BOARD_REGISTERED_DATE"));
			topfive.setUserId(rs.getString("USER_ID"));
			topfive.setCateNo(rs.getInt("MANAGER_BOARD_CATE_NO"));
			topfive.setCateName(rs.getString("MANAGER_BOARD_CATE_NAME"));
			
			
			topfives.add(topfive);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return topfives;
	}
}
