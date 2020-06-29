<%@page import="com.withice.dao.ProductDao"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String saveDirectory = application.getInitParameter("imageSaveDirectory") + "productInfo-images";
	int maxPostSize = NumberUtil.stringToInt(application.getInitParameter("maxUploadFileSize"));
	String encoding = "utf-8";
	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);
	
	int productNo = NumberUtil.stringToInt(mr.getParameter("productNo"));
	String productName = mr.getParameter("productName");
	String path = mr.getFilesystemName("product-thumbnail");
	
	ProductDao dao = new ProductDao();
	dao.insertProductImage(productName, path);
	
	int imageNo = dao.getImageNoByName(productName);
	dao.insertProductInfo(imageNo, productNo);
	
	response.sendRedirect("manager.jsp");
	
%>