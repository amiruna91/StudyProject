<%@page import="com.withice.vo.Question"%>
<%@page import="com.withice.dao.QuestionDao"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int questionNo = NumberUtil.stringToInt(request.getParameter("questionno"));

	QuestionDao questionDao = new QuestionDao();
	Question question = questionDao.getQuestionByNo(questionNo);
	
	question.setDelYN("Y");
	
	questionDao.deleteQuestion(question);
	
	response.sendRedirect("list.jsp");
	
	
	
%>