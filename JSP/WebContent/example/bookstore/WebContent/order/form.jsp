<%@page import="com.bookstore.vo.User"%>
<%@page import="java.util.List"%>
<%@page import="com.bookstore.dao.UserDao"%>
<%@page import="com.bookstore.util.NumberUtil"%>
<%@page import="com.bookstore.dto.BookDetailDto"%>
<%@page import="com.bookstore.dao.BookDao"%>
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
			<h1>주문하기</h1>
		</div>
		<div class="body">
			<%
				int bookNo = Integer.parseInt(request.getParameter("bookno"));
				int amount = Integer.parseInt(request.getParameter("amount"));
				
				// 책정보 조회하기
				BookDao bookDao = new BookDao();
				BookDetailDto book = bookDao.getBookByNo(bookNo);
				
				// 유저 조회하기
				UserDao userDao = new UserDao();
				List<User> users = userDao.getAllUser();
			%>
			<p>주문정보를 확인하세요</p>
			<div>
				<table class="table bordered">
					<tbody>
						<tr>
							<th>제목</th>
							<td colspan="3"><%=book.getTitle() %></td>
						</tr>
						<tr>
							<th>저자</th>
							<td><%=book.getWriter() %></td>
							<th>출판사</th>
							<td><%=book.getPublisher() %></td>
						</tr>
						<tr>
							<th>가격</th>
							<td><%=NumberUtil.numberWithComma(book.getPrice()) %>원</td>
							<th>할인가격</th>
							<td><%=NumberUtil.numberWithComma(book.getDiscountPrice()) %>원</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="well">
				<form method="post" action="order.jsp">
					<input type="hidden" name="price" value="<%=book.getDiscountPrice()%>"/>
					<input type="hidden" name="amount"  value="<%=amount%>"/>
					<input type="hidden" name="bookno" value="<%=bookNo%>"/>
					<div class="form-group">
						<label>구매자</label>
						<div>
							<select name="userId">
								<option selected disabled> -- 선택 하세요 -- </option>
								<%
									for (User user : users) {
								%>
								<option value="<%=user.getId() %>"><%=user.getId() %>(<%=user.getName() %>)</option>
								<%		
									}
								%>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label>구매가격</label>
						<div><input type="text" value="<%=NumberUtil.numberWithComma(book.getDiscountPrice()) %>원"  disabled/></div>
					</div>
					<div class="form-group">
						<label>구매수량</label>
						<div><input type="text" value="<%=amount%> 개" disabled="disabled"/></div>
					</div>
					<div class="text-right">
						<button type="submit">주문하기</button>
					</div>
				</form>
			</div>
		</div>
		<%@ include file="../common/footer.jsp" %>
	</div>
</body>
</html>