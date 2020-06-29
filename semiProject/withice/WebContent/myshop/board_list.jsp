<%@page import="com.withice.vo.Question"%>
<%@page import="com.withice.dao.QuestionDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>boardlist</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="/withice/css/naviAndFooter.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
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
	</style>
</head>
<body>
<%@ include file="../common/navbar.jsp"%>
<div class="container" style="font-size: 15px;">
	<div class="row">
		<div class="col-12">
			<ul class="breadcrumb float-right">
				<li class="breadcrumb-item"><a href="../home.jsp">Home</a></li>
				<li class="breadcrumb-item"><a href="index.jsp">My Page</a></li>
				<li class="breadcrumb-item"><a style="color: black;">My Postings</a></li>
			</ul>
		</div>
	</div>
	<div class="row" style="padding-bottom: 10px">
		<div class="col-12">
			<h3>MY POSTINGS</h3>
		</div>
	</div>
	<div class="row">
		<div class="col-12 text-center">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>번호</th>
						<th>분류</th>
						<th style="width: 700px">제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회</th>
					</tr>
				</thead>
				<tbody>
	<%
		QuestionDao questionDao = new QuestionDao();
		List<Question> questions =  questionDao.getQuestionsById(loginedUserId);
		
		if (questions.isEmpty()) {
	%>
					<tr>
						<td colspan="6">작성한 게시물이 없습니다.</td>
					</tr>
	<%
		}
	%>
	<%
		for (Question question : questions) {
	%>
					<tr>
						<td><%=question.getQuestionNo() %></td>
						<td><%=question.getCateNo() %></td>
						<td><a href="../board/question/detail.jsp?questionno=<%=question.getQuestionNo()%>" style="color:black"><%=question.getTitle() %></a></td>
						<td><%=question.getUserId() %></td>
						<td><%=question.getResisteredDate() %></td>
						<td><%=question.getViewCount() %></td>
					</tr>
	<%
		}
	%>
				</tbody>
			</table>
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>