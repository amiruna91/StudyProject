<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.withice.vo.User"%>
<%@page import="com.withice.dao.UserDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	String userId = request.getParameter("userid");

	UserDao userDao = new UserDao();
	User user = userDao.getUserById(userId);
	
	Map<String, Boolean> result = new HashMap<String, Boolean>();
	result.put("exist", user == null ? false : true);
	
	Gson gson = new Gson();
	String jsonText = gson.toJson(result);
		
	out.write(jsonText);
%>
