<%@page import="com.withice.dao.AddressDao"%>
<%@page import="com.withice.vo.Address"%>
<%@page import="com.withice.util.StringUtil"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@page import="com.withice.vo.User"%>
<%@page import="com.withice.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("userid");
	String password = request.getParameter("pwd");
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
	String snsCheck = StringUtil.nullToValue(request.getParameter("sms"), "N");
	String email = request.getParameter("email");
	String birthyear = request.getParameter("birthyear");
	String birthmonth = request.getParameter("birthmonth");
	String birthday = request.getParameter("birthday");
	String birth = birthyear + "-" + birthmonth + "-" + birthday;
	String location = request.getParameter("location");
	String name = request.getParameter("name");
	
	int postalCode = NumberUtil.stringToInt(request.getParameter("postcode"));
	String mainAddress = request.getParameter("mainaddress");
	String subAddress = request.getParameter("subaddress");
	
	UserDao userDao = new UserDao();
	User user = userDao.getUserById(id);
	
	user.setPassword(password);
	user.setTelephone(telphone);
	user.setPhone(phone);
	user.setSnsCheck(snsCheck);
	user.setEmail(email);
	user.setBirth(birth);
	user.setLocation(location);
	user.setId(id);
	
	userDao.updateUser(user);
	
	
	AddressDao addressDao = new AddressDao();
	Address address = addressDao.getAddressHomeByUserId(id);
	
	address.setPostalCode(postalCode);
	address.setMain(mainAddress);
	address.setSub(subAddress);
	address.setTelphone(telphone);
	address.setPhone(phone);
	address.setUserid(id);
	address.setReceiver(name);
	
	addressDao.updateAddressById(address);
	
	response.sendRedirect("modifycomplete.jsp");
%>