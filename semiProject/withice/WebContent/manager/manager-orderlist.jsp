<%@page import="com.withice.vo.Order"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@page import="com.withice.dto.OrderWithUserName"%>
<%@page import="java.util.List"%>
<%@page import="com.withice.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int orderNo = NumberUtil.stringToInt(request.getParameter("orderno"));

	OrderDao orderDao = new OrderDao();

	if (orderNo != 0) {
		Order order = orderDao.getOrderByNo(orderNo);
		order.setStatus("Y");
		
		orderDao.updateOrder(order);
		
	}
	
	List<OrderWithUserName> orders = orderDao.getOrderStatusWithName(); 
	
	Gson gson = new Gson();
	out.write(gson.toJson(orders));
%>