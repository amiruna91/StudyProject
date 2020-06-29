<%@page import="com.withice.dao.RecentlyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp"%>
<%
	int recentlyNo = Integer.parseInt(request.getParameter("recently_no"));

	RecentlyDao recentlyDao = new RecentlyDao();
	recentlyDao.deleteRecently(recentlyNo);
	
	response.sendRedirect("recent_view_product.jsp");
%>