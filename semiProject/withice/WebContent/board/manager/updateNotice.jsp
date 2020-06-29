<%@page import="com.withice.util.NumberUtil"%>
<%@page import="com.withice.dao.ManagerBoardDao"%>
<%@page import="com.withice.vo.ManagerBoard"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int noticeNo = NumberUtil.stringToInt(request.getParameter("noticeno"));
	String title = request.getParameter("title");

	
	ManagerBoardDao dao = new ManagerBoardDao();
	ManagerBoard board = dao.getManagerBoardByNo(noticeNo);
	board.setTitle(title);

	
	dao.updateNotice(board);
	
	response.sendRedirect("noticeDetail.jsp?noticeno=" + noticeNo);
	
%>