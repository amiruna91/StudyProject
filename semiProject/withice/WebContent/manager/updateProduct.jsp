<%@page import="com.withice.vo.Product"%>
<%@page import="com.withice.dao.ProductDao"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");	

	int no = NumberUtil.stringToInt(request.getParameter("no"));
	String name = request.getParameter("name");
	int price = NumberUtil.stringToInt(request.getParameter("price"));
	int stock = NumberUtil.stringToInt(request.getParameter("stock"));
	String comment = request.getParameter("comment");
	String option = request.getParameter("option");
	
	ProductDao productDao = new ProductDao();
	Product product = new Product();
	product.setNo(no);
	product.setName(name);
	product.setPrice(price);
	product.setStock(stock);
	product.setComment(comment);
	product.setOption(option);
	
	productDao.updateProduct(product);
	
	response.sendRedirect("manager.jsp");
%>