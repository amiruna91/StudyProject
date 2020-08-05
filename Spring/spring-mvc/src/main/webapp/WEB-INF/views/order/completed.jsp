<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<title>쇼핑몰</title>
</head>
<body>
<div class="container mt-3 mb-5">
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-header">주문 완료</div>
				<div class="card-body">
					<h4 class="card-title">주문이 완료되었습니다.</h4>
				</div>
				<div class="card-footer text-right">
					<a href="/product/list.do" class="btn btn-primary">쇼핑 계속하기</a>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>