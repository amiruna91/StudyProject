<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-6">
			<h3>기본 테이블</h3>
			<table class="table">
				<thead>
					<tr>
						<th>이름</th>
						<th>전화번호</th>
						<th>이메일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>홍길동</td>
						<td>010-1112-1231</td>
						<td>hong@naver.com</td>
					</tr>
					<tr>
						<td>김유신</td>
						<td>010-2421-1212</td>
						<td>kim@gamil.com</td>
					</tr>
					<tr>
						<td>이순신</td>
						<td>010-1241-1241</td>
						<td>lee@daum.net</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-6">
			<h3>스트라이트 테이블</h3>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>이름</th>
						<th>전화번호</th>
						<th>이메일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>홍길동</td>
						<td>010-1112-1231</td>
						<td>hong@naver.com</td>
					</tr>
					<tr>
						<td>김유신</td>
						<td>010-2421-1212</td>
						<td>kim@gamil.com</td>
					</tr>
					<tr>
						<td>이순신</td>
						<td>010-1241-1241</td>
						<td>lee@daum.net</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-6">
			<h3>테두리가 있는 테이블</h3>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>이름</th>
						<th>전화번호</th>
						<th>이메일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>홍길동</td>
						<td>010-1112-1231</td>
						<td>hong@naver.com</td>
					</tr>
					<tr>
						<td>김유신</td>
						<td>010-2421-1212</td>
						<td>kim@gamil.com</td>
					</tr>
					<tr>
						<td>이순신</td>
						<td>010-1241-1241</td>
						<td>lee@daum.net</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-6">
			<h3>마우스에 반응하는 테이블</h3>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>이름</th>
						<th>전화번호</th>
						<th>이메일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>홍길동</td>
						<td>010-1112-1231</td>
						<td>hong@naver.com</td>
					</tr>
					<tr>
						<td>김유신</td>
						<td>010-2421-1212</td>
						<td>kim@gamil.com</td>
					</tr>
					<tr>
						<td>이순신</td>
						<td>010-1241-1241</td>
						<td>lee@daum.net</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-6">
			<h3>다크테마 테이블</h3>
			<table class="table table-dark">
				<thead>
					<tr>
						<th>이름</th>
						<th>전화번호</th>
						<th>이메일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>홍길동</td>
						<td>010-1112-1231</td>
						<td>hong@naver.com</td>
					</tr>
					<tr>
						<td>김유신</td>
						<td>010-2421-1212</td>
						<td>kim@gamil.com</td>
					</tr>
					<tr>
						<td>이순신</td>
						<td>010-1241-1241</td>
						<td>lee@daum.net</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-6">
			<h3>작은 사이즈 테이블</h3>
			<table class="table table-sm">
				<thead>
					<tr>
						<th>이름</th>
						<th>전화번호</th>
						<th>이메일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>홍길동</td>
						<td>010-1112-1231</td>
						<td>hong@naver.com</td>
					</tr>
					<tr>
						<td>김유신</td>
						<td>010-2421-1212</td>
						<td>kim@gamil.com</td>
					</tr>
					<tr>
						<td>이순신</td>
						<td>010-1241-1241</td>
						<td>lee@daum.net</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-6">
			<h3>테이블헤더가 색이 들어가 있는 테이블</h3>
			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th>이름</th>
						<th>전화번호</th>
						<th>이메일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>홍길동</td>
						<td>010-1112-1231</td>
						<td>hong@naver.com</td>
					</tr>
					<tr>
						<td>김유신</td>
						<td>010-2421-1212</td>
						<td>kim@gamil.com</td>
					</tr>
					<tr>
						<td>이순신</td>
						<td>010-1241-1241</td>
						<td>lee@daum.net</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-6">
			<h3>테이블헤더가 색이 들어가 있는 테이블</h3>
			<table class="table table-condensed">
				<thead class="thead-light">
					<tr>
						<th>이름</th>
						<th>전화번호</th>
						<th>이메일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>홍길동</td>
						<td>010-1112-1231</td>
						<td>hong@naver.com</td>
					</tr>
					<tr>
						<td>김유신</td>
						<td>010-2421-1212</td>
						<td>kim@gamil.com</td>
					</tr>
					<tr>
						<td>이순신</td>
						<td>010-1241-1241</td>
						<td>lee@daum.net</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<h3>문맥이 있는 테이블</h3>
			<table class="table table-condensed">
				<thead class="thead-light">
					<tr>
						<th>이름</th>
						<th>전화번호</th>
						<th>이메일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>홍길동</td>
						<td>010-1112-1231</td>
						<td>hong@naver.com</td>
					</tr>
					<tr class="table-primary">
						<td>홍길동</td>
						<td>010-1112-1231</td>
						<td>hong@naver.com</td>
					</tr>
					<tr class="table-success">
						<td>홍길동</td>
						<td>010-1112-1231</td>
						<td>hong@naver.com</td>
					</tr>
					<tr class="table-danger">
						<td>홍길동</td>
						<td>010-1112-1231</td>
						<td>hong@naver.com</td>
					</tr>
					<tr class="table-warning">
						<td>김유신</td>
						<td>010-2421-1212</td>
						<td>kim@gamil.com</td>
					</tr>
					<tr class="table-info">
						<td>이순신</td>
						<td>010-1241-1241</td>
						<td>lee@daum.net</td>
					</tr>
					<tr class="table-active">
						<td>이순신</td>
						<td>010-1241-1241</td>
						<td>lee@daum.net</td>
					</tr>
					<tr class="table-secondary">
						<td>홍길동</td>
						<td>010-1112-1231</td>
						<td>hong@naver.com</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>