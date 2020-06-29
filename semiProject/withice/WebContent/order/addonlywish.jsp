<%@page import="com.withice.dao.WishListDao"%>
<%@page import="com.withice.vo.WishList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp"%>
<%
	int productNo = Integer.parseInt(request.getParameter("productno"));
	int cateNo = Integer.parseInt(request.getParameter("cateno"));

	
	WishListDao wishListDao = new WishListDao();
	WishList findWishList = wishListDao.getWishListByProductNo(productNo);
	if(findWishList == null) {
		WishList wishList = new WishList();
		wishList.setProductNo(productNo);
		wishList.setUserId(loginedUserId);
		wishListDao.insertWishList(wishList);
		out.println("<script>alert('WishList에 상품이 추가되었습니다.');location.href='/withice/product/productDetail.jsp?cateno="+cateNo+"&productno="+productNo+"'; </script>");
		out.flush();
		
	} else {
		out.println("<script>alert('WishList에 동일상품이 존재합니다.');location.href='/withice/product/productDetail.jsp?cateno="+cateNo+"&productno="+productNo+"'; </script>");
		out.flush();
	}
%>