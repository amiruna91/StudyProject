<%@page import="com.bookstore.util.StringUtil"%>
<%@page import="com.bookstore.util.NumberUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.bookstore.dao.ReviewDao"%>
<%@page import="com.bookstore.dto.ReviewDto"%>
<%@page import="com.bookstore.dto.BookDetailDto"%>
<%@page import="com.bookstore.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book 상세정보</title>
<link rel="stylesheet" type="text/css" href="../css/bookstore.css">
</head>
<body>
	<div class="wrapper">
		<div class="navi">
			<%
				String position = "book";
			%>
			<%@ include file="../common/navibar.jsp" %>
		</div>
		<div class="header">
			<h1>책 정보</h1>
		</div>
		<div class="body">
		<%
			int bookNo = Integer.parseInt(request.getParameter("bookno"));
		
			// 책 정보 조회
			BookDao bookDao = new BookDao();
			BookDetailDto book = bookDao.getBookByNo(bookNo);
		%>
			<div>
				<h3>책의 상세정보</h3>
				<table class="table bordered">
					<colgroup>
						<col width="10%">
						<col width="40%">
						<col width="10%">
						<col width="40%">
					</colgroup>	
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
						<th>평점</th>
						<td><%=book.getPoint() %> 점</td>
						<th>리뷰개수</th>
						<td><%=book.getReviewCnt() %> 개</td>
					</tr>
					<tr>
						<th>가격</th>
						<td><%=NumberUtil.numberWithComma(book.getPrice()) %> 원</td>
						<th>할인가격</th>
						<td><%=NumberUtil.numberWithComma(book.getDiscountPrice()) %> 원</td>
					</tr>
					<tr>
						<th>추천수</th>
						<td><%=NumberUtil.numberWithComma(book.getLikes()) %> 개</td>
						<th>재고</th>
						<td><%=NumberUtil.numberWithComma(book.getStock()) %> 권</td>
					</tr>
				</table>
				
				<div class="text-right">
					<a href="list.jsp">목록으로 가기</a>
				</div>
			</div>
			<div>
				<%
					ReviewDao reviewDao = new ReviewDao();
					List<ReviewDto> reviews = reviewDao.getReviewByBookNo(bookNo);
				
				%>
				<h3>이 책의 리뷰</h3>
				<table class="table">
					<colgroup>
						<col width="10%">
						<col width="23%">
						<col width="10%">
						<col width="23%">
						<col width="10%">
						<col width="23%">
					</colgroup>
					<tbody>
					<%
						if (reviews.isEmpty()) {
					%>
						<tr>
							<td>등록된 리뷰가 존재하지 않습니다.</td>
						</tr>					
					<%
						} else {
							for (ReviewDto review : reviews) {							
					%>
						<tr>
							<th>작성자</th>
							<td><%=review.getUserName() %></td>
							<th>평점</th>
							<td><%=review.getPoint() %> 점</td>
							<th>작성일</th>
							<td><%=review.getRegisteredDate() %></td>
						</tr>
						<tr>
							<td colspan="6"><%=StringUtil.strWithBr(review.getContent()) %></td>
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