<%@page import="java.util.List"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@page import="com.withice.dao.AddressDao"%>
<%@page import="com.withice.vo.Address"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int no = NumberUtil.stringToInt(request.getParameter("addressno"));
	
	AddressDao addressDao = new AddressDao();
	Address address = addressDao.getAddressByNo(no);
	

	if (address.getHome() == 1) {
	
		address.setHome(0);
		address.setNo(no);
		
		addressDao.updateAddressByNo(address);
	} else {
		List<Address> addresses = addressDao.getAddressesById(loginedUserId);
		
		for (Address addresscheck : addresses) {
			addresscheck.setHome(0);
			addressDao.updateAddressHome(addresscheck);
		}
			
		address.setHome(1);
		address.setNo(no);
		
		addressDao.updateAddressByNo(address);
	}
	
	response.sendRedirect("list.jsp");
%>