<%@page import="java.io.PrintWriter"%>
<%@page import="com.withice.dao.CartDao"%>
<%@page import="com.withice.vo.Cart"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp"%>
<%
	int productNo = Integer.parseInt(request.getParameter("product_no"));
	int productStock = Integer.parseInt(request.getParameter("product_amount"));
	
	CartDao cartDao = new CartDao();

	Cart cart = cartDao.getCartByProductNo(productNo);
	
	if(cart == null){
		cart = new Cart();
		cart.setProductAmount(productStock);
		cart.setProductNo(productNo);
		cart.setUserId(loginedUserId);
	
		cartDao.insertCart(cart);
		response.sendRedirect("basket.jsp");
	} else{
		cartDao.updateCart(productStock, cart.getUserId(), cart.getProductNo());
		out.println("<script>alert('동일 상품이 이미 있습니다. 수량이 추가됩니다.'); location.href='basket.jsp?';</script>");
		out.flush();		
	}
	
%>