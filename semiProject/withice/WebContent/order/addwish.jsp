<%@page import="com.withice.vo.Cart"%>
<%@page import="com.withice.vo.WishList"%>
<%@page import="com.withice.dao.WishListDao"%>
<%@page import="com.withice.dao.CartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp"%>
<%
	int productNo = Integer.parseInt(request.getParameter("productno"));
	int cateNo = Integer.parseInt(request.getParameter("cateno"));



	//productNo로 프로덕트 찾아서 장바구니 테이블에 삭제
	//productNo로 위시리스트 찾아서 없을때 인서트
	
	CartDao cartDao = new CartDao();
	Cart cart = cartDao.getCartByProductNo(productNo);
	WishListDao wishListDao = new WishListDao();
	WishList findWishList = wishListDao.getWishListByProductNo(productNo);
	
	if(findWishList == null) {
		WishList wishList = new WishList();
		wishList.setProductNo(productNo);
		wishList.setUserId(loginedUserId);
		wishListDao.insertWishList(wishList);
		cartDao.deleteCart(productNo);
		out.println("<script>alert('WishList에 상품이 추가되었습니다.');location.href='/withice/order/basket.jsp'; </script>");
		out.flush();
		
	} else {
		out.println("<script>alert('WishList에 동일상품이 존재합니다.');location.href='/withice/order/basket.jsp'; </script>");
		out.flush();
	}
	
%>