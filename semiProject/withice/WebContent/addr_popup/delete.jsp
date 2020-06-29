<%@page import="com.withice.util.NumberUtil"%>
<%@page import="com.withice.vo.Address"%>
<%@page import="com.withice.dao.AddressDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int no = NumberUtil.stringToInt(request.getParameter("addressno"));
	
	AddressDao addressDao = new AddressDao();
	addressDao.deleteAddress(no);
	
	response.sendRedirect("list.jsp");
%>