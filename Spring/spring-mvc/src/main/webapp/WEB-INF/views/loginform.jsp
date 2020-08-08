<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<form:form method="post" action="signin.do" modelAttribute="loginForm">
						<div class="card-header">로그인폼</div>
						<div class="card-body">
							<c:choose>
								<c:when test="${param.error eq 'fail' }">
									<div class="alert alert-danger">
										<strong>로그인 실패</strong> 아이디 혹은 비밀번호가 올바르지 않습니다.
									</div>							
								</c:when>
								<c:when test="${param.error eq 'deny' }">
									<div class="alert alert-danger">
										<strong>인증 실패</strong> 해당 서비스는 로그인 후 사용가능합니다.
									</div>
								</c:when>
								<c:when test="${param.error eq 'role' }">
									<div class="alert alert-danger">
										<strong>접근권한 부족</strong> 해당 서비스에 대한 접근권한을 가지고 있지 않습니다.
									</div>
								</c:when>
							</c:choose>
							<div class="form-group">
								<label>아이디</label>
								<form:input path="userId" id="user-id" class="form-control" />
								<form:errors path="userId" cssClass="text-danger"></form:errors>
							</div>
							<div class="form-group">
								<label>비밀번호</label>
								<form:password path="userPwd" id="user-pwd" class="form-control" />
								<form:errors path="userPwd" cssClass="text-danger"></form:errors>
							</div>
						</div>
						<div class="card-footer">
							<a href="/home.do" class="btn btn-secondary">취소</a>
							<button type="submit" class="btn btn-primary">로그인</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>

</html>