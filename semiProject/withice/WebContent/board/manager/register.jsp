<%@page import="com.withice.dao.ManagerBoardDao"%>
<%@page import="com.withice.vo.ManagerBoard"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String saveDirectory = application.getInitParameter("imageSaveDirectory") + "managerBoard";
	int maxPostSize = NumberUtil.stringToInt(application.getInitParameter("maxUploadFileSize"));
	String encoding = "utf-8";
	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
	
	int cateNo = NumberUtil.stringToInt(mr.getParameter("cateno"));
	String title  = mr.getParameter("title");
	String content = mr.getFilesystemName("upfile");
	
	ManagerBoardDao managerBoardDao = new ManagerBoardDao();
	
	ManagerBoard managerBoard = new ManagerBoard();
	managerBoard.setTitle(title);
	managerBoard.setContent(content);
	managerBoard.setCateNo(cateNo);
	managerBoard.setUserId("WITHICE [위드아이스]");
	
	managerBoardDao.insertBoard(managerBoard);
	
	
	if (cateNo == 1) {
		response.sendRedirect("noticelist.jsp");
	} else {
		response.sendRedirect("eventlist.jsp");
	}
%>
    