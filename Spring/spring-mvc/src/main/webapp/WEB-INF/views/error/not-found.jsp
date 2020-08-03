<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
	<title>자유 게시판 :: 에러페이지</title>
</head>

<body>
	<div class="container mt-3 mb-5">
		<div class="jumbotron">
			<h1>서버 에러</h1>
			<p>요청 처리 중 서버에러가 발생하였습니다.</p>
			<p><a href="/home.do" class="btn btn-primary">홈</a>으로 되돌아가기 버튼을 클릭하세요</p>
		</div>
	</div>
</body>

</html>