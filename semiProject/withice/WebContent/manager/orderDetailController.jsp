<%@page import="com.google.gson.Gson"%>
<%@page import="com.withice.dto.OrderDetailWithProductName"%>
<%@page import="java.util.List"%>
<%@page import="com.withice.dto.OrderDtoWithDetails"%>
<%@page import="com.withice.dao.OrderDao"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int orderNo = NumberUtil.stringToInt(request.getParameter("orderno"));

	OrderDao dao = new OrderDao();
	
	OrderDtoWithDetails order = dao.getOrderDtoWithDetails(orderNo);
	List<OrderDetailWithProductName> details = dao.getOrderDetailsByOrderNo(orderNo);
	
	order.setDetails(details);
	
	Gson gson = new Gson();
	out.write(gson.toJson(order));
%>