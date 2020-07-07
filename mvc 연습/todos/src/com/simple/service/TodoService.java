package com.simple.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.simple.dao.TodoDao;
import com.simple.dto.TodoDto;

import kr.co.jhta.util.pagination.Pagination;

public class TodoService {

	private TodoDao todoDao = new TodoDao();
	
	public List<TodoDto> getRecentTodos() throws Exception {
		return todoDao.getRecentTodos();
	}
	
	public TodoDto getTodoDetail(int no) throws Exception {
		return todoDao.getTodoByNo(no);
	}
	
	public TodoDto updateTodoStatus(int todoNo, String status) throws Exception {
		TodoDto todo = todoDao.getTodoByNo(todoNo);
		
		todo.setStatus(status);
		
		
		if ("처리완료".equals(status)) {
			todo.setCompletedDay(new Date());
		} else {
			todo.setCompletedDay(null);
		}
		
		todoDao.updateTodo(todo);
		
		return todo;
	}

	public Map<String, Object> getTodoList(String userId, int pageNo, int rows, String status, String keyword) throws Exception {
		
		int totalRows = todoDao.getTotalRows(userId, status, keyword);
		
		Pagination pagination = new Pagination(pageNo, rows, totalRows);
		int beginIndex = (pageNo - 1)*rows + 1;
		int endIndex = pageNo*rows;
		List<TodoDto> todos = todoDao.getTodos(userId, status, keyword, beginIndex, endIndex);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("todos", todos);
		map.put("pagination", pagination);
		
		return map;
	}
}
