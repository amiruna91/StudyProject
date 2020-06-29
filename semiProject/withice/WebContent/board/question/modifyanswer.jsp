<%@page import="com.withice.dao.AnswerDao"%>
<%@page import="com.withice.vo.Answer"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int no = NumberUtil.stringToInt(request.getParameter("questionNo"));
	String content = request.getParameter("answercontent");
	
	if ("".equals(content)) {
		content = "   ";
	}
	
	Answer answer = new Answer();
	answer.setAnswerContent(content);
	answer.setQuestionNo(no);
	
	AnswerDao answerDao = new AnswerDao();
	answerDao.updateAnswer(answer);
	
	response.sendRedirect("list.jsp");
%>