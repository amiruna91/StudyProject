<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
	<title>내 정보 보기</title>
</head>

<body>
	<div class="container mt-3 mb-5">
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-header">내 정보 보기</div>
					<div class="card-body">
						<table class="table table-bordered">
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
							<tbody>
								<tr>
									<th>아이디</th>
									<td>${LOGIN_USER.id}</td>
								</tr>
								<tr>
									<th>이름</th>
									<td>${LOGIN_USER.name}</td>
								</tr>
								<tr>
									<th>이메일</th>
									<td>${LOGIN_USER.email}</td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td>{LOGIN_USER.tel}</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="card-footer text-right">
						<a href="/home.do" class="btn btn-primary">홈</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>