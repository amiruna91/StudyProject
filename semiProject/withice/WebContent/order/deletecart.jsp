<%@page import="com.withice.util.NumberUtil"%>
<%@page import="com.withice.vo.Cart"%>
<%@page import="com.withice.dao.CartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp"%>
<%
	String [] productNo = request.getParameterValues("product_no");
	String [] splitProductNo = {};
	for(int i=0; i<productNo.length; i++){
		splitProductNo = productNo[i].split(",");
	}
	CartDao cartDao = new CartDao();
	for(int i=0; i<splitProductNo.length; i++){
		cartDao.deleteCart(NumberUtil.stringToInt(splitProductNo[i]));
	}
	
	response.sendRedirect("/withice/order/basket.jsp");
%>