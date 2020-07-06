package com.simple.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.simple.dto.TodoDto;
import com.simple.service.TodoService;
import com.simple.util.NumberUtil;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;

@Controller
public class HomeController {

	private TodoService todoService = new TodoService();
	private JSONView jsonView = new JSONView();
	
	@RequestMapping("/home.hta")
	public ModelAndView home(HttpServletRequest req, HttpServletResponse res) throws Exception {
		List<TodoDto> todos = todoService.getRecentTodos();
		
		ModelAndView mav = new ModelAndView();
		mav.addAttribute("todos", todos);
		mav.setViewName("home.jsp");
		
		return mav;
	}
	
	@RequestMapping("/detail.hta")
	public ModelAndView detail(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int no = NumberUtil.stringToInt(req.getParameter("todoNo"));
		TodoDto todo = todoService.getTodoByNo(no);
		
		ModelAndView mav = new ModelAndView();
		mav.addAttribute("detailTodo", todo);
		mav.setView(jsonView);
		return mav;
	}
}
