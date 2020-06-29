<%@page import="com.withice.vo.Review"%>
<%@page import="com.withice.dao.ReviewDao"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int reviewNo = NumberUtil.stringToInt(request.getParameter("reviewno"));
	
	ReviewDao reviewDao = new ReviewDao();
	Review review = reviewDao.getReviewByNo(reviewNo);
	
	review.setDelYn("Y");
	
	reviewDao.deleteReview(review);
	
	response.sendRedirect("list.jsp");

%>