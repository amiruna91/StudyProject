<%@page import="com.bookstore.util.StringUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.bookstore.util.NumberUtil"%>
<%@page import="com.bookstore.dto.OrderDto"%>
<%@page import="java.util.List"%>
<%@page import="com.bookstore.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookstore</title>
<link rel="stylesheet" type="text/css" href="../css/bookstore.css">
<style type="text/css">
	label {
		font-weight: bold;
	}
	select {
		display: inline-block;
		width: 200px;
		height: 37px;
	}
	button {
		height: 37px;
	}
</style>
</head>
<body>
<div class="wrapper">
	<div class="navi">
		<%
			String position = "order";
		%>
		<%@ include file="../common/navibar.jsp" %>
	</div>
	<div class="header">
		<h1>주문내역</h1>
	</div>
	<div class="body">
		<%
			// 로그인 여부 체크
			
			// 로그인되지 않은 사용자는 로그인폼을 재요청하게 한다.
			if (!"Yes".equals(isLogined)) {
				response.sendRedirect("/bookstore/user/loginform.jsp?error=deny");
				return;
			}
			
			// 로그인된 회원인 경우.
			// 회원의 정보를 추가적인 입력없이 세션에서 회원정보를 가져온다.
			String userName = (String) session.getAttribute("이름");
			String userId = (String) session.getAttribute("아이디");
			
			// 세션에서 조회한 회원정보로 그 회원의 주문내역을 조회한다.
			OrderDao orderDao = new OrderDao();
			List<OrderDto> orders = orderDao.getOrderByUserId(userId);
		%>
		<div>
			<p><strong><%=userName %>님</strong> 주문내역을 확인하세요.</p>
			<table class="table">
				<colgroup>
					<col width="10%">
					<col width="10%">
					<col width="*">
					<col width="12%">
					<col width="10%">
					<col width="12%">
					<col width="13%">
				</colgroup>
				<thead>
					<tr>
						<th>주문번호</th>
						<th>구매자명</th>
						<th>제목</th>
						<th>구매가격</th>
						<th>구매수량</th>
						<th>결재금액</th>
						<th>주문날짜</th>
					</tr>
				</thead>
				<tbody>
				<%
					if (orders.isEmpty()) {
				%>
						<tr>
							<td>주문내역이 없습니다.</td>
						</tr>
				<%
					} else {
						for (OrderDto order : orders) {
				%>
						<tr>
							<td><%=order.getOrderNo() %></td>
							<td><%=userName %></td>
							<td><%=order.getBookTitle() %></td>
							<td><%=NumberUtil.numberWithComma(order.getOrderPrice()) %></td>
							<td><%=order.getAmount() %></td>
							<td><%=NumberUtil.numberWithComma(order.getOrderPrice()*order.getAmount()) %></td>
							<td><%=order.getRegisteredDate() %></td>
						</tr>
				<%
						}
					}
				%>
				</tbody>
			</table>
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
</div>
</body>
</html>