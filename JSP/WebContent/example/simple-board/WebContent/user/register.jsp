<%@page import="com.simple.dao.UserDao"%>
<%@page import="com.simple.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String userId = request.getParameter("id");
	String userName = request.getParameter("name");
	String password = request.getParameter("pwd");
	String email = request.getParameter("email");
	
	UserDao userDao = new UserDao();
	User user = userDao.getUserById(userId);
	
	if (user != null) {
		response.sendRedirect("form.jsp?error=dup");
		return;
	}
	
	User newUser = new User();
	newUser.setUserId(userId);
	newUser.setUserName(userName);
	newUser.setPassword(password);
	newUser.setEmail(email);
	
	userDao.insertUser(newUser);
	
	response.sendRedirect("/simple-board/home.jsp");
%>