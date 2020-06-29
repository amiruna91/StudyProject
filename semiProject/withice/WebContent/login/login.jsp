<%@page import="com.withice.vo.User"%>
<%@page import="com.withice.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String userId = request.getParameter("userid");
	String password = request.getParameter("userpwd");
	
	UserDao userDao = new UserDao();
	User user = userDao.getUserSimpleInfo(userId);
	
	// 아이디에 해당하는 사용자 정보가 없음
	if (user == null) {
		response.sendRedirect("loginform.jsp?error=false");
		return;
	}
	
	// 비밀번호 불일치
	if (!user.getPassword().equals(password)) {
		response.sendRedirect("loginform.jsp?error=false");
		return;
	}
	
	if ("Y".equals(user.getDrop())) {
		response.sendRedirect("loginform.jsp?error=false");
		return;
	}

	
	session.setAttribute("LOGIN_USERID", userId);
	session.setAttribute("LOGIN_USER_NAME", user.getName());
	session.setAttribute("LOGIN_YN", "Y");
	session.setAttribute("ADMIN_STATUS", user.getAdmin());
	
	response.sendRedirect("/withice/home.jsp");
%>