<%@page import="com.google.gson.Gson"%>
<%@page import="com.withice.dto.ProductWithCategoryName"%>
<%@page import="com.withice.vo.Product"%>
<%@page import="com.withice.dao.ProductDao"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int productNo = NumberUtil.stringToInt(request.getParameter("productno"));
	
	ProductDao dao = new ProductDao();
	
	ProductWithCategoryName pro = dao.getProductWithCateName(productNo);
	
	Gson gson = new Gson();
	
	out.write(gson.toJson(pro));
%>