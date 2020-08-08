<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
	<title>Home</title>
</head>

<body>
	<div class="container">
		<div class="jumbotron mt-3">
			<h1>쇼핑몰 방문을 환영합니다.</h1>
			<div>
				<c:choose>
					<c:when test="${empty LOGIN_USER }">
						<a href="/signup.do" class="btn btn-outline-primary">회원가입</a>
						<a href="/signin.do" class="btn btn-outline-primary">로그인</a>
					</c:when>
					<c:otherwise>
						<a href="/signout.do" class="btn btn-outline-primary">로그아웃</a>
					</c:otherwise>
				</c:choose>
			
				<a href="/json/home.do" class="btn btn-outline-primary">AJAX</a>
				<a href="/products.html" class="btn btn-outline-primary">REST</a>
				<a href="/board/list.do" class="btn btn-outline-primary">자유게시판</a>
				<a href="/product/list.do" class="btn btn-outline-primary">쇼핑하기</a>
			</div>
		</div>
	</div>
</body>

</html>