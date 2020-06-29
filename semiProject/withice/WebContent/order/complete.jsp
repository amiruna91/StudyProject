<%@page import="com.withice.util.NumberUtil"%>
<%@page import="com.withice.vo.Order"%>
<%@page import="com.withice.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>success</title>
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
	</style>
</head>
<body>
<%@ include file="../common/navbar.jsp"%>
<div class="container">
<div class="body">
<div class="row">
		<div class="col-12">
			<ul class="breadcrumb float-right">
				<li class="breadcrumb-item"><a href="../home.jsp">Home</a></li>
				<li class="breadcrumb-item"><a style="color: black;">Success</a></li>
			</ul>
		</div>
	</div>
 <div class="text-left">
 	<h3>SUCCESS</h3>
 </div>
 <div style="padding: 50px"></div>
 <div class="text-center">
 	<i class="fa fa-check-circle-o" style="font-size: 150px"></i>
 </div>
 <div style="padding: 10px"></div>
 <div class="row">
 	<div class="col-12 mb-5">
		 <div class="text-center">
		 	<h4><strong>주문이 완료되었습니다.</strong></h4>
		 </div>
 	</div>
 </div>
 <%
 	OrderDao orderDao = new OrderDao();
 	Order order = orderDao.getOrderNoByUserIdRownum(loginedUserId);
 %>
 <div class="row">
 	<div class="col-12 mb-5">
 		<div class="text-center">
 			<ul class="list-group" >
			  <li class="list-group-item">주문자명 : <span style="font-weight: bold;"><%=loginedUserName %></span></li>
			  <li class="list-group-item">주문일자 : <span style="font-weight: bold; color: red;"><%=order.getRegisteredDate() %></span></li>
			  <li class="list-group-item">주문가격 : <span style="font-weight: bold;"><%=NumberUtil.numberWithComma(order.getPrice())%></span>원</li>
			</ul>
 		</div>
 	</div>
 </div>
 <div class="text-center">
 		<a href="../home.jsp" class="btn btn-gray btn-lg" style="background-color:gray; color:white;">메인으로가기</a>
 </div>
</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>