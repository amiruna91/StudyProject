<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String logincheck = (String) session.getAttribute("LOGINED_YN");
	String userName = (String) session.getAttribute("LOGINED_USER_NAME");
	String userId = (String) session.getAttribute("LOGINED_USER_ID");
	
	if (!"Y".equals(logincheck)) {
		response.sendRedirect("/simple-board/user/loginform.jsp?error=deny");
		return;
	}
	
%>