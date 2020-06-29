<%@page import="com.withice.vo.Address"%>
<%@page import="java.util.List"%>
<%@page import="com.withice.dao.AddressDao"%>
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
<style type="text/css">
	#button:hover {
		background-color: white;
		color: #585858;
	}
</style>
</head>
<body>
<div class="container">
<div class="row" style="background-color: #585858; color: white;">
	<div class="col-12 my auto" style="padding: 10px 10px;">
		<strong>Address Book</strong>
	</div>
</div>
<%
	String userId = loginedUserId;
	
	AddressDao addressDao = new AddressDao();
	List<Address> addresses = addressDao.getAddressesById(userId);
%>
<div class="row" style="padding: 20px 20px;">
	<div class="col-12">
		<div class="table">
			<table class="table table-bordered">
				<thead>
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
<form action="">
	<div class="row text-center" style="padding: 20px 20px;">
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
						<th>배송지관리</th>
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
							<td>
								(<%=address.getPostalCode()%>) <%=address.getMain() %> <%=address.getSub() %>
								<input type="hidden" name="address-<%=address.getNo() %>" value="<%=address.getReceiver() %>" />
								<input type="hidden" name="address-<%=address.getNo() %>" value="<%=address.getPostalCode() %>" />
								<input type="hidden" name="address-<%=address.getNo() %>" value="<%=address.getMain() %>" />
								<input type="hidden" name="address-<%=address.getNo() %>" value="<%=address.getSub() %>" />
								<input type="hidden" name="address-<%=address.getNo() %>" value="<%=address.getPhone() %>" />
								</td>
							<td>
								<button class="btn btn-dark" onclick="setAddress(<%=address.getNo()%>)">적용</button>
								<a class="btn btn-outline-secondary" href="modify.jsp?addressno=<%=address.getNo()%>">수정</a>
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
	</form>
	<div class="text-center">
 			<a href="register.jsp" class="btn btn-dark" id="button">등록</a>
 	</div>
</div>
<script type="text/javascript">
	function setAddress(addressNo) {
		
		var receiver = document.getElementsByName("address-"+addressNo)[0].value;
		var postalCode = document.getElementsByName("address-"+addressNo)[1].value;
		var mainAdd = document.getElementsByName("address-"+addressNo)[2].value;
		var subAdd = document.getElementsByName("address-"+addressNo)[3].value;
		var phoneNum = document.getElementsByName("address-"+addressNo)[4].value;
		
		opener.setAddressValue(receiver,postalCode,mainAdd,subAdd,phoneNum);
		window.close();
	}
	
	function deleteAlert() {
		alert("고정된 주소는 삭제할 수 없습니다.");
	}
</script>
</body>
</html>