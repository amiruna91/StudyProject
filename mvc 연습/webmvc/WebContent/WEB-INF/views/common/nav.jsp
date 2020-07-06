<%@ page pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<ul class="navbar-nav">
		<li class="nav-item active">
			<a class="nav-link" href="/webmvc/home.hta">홈</a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="/webmvc/book/list.hta">책</a>
		</li>
		<li class="nav-item">
			<c:choose>
				<c:when test="${empty loginUser }">
					<a class="nav-link" href="/webmvc/login/loginform.hta">로그인</a>
				</c:when>
				<c:otherwise>
					<a class="nav-link" href="/webmvc/login/out.hta">로그아웃</a>
				</c:otherwise>
			</c:choose>
		</li>
	</ul>
</nav>