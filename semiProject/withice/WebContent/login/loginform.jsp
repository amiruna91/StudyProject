<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="/withice/css/naviAndFooter.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <script src="/withice/js/navi.js"></script>
  <style type="text/css">
  	.breadcrumb {
  		background-color: white;
  		padding: 5px;
  		font-size: 13px;
  	}
  	
  	.breadcrumb a {
  		color: gray;
  	}
  	
  	
  	.breadcrumb-item+.breadcrumb-item::before {
    display: inline-block;
    padding-right: .5rem;
    color: #6c757d;
    content: ">";
	}
	
	button[type=submit] {
		margin-bottom: 15px;
	}
  </style>
</head>
<body>
<%@ include file="../common/navbar.jsp"%>
<div class="container">
	<!-- 현재위치 -->
	<div class="row">
		<div class="col-12">
			<ul class="breadcrumb float-right">
				<li class="breadcrumb-item"><a href="../home.jsp">Home</a></li>
				<li class="breadcrumb-item"><a href="#" style="color: black;">Login</a></li>
			</ul>
		</div>
	</div>
	<!-- 현재위치 -->
	<!-- 화면의 현재위치를 나타내는 부분 끝 -->
	<!-- 로그인 정보 입력화면을 포함하고 있는 row 시작 -->
	<div class="row justify-content-md-center" style="margin-top: 70px;">
	<%
		String error = request.getParameter("error");
	%>
		<div class="col-5">
			<!-- 로그인 오류시 표시할 오류내용 예시 시작 -->
		<%
			if ("false".equals(error)) {
		%>
			<div class="alert alert-danger">
  				<strong>오류!</strong> 아이디 혹은 비밀번호가 일치하지 않습니다.
			</div>
		<%
			}
		%>
		<%
			if ("deny".equals(error)) {
		%>
			<div class="alert alert-danger">
  				<strong>오류!</strong> 해당 페이지는 로그인 후 사용가능합니다.
			</div>
		<%
			}
		%>
			<!-- 로그인 오류시 표시할 오류내용 예시 끝 -->
			
			<!-- 로그인 입력폼을 포함하고 있는 card 시작 -->
			<div class="card mt-5" style="margin-bottom: 100px;">
				<div class="card-header text-center" style="font-weight: bold;">MEMBER LOGIN</div>
				<div class="card-body">
					<!-- 로그인 입력폼 시작  -->
					<form method="post" action="login.jsp">
						<div class="form-group">
							<label for="user-id">ID</label>
							<input type="text" class="form-control" name="userid" id="user-id"/>
						</div>
						<div class="form-group">
							<label for="user-pwd">PASSWORD</label>
							<input type="password" class="form-control" name="userpwd" id="user-pwd"/>
						</div>
						<div class="text-right">
							<button type="submit" class="btn btn-primary btn-block">로그인</button>
						</div>
					</form>
					<div>
						<a class="btn btn-secondary btn-block" href="../member/join.jsp">회원가입</a>
					</div>
					<!-- 로그인 입력폼 끝  -->
				</div>
			</div>
			<!-- 로그인 입력폼을 포함하고 있는 card 끝 -->
		</div>
	</div>
	<!-- 로그인 정보 입력화면을 포함하고 있는 row 끝 -->
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>