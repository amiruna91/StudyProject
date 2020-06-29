<%@page import="com.withice.dao.AddressDao"%>
<%@page import="com.withice.vo.Address"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");

	String userId = request.getParameter("userid");
	String name = request.getParameter("name");
	String receiver = request.getParameter("receiver");
	int postalCode = NumberUtil.stringToInt(request.getParameter("postcode"));
	String mainAddress = request.getParameter("mainaddress");
	String subAddress = request.getParameter("subaddress");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String telphone = "";
	if(!tel1.equals("no")) {
		telphone = tel1 + "-" + tel2 + "-" + tel3;
	}
	String phone1 = request.getParameter("cell1");
	String phone2 = request.getParameter("cell2");
	String phone3 = request.getParameter("cell3");
	String phone = phone1 + "-" + phone2 + "-" + phone3;
	
	Address address = new Address();
	address.setName(name);
	address.setPostalCode(postalCode);
	address.setMain(mainAddress);
	address.setSub(subAddress);
	address.setUserid(userId);
	address.setTelphone(telphone);
	address.setPhone(phone);
	address.setReceiver(receiver);
	address.setHome(0);
	
	AddressDao addressDao = new AddressDao();
	addressDao.registerAddress(address);
	
	response.sendRedirect("list.jsp");
%>