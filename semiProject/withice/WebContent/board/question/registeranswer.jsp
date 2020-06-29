<%@page import="com.withice.dao.QuestionDao"%>
<%@page import="com.withice.vo.Question"%>
<%@page import="com.withice.dao.AnswerDao"%>
<%@page import="com.withice.vo.Answer"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int questionNo = NumberUtil.stringToInt(request.getParameter("questionNo"));
	String content = request.getParameter("answercontent");
		
	Answer answer = new Answer();
	answer.setAnswerContent(content);
	answer.setQuestionNo(questionNo);
	
	QuestionDao questionDao = new QuestionDao();
	
	Question question = questionDao.getQuestionByNo(questionNo);
	question.setStatus(1);
	
	AnswerDao answerDao = new AnswerDao();
	answerDao.registerAnswer(answer);
	questionDao.updateQuestion(question);
	
	response.sendRedirect("list.jsp");
%>