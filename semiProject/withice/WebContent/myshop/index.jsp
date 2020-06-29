<%@page import="com.withice.dto.RecentlyDetailDto"%>
<%@page import="com.withice.dao.RecentlyDao"%>
<%@page import="com.withice.dto.OrderListDto"%>
<%@page import="com.withice.dao.OrderDao"%>
<%@page import="com.withice.vo.Question"%>
<%@page import="com.withice.dao.QuestionDao"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@page import="com.withice.vo.User"%>
<%@page import="com.withice.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>mypage</title>
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
	
	.more {
		color: black;
		text-decoration: none;
	}
	
	.more:hover {
		color: gray;
	}
	
	.row {
		padding: 10px 10px;
	}
  </style>
</head>
<body>
<%@ include file="../common/logincheck.jsp" %>
<%@ include file="../common/navbar.jsp"%>
<div class="container" style="font-size: 15px;">
<%
 	UserDao userDao = new UserDao();
 	User user = userDao.getUserById(loginedUserId);
%>
	<div class="row">
		<div class="col-12">
			<ul class="breadcrumb float-right">
				<li class="breadcrumb-item"><a href="../home.jsp">Home</a></li>
				<li class="breadcrumb-item"><a style="color: black;">My Page</a></li>
			</ul>
		</div>
	</div>
	<div class="row">
		<div class="col-2">
			<img src="../images/userimage/img_member_default.gif" alt="userprofile" width="160px;" height="150px;" class="img-thumbnail"/>
		</div>
		<div class="col-10">
			<strong><%=user.getName() %></strong>
			<hr />
			<div class="row">
				<div class="col-2">회원등급
					<div><strong><%=user.getGrade() %></strong></div>
				</div>
				<div class="col-2">적립금
					<div><strong><%=NumberUtil.numberWithComma(user.getUsableMileage()) %> 원</strong></div>
				</div>
				<div class="col-8">구매건수
					<div><strong>0건</strong></div>
				</div>
			</div>
		<hr />
			<div class="row">
				<div class="col-2">
					<a href="../member/modify.jsp" class="btn btn-outline-dark btn-sm">프로필 수정</a>
				</div>
				<div class="col-10">
					<a href="../myshop/address/list.jsp" class="btn btn-outline-dark btn-sm">배송주소록 관리</a>
				</div>
			</div>
		</div>
	</div>
	<hr />
	<div class="row">
		<div class="col-md-2">
			회원님의 혜택정보
		</div>
		<div class="col-md-10">
			기부천사 등급은 다음과 같은 추가 혜택이 있습니다.
		</div>
	</div>
	<hr />
	<div class="row">
		<div class="col-12">
			<h5><strong>Mileage Point</strong></h5>
		</div>
	</div>
	<div class="row">
		<div class="col-5">
			<ul>
				<li>
					<span>가용적립금</span>
					<span class="float-right">
						<strong><%=NumberUtil.numberWithComma(user.getUsableMileage()) %> 원</strong>
					</span>			
				</li>
				<li>
					<span>사용적립금</span>
					<span class="float-right">
						<strong><%=NumberUtil.numberWithComma(user.getUsedMileage()) %> 원</strong>
					</span>
				</li>
			</ul>
		</div>
		<div class="col-1">
			<span class="float-left">
				<a href="mileage/historyList.jsp" class="btn btn-outline-dark btn-sm" style="height: 25px; font-size: 10px;">조회</a>
			</span>	
		</div>
		<div class="col-6">
			<ul>
				<li>
					<span>총적립금</span>
					<span class="float-right">
						<strong><%=NumberUtil.numberWithComma(user.getTotalMileages()) %> 원</strong>
					</span>
				</li>
			<%
				OrderDao orderDao = new OrderDao();
				List<OrderListDto> ordersCnt = orderDao.getOrderByUserId(loginedUserId);
			%>
				<li>
					<span>총주문</span>
					<span class="float-right">
						<strong><%=ordersCnt.size() %> 건</strong>
					</span>
				</li>
			</ul>
		</div>
	</div>
	<hr />
	<div class="row">
		<div class="col-11">
			<h5><strong>Order List</strong></h5>
		</div>
		<div class="col-1">
			<a href="order/list.jsp" class="more">+more</a>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<table class="table text-center">
					<thead>
					<tr>
						<th>주문일자</th>
						<th>주문번호</th>
						<th>이미지</th>
						<th colspan="5">상품정보</th>
						<th>상품구매금액</th>
						<th>수량</th>
						<th>주문처리상태</th>
						<th>리뷰쓰기</th>
					</tr>
				</thead>
				<tbody>
		<%
			List<OrderListDto> orders = orderDao.getOrderByUserIdMax(loginedUserId);
		%>
		<%
			if(!orders.isEmpty()){
						
				for(OrderListDto list : orders){
							
		%>
					<tr>
						<td style="vertical-align: middle">
							<%=list.getRegisteredDate() %>
						</td>
						<td style="vertical-align: middle">
							<%=list.getOrderNo() %>
						</td>
						<td style="vertical-align: middle">
							<a href="/withice/product/addrecentlyview.jsp?cateno=<%=list.getCateNo()%>&productno=<%=list.getProductNo()%>">
							<img src="../images/product-images/<%=list.getProductThumbnail() %>" alt="" width="80" height="80" />
							</a>
						</td>
						<td colspan="5" style="vertical-align: middle">
							<a style="text-decoration: none; color: black;" href="/withice/product/addrecentlyview.jsp?cateno=<%=list.getCateNo()%>&productno=<%=list.getProductNo()%>">
								<%=list.getProductName() %>
							</a>
						</td>
						<td style="vertical-align: middle">
							<%=NumberUtil.numberWithComma(list.getOrderPrice()) %>
						</td>
						<td style="vertical-align: middle">
							<%=list.getOrderAmount() %>
						</td>
						<td style="vertical-align: middle">						
							<%
								if("N".equals(list.getOrderStatus().trim())){
							%>
								<span>배송중</span>
							<%
								} else{
							%>
								<span>배송완료</span>
							<%
								}
							%>
						</td>
						<td style="vertical-align: middle">
							<a href="/withice/board/review/form.jsp?orderdetailno=<%=list.getOrderDetailNo() %>" class="btn btn-outline-secondary btn-sm" role="button">리뷰쓰기</a>
						</td>
					</tr>
				<%
						}
					} else {
				%>
					<tr>
						<td colspan="12" style="vertical-align: middle">
							<p><i class="fa fa-search" style="font-size: 50px;"></i></p>
							<p style="font-weight: bold;">장바구니가 비어 있습니다.</p>
						</td>
					</tr>
				<%
					}
				%>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row">
		<div class="col-11">
			<h5><strong>Recently Viewed</strong></h5>
		</div>
		<div class="col-1">
			<a href="../product/recent_view_product.jsp" class="more">+more</a>
		</div>
	</div>
	<div class="row text-center">
	<%
			RecentlyDao recentlyDao = new RecentlyDao();
			List<RecentlyDetailDto> details = recentlyDao.getRecentlyDetail(loginedUserId);
			
			if (!details.isEmpty()) {
				for (RecentlyDetailDto detail : details) {				
	%>	
		<div class="col-2">	
			<div class="card">
					<a href="/withice/product/productDetail.jsp?cateno=<%=detail.getCateNo() %>&productno=<%=detail.getProductNo()%>">
						<img src="../images/product-images/<%=detail.getProductThumbnail() %>" alt="" width="154" height="150" />
					</a>
				<div class="card-body" style="height: 130px;">
				<%
					if (detail.getProductComment() == null) {
				%>
					<p>-</p>
				<%
					} else {
				%>
					<p><%=detail.getProductComment() %></p>
				<%
					}
				%>
				</div>
			</div>
		</div>
	<%
			} 
		} else {
								
	%>
			<div class="col-12 text-center">
				<p>최근 본 상품이 없습니다.</p>
			</div>							
	<%
			}
	%>
	</div>
	<div class="row">
		<div class="col-11">
			<h5><strong>My Board</strong></h5>
		</div>
		<div class="col-1">
			<a href="board_list.jsp" class="more">+more</a>
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
						List<Question> questions =  questionDao.getQuestionsByIdMax(loginedUserId);
						
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