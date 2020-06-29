<%@page import="com.withice.util.NumberUtil"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.withice.vo.Cart"%>
<%@page import="com.withice.dao.CartDao"%>
<%@page import="com.withice.dao.WishListDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp"%>
<%
	int productNo = Integer.parseInt(request.getParameter("product_no"));
	
	// productNo로 프로적트 찾아서 위시리스트 테이블에 삭제
	// productNo로 장바구니 테이블에 인서트
	
	WishListDao wishListDao = new WishListDao();
	wishListDao.deleteWishList(productNo);
	
	CartDao cartDao = new CartDao();
	
	Cart cart = cartDao.getCartByProductNo(productNo);

	if(cart == null){
		cart = new Cart();
		cart.setProductAmount(1);
		cart.setProductNo(productNo);
		cart.setUserId(loginedUserId);		
		cartDao.insertCart(cart);
		
		response.sendRedirect("/withice/order/basket.jsp");
	} else{
		cartDao.updateCart(1,cart.getUserId(), cart.getProductNo());
		out.println("<script>alert('동일 상품이 이미 있습니다. 수량이 추가됩니다.'); location.href='basket.jsp';</script>");
		out.flush();		
	}
%>