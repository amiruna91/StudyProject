<%@page import="com.google.gson.Gson"%>
<%@page import="com.withice.vo.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.withice.vo.Pagenation"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@page import="com.withice.dao.ProductDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ProductDao productDao = new ProductDao();
	int proPageNo = NumberUtil.stringToInt(request.getParameter("proPageNo"), 1);
	int totalProduct = productDao.getAllProductCnt();
	Pagenation pagenation = new Pagenation(totalProduct, 10, 5, proPageNo);
	List<Product> products = productDao.getAllProducts(pagenation.getBeginIndex(), pagenation.getEndIndex());
	
	Gson gson = new Gson();
	String jsonText = gson.toJson(products);
	
	out.write(jsonText);
%>