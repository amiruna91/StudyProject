<%@page import="com.withice.util.NumberUtil"%>
<%@page import="com.withice.dto.OrderListDto"%>
<%@page import="com.withice.dao.OrderDao"%>
<%@page import="com.withice.vo.User"%>
<%@page import="com.withice.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>orderlist</title>
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
  	a {
	color : black;
	text-decoration: none;
	}
	a:hover {
		color: black;
	}
	table {
		font-size: 12px;
	}
	h6 {
		font-size: 10px;
	}
  	
  	.breadcrumb-item+.breadcrumb-item::before {
    display: inline-block;
    padding-right: .5rem;
    color: #6c757d;
    content: ">";
	}
	</style>
</head>
<body>
<%@ include file="../../common/logincheck.jsp"%>
<%@ include file="../../common/navbar.jsp"%>
<div class="container">
	<div class="row">
		<div class="col-12">
			<ul class="breadcrumb float-right">
				<li class="breadcrumb-item"><a href="../../home.jsp">Home</a></li>
				<li class="breadcrumb-item"><a href="../index.jsp">My Page</a></li>
				<li class="breadcrumb-item"><a style="color: black;">Order Details</a></li>
			</ul>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<p style="padding-top: 20px;">Order List</p>
			<div class="row">
				<div class="col-12">
					<table class="table table-bordered table-active">
						<tr>
							<th class="text-center" rowspan="3" style="padding-top: 30px;">
								<span style="font-weight: bold;">
									<%=loginedUserName %>
								</span>
								님의 주문내역입니다.
							</th>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<%
		OrderDao orderDao = new OrderDao();
		List<OrderListDto> orders = orderDao.getOrderByUserId(loginedUserId);
	%>
	<div class="row">
		<div class="col-12">
			<table class="table text-center">
				<thead>
					<tr>
						<th>주문날짜</th>
						<th>이미지</th>
						<th colspan="5">상품정보</th>
						<th>주문가격</th>
						<th>주문수량</th>
						<th>처리상태</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<%
					if(!orders.isEmpty()){
						
						for(OrderListDto list : orders){
							
				%>
					<tr>
						<td style="vertical-align: middle !important;">
							<%=list.getRegisteredDate() %>
						</td>
						<td style="vertical-align: middle !important;">
							<a href="/withice/product/addrecentlyview.jsp?cateno=<%=list.getCateNo()%>&productno=<%=list.getProductNo()%>">
							<img src="../../images/product-images/<%=list.getProductThumbnail() %>" alt="" width="80" height="80" />
							</a>
						</td>
						<td style="vertical-align: middle !important;" colspan="5">
							<a style="text-decoration: none;" href="/withice/product/addrecentlyview.jsp?cateno=<%=list.getCateNo()%>&productno=<%=list.getProductNo()%>">
								<%=list.getProductName() %>
							</a>
						</td>
						<td style="vertical-align: middle !important;">
							<%=NumberUtil.numberWithComma(list.getOrderPrice()) %>
						</td>
						<td style="vertical-align: middle !important;">
							<%=list.getOrderAmount() %>
						</td>
						<td style="vertical-align: middle !important;">						
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
						<td style="vertical-align: middle !important;">
							<a href="/withice/board/review/form.jsp?orderdetailno=<%=list.getOrderDetailNo() %>" class="btn btn-outline-secondary btn-sm" role="button">리뷰쓰기</a>
						</td>
					</tr>
				<%
						}
					} else {
				%>
					<tr>
						<td colspan="10">
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
</div>
<%@ include file="../../common/footer.jsp"%>
</body>
</html>