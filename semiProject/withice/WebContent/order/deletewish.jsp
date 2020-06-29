<%@page import="com.withice.dao.WishListDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp"%>
<%
int productNo = Integer.parseInt(request.getParameter("product_no"));
	
	WishListDao wishListDao = new WishListDao();
	wishListDao.deleteWishList(productNo);
	
	response.sendRedirect("/withice/myshop/wish_list.jsp");
%>