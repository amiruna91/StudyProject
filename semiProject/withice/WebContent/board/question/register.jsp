<%@page import="com.withice.vo.QuestionCategory"%>
<%@page import="com.withice.dao.QuestionDao"%>
<%@page import="com.withice.vo.Question"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/logincheck.jsp" %>
<%
	String saveDirectory = application.getInitParameter("imageSaveDirectory") + "questions";
	int maxPostSize = NumberUtil.stringToInt(application.getInitParameter("maxUploadFileSize"));
	String encoding = "utf-8";
	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
	
	int productNo= NumberUtil.stringToInt(mr.getParameter("productNo"));
	int cateNo = NumberUtil.stringToInt(mr.getParameter("cate"));
	String subject = mr.getParameter("subject");
	String content = mr.getParameter("content");
	String fileName = mr.getFilesystemName("upfile");
	
	QuestionDao questionDao = new QuestionDao();
	QuestionCategory category =  questionDao.getCategoryByNo(cateNo);
	
	Question question = new Question();
	question.setTitle(category.getTitle());
	question.setContent(content);
	question.setImage(fileName);
	question.setUserId(loginedUserId);
	question.setProductNo(productNo);
	question.setCateNo(cateNo);
	question.setSubject(subject);
	
	questionDao.insertQuestion(question);
	
	response.sendRedirect("list.jsp");
	
	

%>