<%@page import="com.withice.dao.QuestionDao"%>
<%@page import="com.withice.vo.Question"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int questionNo = NumberUtil.stringToInt(request.getParameter("questionno"));
	QuestionDao questionDao = new QuestionDao();
	
	Question question = questionDao.getQuestionByNo(questionNo);
	
	
	if ("N".equals(adminLogin) && !question.getUserId().equals(loginedUserId)) {
		response.sendRedirect("list.jsp?error=false");
		return;
	}

	// 조회수 증가 db 작업
	questionDao.updateViewCount(questionNo);
	
	response.sendRedirect("detail.jsp?questionno=" + questionNo);
%>