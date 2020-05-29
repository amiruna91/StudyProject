<%@page import="com.simple.vo.User"%>
<%@page import="com.simple.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = request.getParameter("id");
	String password = request.getParameter("pwd");
	
	UserDao userDao = new UserDao();
	User user = userDao.getUserById(userId);
	
	if (user == null) {
		response.sendRedirect("loginform.jsp?error=fail");
		return;
	}
	
	if (!password.equals(user.getPassword())) {
		response.sendRedirect("loginform.jsp?error=fail");
		return;
	}
	
	session.setAttribute("LOGINED_USER_ID", userId);
	session.setAttribute("LOGINED_USER_NAME", user.getUserName());
	session.setAttribute("LOGINED_YN", "Y");
	
	response.sendRedirect("/simple-board/home.jsp");
%>