<%@page import="com.withice.vo.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.withice.dao.CategoryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="navbar navbar-expand fixed-top justify-content-around" style="height: 46px">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="/withice/home.jsp">HOME</a></li>
				<%
					if ("Y".equals(loginedYN)) {
				%>
				<li class="nav-item"><a class="nav-link" href="/withice/login/logout.jsp">LOGOUT</a></li>
				<li class="nav-item"><a class="nav-link" href="/withice/member/modify.jsp">MODIFY</a></li>
				<%
					} else {
				%>
				<li class="nav-item"><a class="nav-link" href="/withice/login/loginform.jsp">LOGIN</a></li>
				<li class="nav-item"><a class="nav-link" href="/withice/member/join.jsp">JOIN US</a></li>
				<%
					}
				%>
				<li class="nav-item"><a class="nav-link" href="/withice/order/basket.jsp">CART</a></li>
				<li class="nav-item"><a class="nav-link" href="/withice/myshop/index.jsp">MY PAGE</a></li>
				 
				 <!-- Dropdown -->
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbardrop"
					data-toggle="dropdown"> COMMUNITY </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="/withice/board/manager/noticelist.jsp">공지사항</a>
						<a class="dropdown-item" href="/withice/board/question/list.jsp">문의게시판</a>
						<a class="dropdown-item" href="/withice/board/review/list.jsp">상품후기</a>
						<a class="dropdown-item" href="/withice/board/manager/eventlist.jsp">이벤트</a>
					</div></li>
					
				<li class="nav-item"><a class="nav-link" href="/withice/board/question/list.jsp">문의게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="/withice/board/review/list.jsp">상품후기</a></li>
            </ul>
            
          <% 
          		if ("Y".equals(adminLogin)) {
          %>
            <!-- 관리자 버튼 -->
			<a href="/withice/manager/manager.jsp" class="btn btn-outline-info">관리자 전용</a>
		  <%
          		} else {
		  %>
		  <div></div>
		  <%
          		}
		  %>
		</div>
		
        <div style="height: 100px; width:100%; margin-top: 60px; margin-bottom: 20px;">
            <div class="text-center">
                <h1><a href="/withice/home.jsp"><img width="500px" height="100px" src="/withice/images/navbar/logo.jpg"/></a></h1>
            </div>
        </div>
		
		<!-- 카테고리 메뉴 -->
		<%
			CategoryDao categoryDao = new CategoryDao();
			List<Category> mainCategories = categoryDao.getMainCategorys();
		%>
		<div class="navbar navbar-expand "  id="nav-menu">
			<!-- Links -->
			<ul class="navbar-nav mx-auto d-flex justify-content-around" style="width: 70%">
				<!-- Dropdown -->
				<%
					for (Category mainCategory : mainCategories) {
				%>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="/withice/product/productList.jsp?cateno=<%=mainCategory.getNo()%>" data-toggle="dropdown"><%=mainCategory.getName() %></a>
						<div class="dropdown-menu">
						<%
							List<Category> categories = categoryDao.getCategoryByNo(mainCategory.getNo());
							for (Category category : categories) {
						%>
							<a class="dropdown-item mt-1 ml-1"  style="width: 150px;" href="/withice/product/productList.jsp?cateno=<%=category.getNo()%>"><%=category.getName() %></a> 
						<%
							}
						%>
						</div>
					</li>
				<%
					}
				%>
				<li class="nav-item"><a class="nav-link" href="/withice/board/manager/eventlist.jsp">이벤트</a></li>
				<li class="nav-item"><a class="nav-link" href="/withice/board/manager/noticelist.jsp">공지사항</a></li>
			</ul>
		</div>
	<!-- 카테고리 메뉴 끝 -->