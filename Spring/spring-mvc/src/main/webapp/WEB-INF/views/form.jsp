<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
					<form:form action="signup.do" id="user-form" method="POST" modelAttribute="userForm">
						<div class="card-header">회원가입 폼</div>
						<div class="card-body">
							<div class="form-group">
								<label>로그인</label>
								<form:input type="text" class="form-control" path="id" id="user-id" />
								<form:errors path="id" cssClass="text-danger"></form:errors>
							</div>
							<div class="form-group">
								<label>이름</label>
								<form:input type="text" class="form-control" path="name" id="user-name" />
								<form:errors path="name" cssClass="text-danger"></form:errors>
							</div>
							<div class="form-group">
								<label>비밀번호</label>
								<form:input type="password" class="form-control" path="password" id="user-password" />
								<form:errors path="password" cssClass="text-danger"></form:errors>
							</div>
							<div class="form-group">
								<label>전화번호</label>
								<form:input type="tel" class="form-control" path="tel" id="user-tel" />
								<form:errors path="tel" cssClass="text-danger"></form:errors>
							</div>
							<div class="form-group">
								<label>이메일</label>
								<form:input type="email" class="form-control" path="email" id="user-email" />
								<form:errors path="email" cssClass="text-danger"></form:errors>
							</div>
							<div class="form-group">
								<label>나이</label>
								<form:input type="number" class="form-control" path="age" id="user-age" />
								<form:errors path="age" cssClass="text-danger"></form:errors>
							</div>
							<div class="form-group">
								<label>생년월일</label>
								<form:input type="date" class="form-control" path="birth" id="user-birth" />
								<form:errors path="birth" cssClass="text-danger"></form:errors>
							</div>
						</div>
						<div class="card-footer">
							<a href="home.do">취소</a>
							<button type="submit">가입</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>

</html>