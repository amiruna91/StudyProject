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
		<h1>전체 주문내역</h1>
	</div>
	<div class="body">
	<%
		OrderDao orderDao = new OrderDao();
		String genre = StringUtil.nullToBlank(request.getParameter("genre"));
		List<OrderDto> orders = new ArrayList<OrderDto>();

		if (genre.isEmpty()) {
			orders = orderDao.getAllOrders();
		} else {
			orders = orderDao.getOrdersByGenre(genre);
		}
	%>
		<div>
			<div>
				<form method="get" action="all.jsp">
					<label>구분</label>
					<select name="genre" >
						<option value="" 				<%="".equals(genre) ? "selected" : "" %>>전체</option>
						<option value="소설"			<%="소설".equals(genre) ? "selected" : "" %>> 소설</option>
						<option value="인문" 			<%="인문".equals(genre) ? "selected" : "" %>> 인문</option>
						<option value="경제" 			<%="경제".equals(genre) ? "selected" : "" %>> 경제</option>
						<option value="자연과학/공학" 	<%="자연과학/공학".equals(genre) ? "selected" : "" %>> 자연과학/공학</option>
						<option value="IT" 				<%="IT".equals(genre) ? "selected" : "" %>> IT</option>
						<option value="외국어" 			<%="외국어".equals(genre) ? "selected" : "" %>> 외국어</option>
						<option value="교재/수험서" 	<%="교재/수험서".equals(genre) ? "selected" : "" %>> 교재/수험서</option>
					</select>
					<button type="submit">검색</button>
				</form>
			</div>
			<h3>전체 주문내역을 확인하세요.</h3>
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
					for (OrderDto order : orders) {
				%>
					<tr>
						<td><%=order.getOrderNo() %></td>
						<td><%=order.getUserName() %></td>
						<td><%=order.getBookTitle() %></td>
						<td><%=NumberUtil.numberWithComma(order.getOrderPrice()) %></td>
						<td><%=order.getAmount() %></td>
						<td><%=NumberUtil.numberWithComma(order.getOrderPrice()*order.getAmount()) %></td>
						<td><%=order.getRegisteredDate() %></td>
					</tr>
				<%
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