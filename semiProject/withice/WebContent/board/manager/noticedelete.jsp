<%@page import="com.withice.util.NumberUtil"%>
<%@page import="com.withice.vo.ManagerBoard"%>
<%@page import="com.withice.dao.ManagerBoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	

		int managerBoardNo = NumberUtil.stringToInt(request.getParameter("noticeno"));

		ManagerBoardDao managerBoardDao = new ManagerBoardDao();
		ManagerBoard managerBoard = managerBoardDao.getManagerBoardByNo(managerBoardNo);
		managerBoardDao.deleteNotice(managerBoard);


		response.sendRedirect("noticelist.jsp");

%>