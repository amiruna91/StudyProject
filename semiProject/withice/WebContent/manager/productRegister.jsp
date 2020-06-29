<%@page import="com.withice.vo.Product"%>
<%@page import="com.withice.dao.ProductDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String saveDirectory = application.getInitParameter("imageSaveDirectory") + "product-images";
	int maxPostSize = NumberUtil.stringToInt(application.getInitParameter("maxUploadFileSize"));
	String encoding = "utf-8";
	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
	
	String name = mr.getParameter("product-name");
	int price = NumberUtil.stringToInt(mr.getParameter("product-price"));
	int stock = NumberUtil.stringToInt(mr.getParameter("prdouct-stock"));
	String comment = mr.getParameter("product-comment");
	String thumbnail = mr.getFilesystemName("product-thumbnail");
	int cateNo = NumberUtil.stringToInt(mr.getParameter("subCategory"));
	String option = mr.getParameter("product-option");
	
	Product product = new Product();
	product.setName(name);
	product.setPrice(price);
	product.setStock(stock);
	product.setComment(comment);
	product.setThumbnail(thumbnail);
	product.setCateNo(cateNo);
	product.setOption(option);
	
	ProductDao productDao = new ProductDao();
	
	productDao.insertNewProduct(product);
	
	response.sendRedirect("manager.jsp");
	
%>