<%@page import="com.simple.dao.BoardDao"%>
<%@page import="com.simple.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	Board board = new Board();
	board.setTitle(title);
	board.setWriter(userId);
	board.setContent(content);
	
	BoardDao boardDao = new BoardDao();
	boardDao.insertBoard(board);
	
	response.sendRedirect("list.jsp");
%>