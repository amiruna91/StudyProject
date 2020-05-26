<%@page import="java.util.ArrayList"%>
<%@page import="com.bookstore.util.StringUtil"%>
<%@page import="com.bookstore.util.NumberUtil"%>
<%@page import="com.bookstore.vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="com.bookstore.dao.BoardDao"%>
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
	input {
		display: inline-block;
		width: 250px;
		height: 32px;
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
			String position = "board";
		%>
		<%@ include file="../common/navibar.jsp" %>
	</div>
	<div class="header">
		<h1>게시글 목록</h1>
	</div>
	<div class="body">
		<div>
			<p>게시글을 확인하세요</p>
			<table class="table">
			<%
				request.setCharacterEncoding("utf-8");
				
				String searchCondition = StringUtil.nullToBlank(request.getParameter("searchCondition"));
				String searchKeyword = request.getParameter("searchKeyword");
				
				BoardDao boardDao = new BoardDao();
				List<Board> boards = new ArrayList<Board>();
				
				if (searchCondition.isEmpty()) {
					boards = boardDao.getAllBoards();
				} else if ("title".equals(searchCondition)) {
					boards = boardDao.getBoardByTitle(searchKeyword);
				} else if ("writer".equals(searchCondition)) {
					boards = boardDao.getBoardByWriter(searchKeyword);
				} else if ("content".equals(searchCondition)) {
					boards = boardDao.getBoardByContent(searchKeyword);
				}
			%>
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>등록일</th>
					</tr>
				</thead>
				<tbody>
				<%
					for (Board board : boards) {
						if ("Y".equals(board.getDelYN())) {
				%>
						<tr>
							<td><%=board.getBoardNo() %></td>
							<td colspan="4"><del>삭제된 글입니다.</del></td>
						</tr>
				<%
						} else {
				%>
						<tr>
							<td><%=board.getBoardNo() %></td>
							<td><a href="detail.jsp?boardno=<%=board.getBoardNo()%>"><%=board.getTitle() %></a></td>
							<td><%=board.getWriter()%></td>
							<td><%=NumberUtil.numberWithComma(board.getHit()) %></td>
							<td><%=board.getRegisteredDate() %></td>
						</tr>
				<%
						}
					}
				%>
				</tbody>
			</table>
			<hr>
			<div class="text-right">
				<a href="form.jsp"><strong>[새글 등록하기]</strong></a>
			</div>
		</div>
		<div class="text-center">
			<form method="get" action="list.jsp">
				<label>검색조건</label>
				<select name="searchCondition">
					<option value="title" >제목</option>
					<option value="writer"> 작성자</option>
					<option value="content" > 내용</option>
				</select>
				<input type="text" name="searchKeyword"/>
				<button type="submit">검색</button>
			</form>
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
</div>
</body>
</html>