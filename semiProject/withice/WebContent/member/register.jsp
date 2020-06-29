<%@page import="com.withice.dao.MileageDao"%>
<%@page import="com.withice.vo.Mileage"%>
<%@page import="com.withice.util.StringUtil"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@page import="com.withice.vo.Address"%>
<%@page import="com.withice.dao.AddressDao"%>
<%@page import="com.withice.dao.UserDao"%>
<%@page import="com.withice.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("userid");
	String password = request.getParameter("pwd");
	String name = request.getParameter("username");
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
	String gender = request.getParameter("gender");
	String birthyear = request.getParameter("birthyear");
	String birthmonth = request.getParameter("birthmonth");
	String birthday = request.getParameter("birthday");
	String birth = birthyear + "-" + birthmonth + "-" + birthday;
	String location = request.getParameter("location");
	
	int postalCode = NumberUtil.stringToInt(request.getParameter("postcode"));
	String mainAddress = request.getParameter("mainaddress");
	String subAddress = request.getParameter("subaddress");
	
	UserDao userDao = new UserDao();
	User checkUser = userDao.getUserById(id);
	
	if (checkUser != null) {
		response.sendRedirect("join.jsp");
		return;
	}

	User user = new User();
	user.setId(id);
	user.setPassword(password);
	user.setName(name);
	user.setTelephone(telphone);
	user.setPhone(phone);
	user.setSnsCheck(snsCheck);
	user.setEmail(email);
	user.setGender(gender);
	user.setBirth(birth);
	user.setLocation(location);
	
	Address address = new Address();
	address.setPostalCode(postalCode);
	address.setMain(mainAddress);
	address.setSub(subAddress);
	address.setUserid(id);
	address.setTelphone(telphone);
	address.setPhone(phone);
	address.setReceiver(name);
	address.setHome(1);
	
	Mileage mileage = new Mileage();
	mileage.setContent("신규회원가입");
	mileage.setUserId(id);
	mileage.setGetMileage(1000);
	
	userDao.registerUser(user);
	
	AddressDao addressDao = new AddressDao();
	addressDao.registerAddress(address);
	
	MileageDao mileageDao = new MileageDao();
	mileageDao.registerMileage(mileage);
	
	response.sendRedirect("welcome.jsp");
%>
</body>
</html>