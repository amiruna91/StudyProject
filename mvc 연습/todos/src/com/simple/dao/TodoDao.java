package com.simple.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.simple.dto.TodoDto;
import com.simple.util.JdbcHelper;
import com.simple.util.JdbcHelper.RowMapper;
import com.simple.util.QueryUtil;

public class TodoDao {

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
}
