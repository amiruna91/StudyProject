<%@page import="com.google.gson.Gson"%>
<%@page import="com.sample.hr.vo.Employee"%>
<%@page import="com.sample.hr.util.NumberUtil"%>
<%@page import="com.sample.hr.dao.EmployeeDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	int employeeId = NumberUtil.stringToInt(request.getParameter("id"));

	EmployeeDao dao = new EmployeeDao();
	Employee emp = dao.getEmployeeById(employeeId);
	
	Gson gson = new Gson();
	String jsonText = gson.toJson(emp);
	
	out.write(jsonText);
%>