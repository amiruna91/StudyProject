<%@page import="com.withice.vo.Mileage"%>
<%@page import="com.withice.dao.MileageDao"%>
<%@page import="com.withice.vo.Cart"%>
<%@page import="com.withice.dao.CartDao"%>
<%@page import="com.withice.vo.User"%>
<%@page import="com.withice.dao.UserDao"%>
<%@page import="com.withice.vo.OrderDetail"%>
<%@page import="com.withice.vo.OrderAddress"%>
<%@page import="com.withice.dao.OrderDao"%>
<%@page import="com.withice.vo.Order"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("utf-8");
	// 주문하는 상품명과 수량과 가격
    String [] productNo = request.getParameterValues("product_no");
    String [] productAmount = request.getParameterValues("product_amount");
	String [] productPrice = request.getParameterValues("product_price");
	// 받으시는 분
    String userName = request.getParameter("username");
	int postCode = NumberUtil.stringToInt(request.getParameter("postcode"));
	String mainAddress = request.getParameter("mainadd");
	String subAddress = request.getParameter("subadd");
	
	// 일반전화
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	
	String resultTel = tel1+"-"+tel2+"-"+tel3;
	// 휴대전화
	String phone1 = request.getParameter("cell1");
	String phone2 = request.getParameter("cell2");
	String phone3 = request.getParameter("cell3");
	
	String resultPhone = phone1+"-"+phone2+"-"+ phone3;
	// 배송메시지
	String message = request.getParameter("message");
	
	// 마일리지
	int mileage = NumberUtil.stringToInt(request.getParameter("mileage"));
	
	// 총액
	int totalPrice = NumberUtil.stringToInt(request.getParameter("totalprice"));
	int resultPrice = totalPrice - mileage;
	// 주문테이블 INSERT
	Order order = new Order();
	order.setPrice(resultPrice);
	order.setUserId(loginedUserId);
	
	OrderDao orderDao = new OrderDao();
	orderDao.insertOrder(order);
	
	Order findOrderNo = orderDao.getOrderNoByUserIdRownum(loginedUserId);
	// 배송지테이블 INSERT
	OrderAddress orderAddress = new OrderAddress();
	orderAddress.setContent(message);
	orderAddress.setMainAddress(mainAddress);
	orderAddress.setSubAddress(subAddress);
	orderAddress.setPostalCode(postCode);
	orderAddress.setPhone(resultPhone);
	orderAddress.setReceiver(userName);
	orderAddress.setTelephone(resultTel);
	orderAddress.setOrderNo(findOrderNo.getNo());
	orderDao.insertOrderAddress(orderAddress);
	
	// 디테일주문테이블 INSERT
	
	for(int i =0; i<productNo.length; i++) {
		OrderDetail orderDetail = new OrderDetail();
		orderDetail.setAmount(NumberUtil.stringToInt(productAmount[i]));
		orderDetail.setOrderNo(findOrderNo.getNo());
		orderDetail.setProductNo(NumberUtil.stringToInt(productNo[i]));
		orderDetail.setPrice(NumberUtil.stringToInt(productPrice[i]));
		
		orderDao.insertOrderDetail(orderDetail);
	}
	// 유저 테이블 포인트 변경 , 마일리지 인포 세팅
	UserDao userDao = new UserDao();
	MileageDao mileageDao = new MileageDao();
	Mileage mileages = new Mileage();
	mileages.setContent("상품주문");
	mileages.setGetMileage(100*productNo.length);
	mileages.setUserId(loginedUserId);
	mileages.setMileageOrder(findOrderNo.getNo());
	
	mileageDao.registerMileage(mileages);
	
	User user = userDao.getUserById(loginedUserId);
	int totalMileage = user.getTotalMileages()+(100*productNo.length);
	int usableMileage = user.getUsableMileage()-mileage+(100*productNo.length);
	int usedMileage = user.getUsedMileage()+mileage;
	user.setTotalMileages(totalMileage);
	user.setUsableMileage(usableMileage);
	user.setUsedMileage(usedMileage);
	userDao.updateUserByMileage(user);
	
	// 카트 테이블 데이터 삭제
	CartDao cartDao = new CartDao();
	
	for(int i=0; i<productNo.length; i++){
		int deleteProductNo = NumberUtil.stringToInt(productNo[i]);
		Cart cart = cartDao.getCartByProductNo(deleteProductNo);	
		if(cart != null){
			cartDao.deleteCart(deleteProductNo);
		}
	}
	response.sendRedirect("complete.jsp");
%>