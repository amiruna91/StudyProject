<%@page import="com.simple.vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="com.simple.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Simple Board</title>
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
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
		<h1>게시글</h1>
	</div>
	<div class="body">
		<p>게시글 목록을 확인하세요</p>
		<div>
			<table class="table">
				<colgroup>
					<col width="10%">
					<col width="*">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th class="text-center">번호</th>
						<th>제목</th>
						<th class="text-center">작성자</th>
						<th class="text-center">조회수</th>
						<th class="text-center">댓글수</th>
						<th class="text-center">등록일</th>
					</tr>
				</thead>
				<tbody>
				<%
					BoardDao boardDao = new BoardDao();
					List<Board> boards = boardDao.getAllBoards();
				%>
				<%
					for (Board board : boards) {
						if ("N".equals(board.getDelYN())) {
				%>
						<tr>
							<td class="text-center"><%=board.getBoardNo() %></td>
							<td><a href="hit.jsp?no=<%=board.getBoardNo()%>"><%=board.getTitle() %></a></td>
							<td class="text-center"><a href="writers.jsp?userid=<%=board.getWriter()%>"><%=board.getWriter() %></a></td>
							<td class="text-center"><%=board.getHit() %></td>
							<td class="text-center"><%=board.getReplyCnt() %></td>
							<td class="text-center"><%=board.getCreateDate() %></td>
						</tr>
				<%
						} else {
				%>
						<tr>
							<td class="text-center"><%=board.getBoardNo() %></td>
							<td colspan="5"><del>삭제된 글입니다.</del></td>
						</tr>
				<%
						}
					}
				%>
				</tbody>
			</table>
		</div>
		<div class="text-right">
			[<a href="form.jsp">글 쓰기</a>]
		</div>
	</div>
	<div class="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>
</div>
</body>
</html>