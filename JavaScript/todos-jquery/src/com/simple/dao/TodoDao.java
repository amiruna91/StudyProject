package com.simple.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.simple.util.ConnectionUtil;
import com.simple.util.JdbcHelper;
import com.simple.util.JdbcHelper.RowMapper;
import com.simple.util.QueryUtil;
import com.simple.vo.Todo;

public class TodoDao {

	/**
	 * 새로 추가할 Todo의 시퀀스 번호를 조회한다.
	 * @return 시퀀스 번호
	 * @throws SQLException
	 */
	public int getTodoSequence() throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("todo.getTodoSequence"));
		ResultSet rs = pstmt.executeQuery();
		int seq = rs.getInt("seq");
		
		rs.close();
		pstmt.close();
		connection.close();
	
		return seq;
	}
	
	/**
	 * 지정된 Todo객체의 정보를 DB에 저장한다.
	 * @param todo 새 일정 정보
	 * @throws SQLException
	 */
	public void insertTodo(Todo todo) throws SQLException {
		JdbcHelper.insert(QueryUtil.getSQL("todo.insertTodo"), todo.getNo(), todo.getTitle(),
				todo.getContent(),todo.getDay(), todo.getStatus(), todo.getUserId());
	}
	
	/**
	 * 지정된 사용자가 등록한 모든 일정을 일정번호의 역순으로 정렬해서 반환한다.
	 * @param userId 사용자 아이디
	 * @return 해당 사용자가 등록한 모든 일정
	 * @throws SQLException
	 */
	public List<Todo> getTodoByUserId(String userId) throws SQLException {
		return JdbcHelper.selectList(QueryUtil.getSQL("todo.getTodoByUserId"), new RowMapper<Todo>() {
			@Override
			public Todo mapRow(ResultSet rs) throws SQLException {
				Todo todo = new Todo();
				todo.setNo(rs.getInt("todo_no"));
				todo.setTitle(rs.getString("todo_title"));
				todo.setContent(rs.getString("todo_content"));
				todo.setDay(rs.getDate("todo_day"));
				todo.setCompletedDay(rs.getDate("todo_completed_day"));
				todo.setStatus(rs.getString("todo_status"));
				todo.setUserId(rs.getString("user_id"));
				todo.setCreatedDate(rs.getDate("todo_created_date"));
				return todo;
			}
		}, userId);
	}
	
	/**
	 * 지정된 일정번호에 해당하는 일정정보를 반환한다.
	 * @param todoNo 일정번호
	 * @return 일정 정보
	 * @throws SQLException
	 */
	public Todo getTodoByNo(int todoNo) throws SQLException {
		return JdbcHelper.selectOne(QueryUtil.getSQL("todo.getTodoByNo"), new RowMapper<Todo>() {
			@Override
			public Todo mapRow(ResultSet rs) throws SQLException {
				Todo todo = new Todo();
				todo.setNo(rs.getInt("todo_no"));
				todo.setTitle(rs.getString("todo_title"));
				todo.setContent(rs.getString("todo_content"));
				todo.setDay(rs.getDate("todo_day"));
				todo.setCompletedDay(rs.getDate("todo_completed_day"));
				todo.setStatus(rs.getString("todo_status"));
				todo.setUserId(rs.getString("user_id"));
				todo.setCreatedDate(rs.getDate("todo_created_date"));
				return todo;
			}
		}, todoNo);
	}
	
	/**
	 * 지정된 일정정보의 변경내용을 DB에 반영한다.
	 * @param todo 변경된 정보를 포함하고 있는 일정정보
	 * @throws SQLException
	 */
	public void updateTodo(Todo todo) throws SQLException {
		JdbcHelper.update(QueryUtil.getSQL("todo.updateTodo"), todo.getTitle(), todo.getContent(),
				todo.getDay(), todo.getCompletedDay(), todo.getStatus(), todo.getNo());
	}
}
