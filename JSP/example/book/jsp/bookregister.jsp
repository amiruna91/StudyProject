<%@page import="com.sample.dao.BookDao"%>
<%@page import="com.sample.vo.Book"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- <h1>책 정보 조회</h1> -->
	
	<%
		request.setCharacterEncoding("utf-8");
	
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String genre = request.getParameter("genre");
		String publisher = request.getParameter("publisher");
		int price = Integer.parseInt(request.getParameter("price"));
		int discountPrice = Integer.parseInt(request.getParameter("discountPrice"));
		int stock = Integer.parseInt(request.getParameter("stock"));
		
		Book book = new Book();
		book.setTitle(title);
		book.setWriter(writer);
		book.setGenre(genre);
		book.setPublisher(publisher);
		book.setPrice(price);
		book.setDiscountPrice(discountPrice);
		book.setStock(stock);
		
		BookDao bookDao = new BookDao();
		bookDao.insertBook(book);
	%>
	
	<h1>책 등록 완료</h1>
	
	<p>새로운 책이 등록 되었습니다.</p>
	
	<%-- <table border="1" style="width: 100%">
		<thead>
			<tr>
				<th>제목</th>
				<th>저자</th>
				<th>장르</th>
				<th>출판사</th>
				<th>가격</th>
				<th>할인가격</th>
				<th>입고수량</th>
			</tr>
		</thead>
		<tbody style="text-align: center;">
			<tr>
				<td><%=title %></td>
				<td><%=writer %></td>
				<td><%=genre %></td>
				<td><%=publisher %></td>
				<td><%=price %></td>
				<td><%=discountPrice %></td>
				<td><%=stock %></td>
			</tr>
		</tbody>
	</table> --%>
</body>
</html>