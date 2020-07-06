package com.simple.service;

import java.util.List;

import com.simple.dao.TodoDao;
import com.simple.dto.TodoDto;

public class TodoService {

	private TodoDao todoDao = new TodoDao();
	
	public List<TodoDto> getRecentTodos() throws Exception {
		return todoDao.getRecentTodos();
	}
	
	public TodoDto getTodoByNo(int no) throws Exception {
		return todoDao.getTodoByNo(no);
	}
}
