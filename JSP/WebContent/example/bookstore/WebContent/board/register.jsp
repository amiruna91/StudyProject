<%@page import="com.bookstore.dao.BoardDao"%>
<%@page import="com.bookstore.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String writer = request.getParameter("writer");
	String password = request.getParameter("password");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	Board board = new Board();
	board.setWriter(writer);
	board.setPassword(password);
	board.setTitle(title);
	board.setContent(content);
	
	BoardDao boardDao = new BoardDao();
	boardDao.insertBoard(board);
	
	response.sendRedirect("list.jsp");
%>