<%@page import="com.sample.dao.UserDao"%>
<%@page import="com.sample.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div><h1>회원 등록</h1></div>
	<div>
		<%
			request.setCharacterEncoding("utf-8");
		
			String id = request.getParameter("id");
			String password = request.getParameter("password");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			
			User user = new User();
			user.setId(id);
			user.setPassword(password);
			user.setName(name);
			user.setEmail(email);
			
			UserDao userDao = new UserDao();
			userDao.insertUser(user);
		%>
		
		<p>회등 등록이 완료되었습니다.</p>
	</div>
</body>
</html>