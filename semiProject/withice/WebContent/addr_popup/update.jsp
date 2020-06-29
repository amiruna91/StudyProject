<%@page import="com.withice.dao.AddressDao"%>
<%@page import="com.withice.vo.Address"%>
<%@page import="com.withice.util.StringUtil"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int no = NumberUtil.stringToInt(request.getParameter("no"));	
	String id = request.getParameter("userid");
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
	int postalCode = NumberUtil.stringToInt(request.getParameter("postcode"));
	String mainAddress = request.getParameter("mainaddress");
	String subAddress = request.getParameter("subaddress");
	String name = request.getParameter("name");
	String receiver = request.getParameter("receiver");
	
	AddressDao addressDao = new AddressDao();
	Address address = addressDao.getAddressByNo(no);
	
	address.setPostalCode(postalCode);
	address.setMain(mainAddress);
	address.setSub(subAddress);
	address.setTelphone(telphone);
	address.setPhone(phone);
	address.setUserid(id);
	address.setNo(no);
	address.setName(name);
	address.setReceiver(receiver);
	
	addressDao.updateAddressByNo(address);
	
	response.sendRedirect("list.jsp");
%>