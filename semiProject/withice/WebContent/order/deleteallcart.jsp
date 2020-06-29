<%@page import="com.withice.dao.CartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../common/logincheck.jsp"%>
<%
	
	CartDao cartDao = new CartDao();
	cartDao.deleteAllCart();
	
	response.sendRedirect("/withice/order/basket.jsp");
%>