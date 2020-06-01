<%@page import="com.simple.vo.Board"%>
<%@page import="com.simple.dao.BoardDao"%>
<%@page import="com.simple.vo.Reply"%>
<%@page import="com.simple.dao.ReplyDao"%>
<%@page import="com.simple.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp" %>
<%
	request.setCharacterEncoding("utf-8");

	int boardNo = NumberUtil.stringToInt(request.getParameter("boardno"));
	String content = request.getParameter("content"); 
	
	Reply reply = new Reply();
	reply.setWriter(userId);
	reply.setContent(content);
	reply.setBoardNo(boardNo);
	
	ReplyDao replyDao = new ReplyDao();
	replyDao.insertReply(reply);
	
	BoardDao boardDao = new BoardDao();
	Board board = boardDao.getBoardByNo(boardNo);
	
	board.setReplyCnt(board.getReplyCnt() + 1);
	boardDao.updateBoard(board);
	
	response.sendRedirect("../board/detail.jsp?no=" + boardNo);
%>