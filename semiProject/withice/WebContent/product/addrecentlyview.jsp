<%@page import="com.withice.dto.RecentlyDetailDto"%>
<%@page import="java.util.List"%>
<%@page import="com.withice.vo.Recently"%>
<%@page import="com.withice.dao.RecentlyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int productNo = Integer.parseInt(request.getParameter("productno"));
	int cateNo = Integer.parseInt(request.getParameter("cateno"));
	
	RecentlyDao recentlyDao = new RecentlyDao();
	if(loginedUserId != null){
		Recently recently = new Recently();
		recently.setProductNo(productNo);
		recently.setUserId(loginedUserId);		
		
		recentlyDao.insertRecently(recently);
	}
	
	response.sendRedirect("/withice/product/productDetail.jsp?cateno="+cateNo+"&productno="+productNo);
%>