<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <ul id="navibar">
	<li class="<%="home".equals(position) ? "active" : ""%>"><a href="/bookstore/home.jsp">홈</a></li>
	<li class="<%="book".equals(position) ? "active" : ""%>"><a href="/bookstore/book/list.jsp">도서</a></li>
	<li class="<%="user".equals(position) ? "active" : ""%>"><a href="">사용자</a></li>
	<li class="<%="order".equals(position) ? "active" : ""%>"><a href="">주문</a></li>
</ul>