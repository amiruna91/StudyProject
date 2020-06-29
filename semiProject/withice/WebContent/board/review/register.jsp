<%@page import="com.withice.vo.Review"%>
<%@page import="com.withice.dao.ReviewDao"%>
<%@page import="com.withice.vo.QuestionCategory"%>
<%@page import="com.withice.dao.QuestionDao"%>
<%@page import="com.withice.vo.Question"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/logincheck.jsp" %>
<%
	String saveDirectory = application.getInitParameter("imageSaveDirectory") + "review";
	int maxPostSize = NumberUtil.stringToInt(application.getInitParameter("maxUploadFileSize"));
	String encoding = "utf-8";
	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
	
	int orderDetailNo= NumberUtil.stringToInt(mr.getParameter("orderDetailNo"));
	String title = mr.getParameter("title");
	String content = mr.getParameter("content");
	String fileName = mr.getFilesystemName("upfile");
	
	ReviewDao reviewDao = new ReviewDao();
	
	Review review = new Review();
	review.setTitle(title);
	review.setContent(content);
	review.setImage(fileName);
	review.setUserId(loginedUserId);
	review.setOrderDetailNo(orderDetailNo);

	
	reviewDao.insertReview(review);
	
	response.sendRedirect("list.jsp");
	
	

%>
    