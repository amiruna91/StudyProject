<%@page import="com.withice.util.NumberUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.withice.dao.CategoryDao"%>
<%@page import="com.withice.vo.Category"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Gson gson = new Gson();

	int mainCate = NumberUtil.stringToInt(request.getParameter("cateno"));
	
	CategoryDao categoryDao = new CategoryDao();
	List<Category> categories = categoryDao.getCategoryByNo(mainCate);
	
	out.write(gson.toJson(categories));
%>