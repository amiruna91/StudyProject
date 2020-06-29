<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String loginedUserId = (String) session.getAttribute("LOGIN_USERID");
	String loginedUserName = (String) session.getAttribute("LOGIN_USER_NAME");
	String loginedYN = (String) session.getAttribute("LOGIN_YN");
	String adminLogin = (String) session.getAttribute("ADMIN_STATUS");
%>