<%@page import="com.withice.util.NumberUtil"%>
<%@page import="com.withice.dto.RecentlyDetailDto"%>
<%@page import="java.util.List"%>
<%@page import="com.withice.dao.RecentlyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Recently Viewed</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="/withice/css/naviAndFooter.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <script src="/withice/js/navi.js"></script>
	<style type="text/css">
	div.col-md-12 {
		font-size: 12px;
	}
	.row {
		padding-top: 20px;
	}
	.col-md-12 > a {
		color: gray;
		text-decoration: none;
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
	</style>
</head>
<body>
<%@ include file="../common/logincheck.jsp"%>
<%@ include file="../common/navbar.jsp"%>
<div class="container">
	<div class="row">
		<div class="col-md-12 text-right">
			<a href="../home.jsp">Home</a> <span title="현재 위치"> > Recently Viewed</span>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<span style="font-size: 15px; font-weight: 400; letter-spacing: 1.5px;">RECENTRY VIEWED</span>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<table class="table text-center" style="margin-bottom: 200px;">
				<thead>
					<tr>
						<th>이미지</th>
						<th colspan="5">상품명</th>
						<th colspan="2">상품설명</th>
						<th>판매가</th>
						<th colspan="2"></th>
					</tr>
				</thead>
				<tbody>
				<!-- 반복문 시작 -->
		<%
			RecentlyDao recentlyDao = new RecentlyDao();
			List<RecentlyDetailDto> details = recentlyDao.getRecentlyDetail(loginedUserId);
			if(!details.isEmpty()){
				for(RecentlyDetailDto detail : details){
					
		%>
					<tr>
						<td style="vertical-align: middle !important;">
							<a href="/withice/product/productDetail.jsp?cateno=<%=detail.getCateNo() %>&productno=<%=detail.getProductNo()%>">
								<img src="../images/product-images/<%=detail.getProductThumbnail() %>" alt="" width="80" height="80" />
							</a>
						</td>
						<td style="vertical-align: middle !important;" colspan="5">
							<a style="text-decoration: none;" href="/withice/product/productDetail.jsp?cateno=<%=detail.getCateNo() %>&productno=<%=detail.getProductNo()%>"><%=detail.getProductName() %></a>
						</td>
						<%
							if(detail.getProductComment() == null){
								
						%>
						<td style="vertical-align: middle !important;" colspan="2">
							-
						</td>
						<%
							}else {
								
						%>
						<td style="vertical-align: middle !important;" colspan="2">
							<%=detail.getProductComment() %>
						</td>								
						<%
							}
						%>
						<td style="vertical-align: middle !important;"><%=NumberUtil.numberWithComma(detail.getProductPrice()) %></td>
						<td style="vertical-align: middle !important;" colspan="2">
							<div class="btn-group-vertical">
							  <a href="/withice/order/addonlycart.jsp?product_no=<%=detail.getProductNo() %>&product_amount=1" class="btn btn-outline-secondary btn-sm" role="button">담기</a>
							  <a href="/withice/product/deleterecent.jsp?recently_no=<%=detail.getRecentlyNo()%>" class="btn btn-outline-secondary btn-sm" role="button">삭제</a>
							</div>
						</td>
					</tr>
				<%
				}
			} else {
				
				%>
				<tr>
					
					<td colspan="12">
						<p><i class="fa fa-search" style="font-size: 50px;"></i></p>
						<p style="font-weight: bold;">최근본 상품 내역이 없습니다.</p>
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
	<%@ include file="../common/footer.jsp" %>
</body>
</html>