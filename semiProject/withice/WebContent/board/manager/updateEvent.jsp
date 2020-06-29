<%@page import="com.withice.util.NumberUtil"%>
<%@page import="com.withice.dao.ManagerBoardDao"%>
<%@page import="com.withice.vo.ManagerBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int eventNo = NumberUtil.stringToInt(request.getParameter("eventno"));
	String title = request.getParameter("title");
	int cateNo = NumberUtil.stringToInt(request.getParameter("eventstatus"));
	
	ManagerBoardDao dao = new ManagerBoardDao();
	ManagerBoard board = dao.getManagerBoardByNo(eventNo);
	board.setTitle(title);
	board.setCateNo(cateNo);
	
	dao.updateEvent(board);
	
	response.sendRedirect("eventDetail.jsp?eventno=" + eventNo);
	
%>