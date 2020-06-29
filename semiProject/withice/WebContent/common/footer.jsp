<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<link href="https://fonts.googleapis.com/css?family=Poor+Story|Pangolin" rel="stylesheet">
	<style>
		.footerp {
			color: gray;
			margin: 0;
			font-size: 12px;
		}
		.container {
			font-family: Pangolin,Poor Story;
		}
		.footerlink {
			color: gray;
			font-size: 12px;
			text-decoration: none;
		}
		.footerlink:hover {
			color: black;
		}
		.footertitle{
			color: black !important;
			margin-bottom: 5px !important;
			font-weight: bold;
		}
		.footerlist{
			padding-bottom: 0;
			padding-left: 0;
			padding-top: 0;
			border: 0 !important;
		}
		.footerfont {
			font-family: Pangolin;	
		}
	
	</style>
</head>
<div id="footer" class="container-fluid mt-3">
		<div class="justify-content-between footerfont">
			<ul class="list-group list-group-horizontal" style="margin-left: 385px;" >
			  <li class="list-group-item">COMPANY</li>
			  <li class="list-group-item">AGREEMENT</li>
			  <li class="list-group-item">PRIVACY POLICY</li>
			  <li class="list-group-item">GUIDE</li>
			  <li class="list-group-item">CONTACT</li>
			</ul>
		</div>
</div>
<div class="container">

		<div class="row" id="footer-body" style="border-bottom: 1px solid lightgray;">
			<div class="col-3">
			  	<p class="footertitle">CUSTOMER CENTER</p>
			  	<p class="footerp" style="font-size: 25px !important; color: black !important;"><i class="fa fa-microphone"></i> 02-3474-6865</p>
			  	<p style="font-size: 25px !important; color: black !important;">ㅡ</p>
			  	
			  	<p class="footerp" >평일 오전10:00~오후4:00(점심 12:00~1:00)</p>
			  	<p class="footerp" > Sat.Sun.Holiday OFF</p>
			</div>
			<div class="col-2 ">
			  	<p class="footertitle">ACCOUNT INFO</p>
			  	<p class="footerp" >국민 609537-04-000856</p>
			  	<p class="footerp" >name 승일희망재단</p>
			  	<p class="footerp" >인터넷뱅킹 바로가기</p>
			</div>
			<div class="col-2">
			  	<p class="footertitle">FAVORITE MENU</p>
					<%
						if ("Y".equals(loginedYN)) {
					%>
					<a class="nav-link footerlink" style="padding-top: 1px; padding-bottom: 1px;" href="/withice/login/logout.jsp">LOGOUT</a>
					<a class="nav-link footerlink" style="padding-top: 1px; padding-bottom: 1px;" href="/withice/member/modify.jsp">MODIFY</a>
					<%
						} else {
					%>
					<a class="nav-link footerlink" style="padding-top: 1px; padding-bottom: 1px;" href="/withice/login/loginform.jsp">LOGIN</a>
					<a class="nav-link footerlink" style="padding-top: 1px; padding-bottom: 1px;" href="/withice/member/join.jsp">JOIN US</a>
					<%
						}
					%>
				    <a class="nav-link footerlink" style="padding-top: 1px; padding-bottom: 1px;" href="/withice/myshop/wish_list.jsp">WISH LIST</a>
				    <a class="nav-link footerlink" style="padding-top: 1px; padding-bottom: 1px;" href="/withice/order/basket.jsp">CART</a>
				    <a class="nav-link footerlink" style="padding-top: 1px; padding-bottom: 1px;" href="/withice/myshop/order/list.jsp">ORDER LIST</a>
				    <a class="nav-link footerlink" style="padding-top: 1px; padding-bottom: 1px;" href="/withice/myshop/index.jsp">MY PAGE</a>
			</div>
			<div class="col-4">
			  	<p class="footertitle" >RETURN / EXCHANGE</p>
			  	<p class="footerp" >서울시 강남구 강남대로 310, 605호 (역삼동, 유니온센터)</p>
			  	<p class="footerp" >자세한 교환·반품절차 안내는 문의란 및 공지사항을 참고해주세요</p>
			  	<ul class="list-group list-group-horizontal list-group-flush" id="icon">
				  <li class="list-group-item footerlist"><a href="/withice/board/manager/noticelist.jsp"><i class="fa fa-bullhorn" aria-hidden="true"></i></a></li>
				  <li class="list-group-item footerlist"><a href="/withice/board/question/list.jsp"><i class="fa fa-comments" aria-hidden="true"></i></a></li>
				  <li class="list-group-item footerlist"><a href="/withice/board/review/list.jsp"><i class="fa fa-camera" aria-hidden="true"></i></a></li>
				  <li class="list-group-item footerlist"><a href="/withice/myshop/order/list.jsp"><i class="fa fa-credit-card-alt" aria-hidden="true"></i></a></li>
				  <li class="list-group-item footerlist"><a href=""><i class="fa fa-tags" aria-hidden="true"></i></a></li>
				</ul>
			</div>
		</div>
		
		<div class="row">
			<div class="col-12" id="footer-info" style="margin-top: 10px;">
				<p class="footerp" >
					COMPANY : 승일희망재단  	OWNER : 박승일,로션김  		BUSINESS LICENSE : 220-82-09538  	MALL-ORDER LICENSE : 2016-서울강남-02482
				</p>
				<p class="footerp" >
					ADDRESS : 06253 서울특별시 강남구 강남대로 310 (역삼동) 605호			TEL : 02-3474-6865FAX : 02-3453-6871
				</p>
				<p class="footerp" >
					CPO : 박성자 (sihope@sihope.or.kr)     	CONTACT US : withice@sihope.or.kr
				</p>
				<p class="footerp" >
					COPYRIGHT © WITHICE [위드아이스] ALL RIGHTS RESERVED. HOSTING By CAFE24 | DESIGNED By DFLOOR
				</p>
			</div>
		</div>
</div>