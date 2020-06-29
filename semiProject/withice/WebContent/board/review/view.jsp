<%@page import="com.withice.dao.ReviewDao"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int reviewNo = NumberUtil.stringToInt(request.getParameter("reviewno"));
	
	// 조회수 증가 db 작업
	ReviewDao reviewDao = new ReviewDao();
	reviewDao.updateViewCount(reviewNo);
	
	response.sendRedirect("detail.jsp?reviewno=" + reviewNo);
%>