<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id='navibar'>
	<ul>
		<li class="<%="home".equals(position) ? "active" : ""%>"><a href="/simple-board/home.jsp">홈</a></li>
		<li class="<%="board".equals(position) ? "active" : ""%>"><a href="/simple-board/board/list.jsp">게시판</a></li>
		<li class="<%="my".equals(position) ? "active" : ""%>"><a href="/simple-board/user/my.jsp">내정보</a></li>
	<%
		String loginedYN = (String) session.getAttribute("LOGINED_YN");
	%>
	<%
		if ("Y".equals(loginedYN)) {
	%>
		<li class="right"><a href="/simple-board/user/logout.jsp">로그아웃</a></li>	
	<%
		} else {
	%>
		<li class="right"><a href="/simple-board/user/loginform.jsp">로그인</a></li>
		<li class="right"><a href="/simple-board/user/form.jsp">회원가입</a></li>
	<%
		}
	%>
	</ul>
	<%
		if ("Y".equals(loginedYN)) {
	%>
		<p><%=session.getAttribute("LOGINED_USER_NAME") %>님 환영합니다.</p>
	<%
		}
	%>
	
</div>