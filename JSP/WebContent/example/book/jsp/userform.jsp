<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>		
		<div><h1>신규회원 등록</h1></div>
		<div>
			<form action="userregister.jsp" method="post">
				<div>
					<label>아이디를 입력하세요</label>
					<div><input type="text" name="id"/></div>
				</div>
				<div>
					<label>비밀번호를 입력하세요</label>
					<div><input type="password" name="password"/></div>
				</div>
				<div>
					<label>이름을 입력하세요</label>
					<div><input type="text" name="name"/></div>
				</div>
				<div>
					<label>이메일을 입력하세요</label>
					<div><input type="text" name="email"/></div>
				</div>
				<div>
					<button type="submit">등록</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>