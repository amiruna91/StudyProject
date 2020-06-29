<%@page import="com.withice.vo.User"%>
<%@page import="com.withice.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	UserDao userDao = new UserDao();
	User user = userDao.getUserById(loginedUserId);
	
	user.setDrop("Y");
	
	userDao.updateUser(user);
	
	response.sendRedirect("../login/logout.jsp");
%>