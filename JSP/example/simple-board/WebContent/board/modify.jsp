<%@page import="com.simple.vo.Board"%>
<%@page import="com.simple.dao.BoardDao"%>
<%@page import="com.simple.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp" %>
<%
	request.setCharacterEncoding("utf-8");

	int boardNo = NumberUtil.stringToInt(request.getParameter("no"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	BoardDao boardDao = new BoardDao();
	Board board = boardDao.getBoardByNo(boardNo);
	
	board.setTitle(title);
	board.setContent(content);
	
	boardDao.updateBoard(board);
	
	response.sendRedirect("detail.jsp?no=" + boardNo);
%>