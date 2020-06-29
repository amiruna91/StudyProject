<%@page import="com.withice.vo.ManagerBoard"%>
<%@page import="com.withice.dao.ManagerBoardDao"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int noticeNo = NumberUtil.stringToInt(request.getParameter("noticeno"));
	int eventNo = NumberUtil.stringToInt(request.getParameter("eventno"));
	
	ManagerBoardDao dao = new ManagerBoardDao();
	
	
	if (noticeNo != 0) {
		ManagerBoard managerBoard = dao.getManagerBoardByNo(noticeNo);
		managerBoard.setViewCnt(managerBoard.getViewCnt() + 1);
		dao.updateManagerBoardByNo(managerBoard);
		
		response.sendRedirect("noticeDetail.jsp?noticeno=" + noticeNo);
		return;
	}
	
	if (eventNo != 0) {
		ManagerBoard managerBoard = dao.getManagerBoardByNo(eventNo);
		managerBoard.setViewCnt(managerBoard.getViewCnt() + 1);
		dao.updateManagerBoardByNo(managerBoard);
		
		response.sendRedirect("eventDetail.jsp?eventno=" + eventNo);
		return;
	}
%>