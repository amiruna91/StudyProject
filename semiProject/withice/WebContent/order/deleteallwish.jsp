<%@page import="com.withice.dao.WishListDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../common/logincheck.jsp"%>
<%
	WishListDao wishListDao = new WishListDao();
	wishListDao.deleteAllWishList();
	
	response.sendRedirect("/withice/myshop/wish_list.jsp");
%>