<%@page import="com.bookstore.vo.Board"%>
<%@page import="com.bookstore.util.NumberUtil"%>
<%@page import="com.bookstore.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	int boardNo = NumberUtil.stringToInt(request.getParameter("boardno"));
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String password = request.getParameter("password");
	
	BoardDao boardDao = new BoardDao();
	Board board = boardDao.getBoardByNo(boardNo);
	
	if (!(board.getPassword().equals(password))) {
		response.sendRedirect("modifyform.jsp?boardno=" + boardNo + "&err=pwd");
		return;
	}
	
	board.setWriter(writer);
	board.setTitle(title);
	board.setContent(content);
	
	boardDao.updateBoard(board);
	
	response.sendRedirect("detail.jsp?boardno=" + boardNo);
%>