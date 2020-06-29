<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (!"Y".equals(loginedYN)) {
		response.sendRedirect("/withice/login/loginform.jsp?error=deny");
		return;
	}
%>