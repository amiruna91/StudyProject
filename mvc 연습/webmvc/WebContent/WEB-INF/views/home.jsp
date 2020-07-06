<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<%@ include file="common/nav.jsp" %>
	<div class="row">
		<div class="col-12">
			<h1>Home</h1>
			<p>${message }</p>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<h3>최근 등록된 책<small class="float-right"><a href="book/list.hta">더보기</a></small></h3>
			<table class="table">
				<thead>
					<tr>
						<th>순번</th>
						<th>제목</th>
						<th>저자</th>
						<th>가격</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
				<!-- 
					forEach 태그를 사용해서 최근 등록된 책을 표현하시오.
					가격은 자릿수가 표현되도록 표현하시오.
					등록일은 2020.9.1과 같은 형식으로 표현하시오.
				 -->
					 <c:forEach items="${recentBooks }" var="recentBook" varStatus="recentBookStatus">
					 	<tr>
					 		<td>${recentBookStatus.count }</td>
					 		<td><c:out value="${recentBook.title }"/></td>
					 		<td>${recentBook.writer }</td>
					 		<td><fmt:formatNumber value="${recentBook.price }"/></td>
					 		<td><fmt:formatDate value="${recentBook.registeredDate }" pattern="yyyy.M.d" /></td>
					 	</tr>
					 </c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>