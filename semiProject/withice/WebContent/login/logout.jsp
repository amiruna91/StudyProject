<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 로그아웃 세션을 없엔다
	session.invalidate();

	response.sendRedirect("/withice/home.jsp");
%>