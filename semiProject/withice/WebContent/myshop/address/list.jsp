<%@page import="com.withice.vo.Address"%>
<%@page import="java.util.List"%>
<%@page import="com.withice.dao.AddressDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>address</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/withice/css/naviAndFooter.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
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
	
	#button:hover {
			background-color: white;
			color: #585858;
	}
</style>
</head>
<body>
	<%@ include file="../../common/navbar.jsp"%>
	<%
		String userId = loginedUserId;
	
		AddressDao addressDao = new AddressDao();
		List<Address> addresses = addressDao.getAddressesById(userId);
	%>
	<div class="container">
	<div class="row">
		<div class="col-12">
			<ul class="breadcrumb float-right">
				<li class="breadcrumb-item"><a href="../../home.jsp">Home</a></li>
				<li class="breadcrumb-item"><a href="../index.jsp">My Page</a></li>
				<li class="breadcrumb-item"><a style="color: black;">Address Book</a></li>
			</ul>
		</div>
	</div>
	<div class="row" style="padding: 10px">
		<div class="col-12">
			<h4>ADDRESS BOOK</h4>
		</div>
	</div>
		<div class="row text-center">
			<div class="col-12">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>주소록 고정</th>
							<th>배송지명</th>
							<th>수령인</th>
							<th>일반전화</th>
							<th>휴대전화</th>
							<th>주소</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<tbody>
			<%
				if (addresses.isEmpty()) {
			%>
				<tr>
					<td colspan="8">등록된 주소가 없습니다.</td>
				</tr>
			<%
				}
			%>
			<% 
				for (Address address : addresses) {
			%>
						<tr>
			<%
				if (address.getHome() == 1) {
					if (addresses.size() <= 1) {
			%>
							<td>
								<a class="btn btn-outline-secondary" href="#" id="addressdisabled" onclick="checkAddress()">해제</a>
							</td>
			<%
					} else {
			%>
							<td>
								<a class="btn btn-secondary" href="#">해제</a>
							</td>
			<%
					}
				} else {
			%>
							<td>
								<a class="btn btn-outline-secondary" href="addresshomecheck.jsp?addressno=<%=address.getNo() %>">고정</a>
							</td>
			<%
				}
			%>
							<td>
			<%
				if (address.getName() == null) {
			%>
								미정	
			<%
				} else {
			%>
								<%=address.getName() %>
			<%
				}
			%>
							</td>
							<td><%=address.getReceiver() %></td>
							<td>
			<%
				if (address.getTelphone() == null) {
			%>
								없음
			<%		
				} else {
			%>
								<%=address.getTelphone() %>
			<%						
				}
			%>
							</td>
							<td><%=address.getPhone() %></td>
							<td>(<%=address.getPostalCode()%>) <%=address.getMain() %> <%=address.getSub() %></td>
							<td><a class="btn btn-outline-secondary" href="modify.jsp?addressno=<%=address.getNo() %>">수정</a></td>
			<%
				if (address.getHome() == 0) {
			%>
							<td><a href="delete.jsp?addressno=<%=address.getNo() %>" class="btn btn-outline-danger">삭제</a></td>
			<%
				} else {
			%>
							<td><a href="#" class="btn btn-outline-danger" id="disabled" onclick="deleteAlert()">삭제</a></td>
			<%
				}
			%>
						</tr>
			<%
				}
			%>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row text-right">
			<div class="col-12">
				<a class="btn btn-dark" id="button" href="register.jsp">등록</a>
			</div>
		</div>
		<div class="row" style="padding: 20px 20px;">
			<div class="col-12">
				<table class="table table-bordered">
					<thead style="background-color: #E2E2E2">
						<tr>
							<th>배송주소록 유의사항</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1. 배송 주소록 고정 선택을 선택하시면 선택된 주소록은 기본 배송지로 저장됩니다.</td>
						</tr>
						<tr>
							<td>2. 주소록 고정 선택을 선택하시면 선택된 주소록은 삭제 대상에서 제외됩니다.</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="../../common/footer.jsp"%>
</body>
<script type="text/javascript">
	function deleteAlert() {
		alert("고정된 주소는 삭제할 수 없습니다.");
	}
	
	function checkAddress() {
		alert("고정된 주소의 개수가 1개 이하일 때는 해제할 수 없습니다.");
	}
</script>
</html>