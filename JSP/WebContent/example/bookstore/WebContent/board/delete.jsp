<%@page import="com.bookstore.vo.Board"%>
<%@page import="com.bookstore.dao.BoardDao"%>
<%@page import="com.bookstore.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int boardNo = NumberUtil.stringToInt(request.getParameter("boardno"));

	BoardDao boardDao = new BoardDao();
	Board board = boardDao.getBoardByNo(boardNo);
	
	board.setDelYN("Y");
	
	boardDao.deleteBoard(board);
	
	response.sendRedirect("list.jsp");
%>