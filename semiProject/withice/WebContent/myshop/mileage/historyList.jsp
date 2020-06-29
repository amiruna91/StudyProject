<%@page import="com.withice.dto.OrderListDto"%>
<%@page import="com.withice.vo.Order"%>
<%@page import="com.withice.dao.OrderDao"%>
<%@page import="com.withice.vo.Pagenation"%>
<%@page import="com.withice.vo.Mileage"%>
<%@page import="com.withice.dao.MileageDao"%>
<%@page import="com.withice.vo.User"%>
<%@page import="com.withice.dao.UserDao"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title></title>
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
  		text-decoration: none;
  	}
    	
  	.breadcrumb-item+.breadcrumb-item::before {
    display: inline-block;
    padding-right: .5rem;
    color: #6c757d;
    content: ">";
	}
	
	.order {
		width: 200px;
		height: 50px;
	}
	
	.save {
		width: 200px;
		height: 50px;
	}
	
		.page-link{
		color: black;
		font-size: 11px;
	}
	.page-link:hover {
		color: black;
	}
	
	.page-item.active .page-link {
		z-index: 3;
	    color: black;;
	    background-color: lightgray;
	    border-color: lightgray;
	}
	</style>
</head>
<body>
<%@ include file="../../common/navbar.jsp"%>
<%
	UserDao userDao = new UserDao();
	User user = userDao.getUserById(loginedUserId);
	MileageDao mileageDao = new MileageDao();
	OrderDao orderDao = new OrderDao();
	List<OrderListDto> orers = orderDao.getOrderByUserId(loginedUserId);
	
	int rowsPerPage = 5;
	int pagesPerBlock = 5;
	int rows = mileageDao.getMileageCount(loginedUserId);
	int pageNo = NumberUtil.stringToInt(request.getParameter("page"), 1);
	
	Pagenation pagenation = new Pagenation(rows, rowsPerPage, pagesPerBlock, pageNo);
	
	List<Mileage> mileages = mileageDao.getMileageByRange(loginedUserId,pagenation.getBeginIndex(), pagenation.getEndIndex());
%>
<div class="container" style="font-size: 15px;">
	<div class="row">
		<div class="col-12">
			<ul class="breadcrumb float-right">
				<li class="breadcrumb-item"><a href="../../home.jsp">Home</a></li>
				<li class="breadcrumb-item"><a href="../index.jsp">My Page</a></li>
				<li class="breadcrumb-item"><a style="color: black;">적립금</a></li>
			</ul>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<h5>적립금</h5>
			<p style="color: gray;">고객님의 사용가능 적립금 금액입니다.</p>	
		</div>
	</div>
	<div class="row" style="padding: 20px 20px;">
		<div class="col-12">
			<ul>
				<li>
					<span>총 적립금</span>
					<span class="float-right">
						<%=NumberUtil.numberWithComma(user.getTotalMileages()) %> 원
					</span>
				</li>
				<li>
					<span>사용된 적립금</span>
					<span class="float-right">
						<%=NumberUtil.numberWithComma(user.getUsedMileage()) %> 원
					</span>
				</li>
				<li>
					<span>사용가능 적립금</span>
					<span class="float-right">
						<%=NumberUtil.numberWithComma(user.getUsableMileage()) %> 원
					</span>
				</li>
			</ul>
		</div>
	</div>
	<div class="row" style="padding: 20px 20px;">
		<div class="col-12 text-center">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th class="order">주문날짜</th>
						<th class="save">적립금</th>
						<th>내용</th>
					</tr>
				</thead>
				<tbody>
	<%
		for (Mileage mileage : mileages) {
	%>
					<tr>
						<td><%=mileage.getRegisteredDate() %></td>
						<td><%=NumberUtil.numberWithComma(mileage.getGetMileage())%> 원</td>
	<%
		if (mileage.getContent().equals("신규회원가입")) {
	%>
						<td><%=mileage.getContent() %></td>
	<%
			} else {
	%>
						<td><%=mileage.getContent() + " " + "(" + orderDao.getOrderCountByNo(mileage.getMileageOrder()) + ")" + "건"%></td>
	<%
			}
	%>
					</tr>
	<%				
		}
	%>
				</tbody>
			</table>
		</div>
	</div>
	<div>
			<ul class="pagination justify-content-center">
		<%
			if (pageNo > 1) {
		%>
				<li class="page-item">
					<a class="page-link quickPage" href="historyList.jsp?page=1"><i class="fa fa-angle-double-left"></i></a>
				</li>
				<li class="page-item">
					<a class="page-link" href="historyList.jsp?page=<%=pageNo - 1%>">&lt;</a>
				</li>
		<%
			}
		%>
		<%
			for (int num = pagenation.getBeginPageIndex(); num<=pagenation.getEndPageIndex(); num++) {
		%>
				<li class="page-item <%=pageNo == num ? "active" : ""%>"><a class="page-link" href="historyList.jsp?page=<%=num%>"><%=num %></a></li>
		<%
			}
		%>
		<%
			if (pageNo < pagenation.getTotalpage()) {
		%>
				<li class="page-item">
					<a class="page-link" href="historyList.jsp?page=<%=pageNo + 1%>">&gt;</a>
				</li>
				<li class="page-item">
					<a class="page-link quickPage" href="historyList.jsp?page=<%=pagenation.getTotalpage()%>"><i class="fa fa-angle-double-right"></i></a>
				</li>
		<%
			}
		%>
			</ul>
		</div>
	<div class="row" style="padding: 20px 20px; font-size: 14px;">
		<div class="col-12">
			<table class="table table-borderd">
				<thead>
					<tr>
						<th>적립금 안내</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1. 주문으로 발생한 적립금은 배송완료 후 7일 부터 실제 사용 가능한 적립금으로 전환됩니다. 배송완료 시점으로부터 7일 동안은 미가용 적립금으로 분류됩니다.</td>
					</tr>
					<tr>
						<td>2. 미가용 적립금은 반품, 구매취소 등을 대비한 임시 적립금으로 사용가능 적립금으로 전환되기까지 상품구매에 사용하실 수 없습니다.</td>
					</tr>
					<tr>
						<td>3. 사용가능 적립금(총적립금 - 사용된적립금 - 미가용적립금)은 상품구매 시 바로 사용가능합니다.</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<%@ include file="../../common/footer.jsp" %>
</body>
</html>