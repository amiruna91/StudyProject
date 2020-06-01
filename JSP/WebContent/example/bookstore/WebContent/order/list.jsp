<%@page import="com.bookstore.util.NumberUtil"%>
<%@page import="com.bookstore.dto.OrderDto"%>
<%@page import="com.bookstore.vo.User"%>
<%@page import="com.bookstore.dao.UserDao"%>
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
			<h1>주문내역 조회</h1>
		</div>
		<div class="body">
		<%
			String userId = request.getParameter("userid");
			
			UserDao userDao = new UserDao();
			User user = userDao.getUserById(userId);
			
			
			OrderDao orderDao = new OrderDao();
			List<OrderDto> orders = orderDao.getOrderByUserId(userId);
		%>
			<div>
				<h3>[<%=user.getName() %>]님의 주문내역입니다.</h3>
				<p><strong>누적포인트</strong> : <%=NumberUtil.numberWithComma(user.getPoint()) %><p>
			</div>
			<div>
				<table class="table">
					<thead>
						<tr>
							<th>주문번호</th>
							<th>제목</th>
							<th>가격</th>
							<th>수량</th>
							<th>결재금액</th>
							<th>주문날짜</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
					<%
						if (orders.isEmpty()) {
					%>
						<tr>
							<td colspan="6" class="text-center">주문내역이 존재하지 않습니다.</td>
						</tr>
					<%
						} else {							
							for (OrderDto order : orders) {
					%>
						<tr>
							<td><%=order.getOrderNo() %></td>
							<td><a href="../book/detail.jsp?bookno=<%=order.getBookNo()%>"><%=order.getBookTitle() %></a></td>
							<td><%=NumberUtil.numberWithComma(order.getOrderPrice()) %> 원</td>
							<td><%=order.getAmount() %> 개</td>
							<td><%=NumberUtil.numberWithComma(order.getAmount()*order.getOrderPrice()) %> 원</td>
							<td><%=order.getRegisteredDate() %></td>
						<%
							if (order.getWriteReveiw() == 1) {
						%>
							<td>[작성완료]</td>
						<%
							} else {
						%>						
							<td><a href="../review/form.jsp?userid=<%=userId %>&bookno=<%=order.getBookNo()%>"><strong>[리뷰작성]</strong></a></td>
						<%	
							}
						%>
						<%
							if (order.getIsLike() == 1) {
						%>
							<td>[추천완료]</td>
						<%
							} else {
						%>						
							<td><a href="../book/like.jsp?userid=<%=userId %>&bookno=<%=order.getBookNo()%>"><strong>[추천하기]</strong></a></td>
						<%	
							}
						%>
						</tr>
					<%
							}
						}
					%>
					</tbody>
				</table>
			</div>
			<div class="text-right">
				<a href="../user/list.jsp">사용자 목록으로</a>
			</div>
		</div>
		<%@ include file="../common/footer.jsp" %>
	</div>
</body>
</html>