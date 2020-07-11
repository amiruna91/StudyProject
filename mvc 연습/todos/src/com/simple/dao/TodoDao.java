package com.simple.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.simple.dto.TodoDto;
import com.simple.util.ConnectionUtil;
import com.simple.util.JdbcHelper;
import com.simple.util.JdbcHelper.RowMapper;
import com.simple.util.QueryUtil;

public class TodoDao {
	
	private static TodoDao self = new TodoDao();	// 정적변수 self에 TodoDao객체를 담아둔다.
	private TodoDao() {} 							// 생성자의 외부 접근을 차단한다.
	public static TodoDao getInstance() {			// 미리 생성된 TodoDao객체를 제공하는 기능이다.
		return self;
	}

	public List<TodoDto> getRecentTodos() throws SQLException {
		return JdbcHelper.selectList(QueryUtil.getSQL("todo.getRecentTodos"), new RowMapper<TodoDto>() {
			@Override
			public TodoDto mapRow(ResultSet rs) throws SQLException {
				TodoDto todoDto = new TodoDto();
				todoDto.setNo(rs.getInt("todo_no"));
				todoDto.setTitle(rs.getString("todo_title"));
				todoDto.setContent(rs.getString("todo_content"));
				todoDto.setDay(rs.getDate("todo_day"));
				todoDto.setCompletedDay(rs.getDate("todo_completed_day"));
				todoDto.setStatus(rs.getString("todo_status"));
				todoDto.setCreateDate(rs.getDate("todo_created_date"));
				todoDto.setUserId(rs.getString("user_id"));
				todoDto.setUserName(rs.getString("user_name"));
				return todoDto;
			}
		});
	}
	
	public TodoDto getTodoByNo(int no) throws SQLException {
		return JdbcHelper.selectOne(QueryUtil.getSQL("todo.getTodoByNo"), new RowMapper<TodoDto>() {
			@Override
			public TodoDto mapRow(ResultSet rs) throws SQLException {
				TodoDto todoDto = new TodoDto();
				todoDto.setNo(rs.getInt("todo_no"));
				todoDto.setTitle(rs.getString("todo_title"));
				todoDto.setContent(rs.getString("todo_content"));
				todoDto.setDay(rs.getDate("todo_day"));
				todoDto.setCompletedDay(rs.getDate("todo_completed_day"));
				todoDto.setStatus(rs.getString("todo_status"));
				todoDto.setCreateDate(rs.getDate("todo_created_date"));
				todoDto.setUserId(rs.getString("user_id"));
				todoDto.setUserName(rs.getString("user_name"));
				return todoDto;
			}
		}, no);
	}
	
	public void updateTodo(TodoDto todo) throws SQLException {
		JdbcHelper.update(QueryUtil.getSQL("todo.updateTodo"), todo.getTitle(), todo.getContent(),
				todo.getDay(), todo.getCompletedDay(), todo.getStatus(), todo.getNo());
	}
	
	public int getTotalRows(String userId, String status, String keyword) throws Exception {
		String sql = "select count(*) cnt ";
			   sql += "from sample_todos ";
			   sql += "where user_id = '" + userId  +"' ";
		if (!"전체".equals(status)) {
			sql += "and todo_status = '"+ status + "' ";
		}
		if (!keyword.isEmpty()) {
			sql += "and todo_title like '%' || '" + keyword +"' || '%' ";
		}
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		int totalRows = rs.getInt(1);
		rs.close();
		pstmt.close();
		connection.close();
		
		return totalRows;
	}
	
	public List<TodoDto> getTodos(String userId, String status, String keyword, 
			int beginIndex, int endIndex) throws SQLException {
		
		String sql = "select * ";
		sql += "	  from (select A.*, row_number() over(order by A.todo_no desc) rn ";
		sql += "	  		from sample_todos A ";
		sql += "			where user_id = '" + userId  +"' ";
		
		if (!"전체".equals(status)) {
			sql += "and todo_status = '"+ status + "' ";
		}
		if (!keyword.isEmpty()) {
			sql += "and todo_title like '%' || '" + keyword +"' || '%' ";
		}
		sql += "	) where rn >= "+ beginIndex +" and rn <= " + endIndex;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		List<TodoDto> todos = new ArrayList<TodoDto>();
		
		while (rs.next()) {
			TodoDto todoDto = new TodoDto();
			todoDto.setNo(rs.getInt("todo_no"));
			todoDto.setTitle(rs.getString("todo_title"));
			todoDto.setContent(rs.getString("todo_content"));
			todoDto.setDay(rs.getDate("todo_day"));
			todoDto.setCompletedDay(rs.getDate("todo_completed_day"));
			todoDto.setStatus(rs.getString("todo_status"));
			todoDto.setCreateDate(rs.getDate("todo_created_date"));
			
			todos.add(todoDto);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return todos;
	}
}
