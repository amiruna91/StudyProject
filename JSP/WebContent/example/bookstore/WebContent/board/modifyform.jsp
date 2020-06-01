<%@page import="com.bookstore.util.StringUtil"%>
<%@page import="com.bookstore.vo.Board"%>
<%@page import="com.bookstore.dao.BoardDao"%>
<%@page import="com.bookstore.util.NumberUtil"%>
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
			String position = "board";
		%>
		<%@ include  file="../common/navibar.jsp" %>
	</div>
	<div class="header">
		<h1>게시글 수정</h1>
	</div>
	<div class="body">
	<%
		int boardNo = NumberUtil.stringToInt(request.getParameter("boardno"));
		String err = StringUtil.nullToBlank(request.getParameter("err"));
	
		BoardDao boardDao = new BoardDao();
		Board board = boardDao.getBoardByNo(boardNo);
		
		if ("pwd".equals(err)) {
	%>
		<p style="color: red;"><strong>비밀번호가 틀렸습니다!!!!!!</strong></p>
	<%
		}
	%>
		<p>수정할 정보를 입력하세요</p>
		<div class="well">
			<form method="post" action="update.jsp">
				<input type="hidden" name="boardno" value=<%=boardNo %>>
				<div class="form-group">
					<label>작성자</label>
					<div><input type="text" name="writer" value="<%=board.getWriter() %>" /></div>
				</div>
				<div class="form-group">
					<label>제목</label>
					<div><input type="text" name="title" value="<%=board.getTitle() %>" /></div>
				</div>
				<div class="form-group">
					<label>내용</label>
					<div><input type="text" name="content" value="<%=board.getContent() %>" /></div>
				</div>
				<div class="form-group">
					<label>비밀번호</label>
					<div><input type="password" name="password" maxlength="4"/></div>
				</div>
				<div class="text-right">
					<button type="submit">등록</button>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
</div>
</body>
</html>