<%@page import="com.withice.util.NumberUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.withice.dto.WishListDetailDto"%>
<%@page import="com.withice.dao.WishListDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="/withice/css/naviAndFooter.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <script src="/withice/js/basketjs.js"></script>
   <script src="/withice/js/navi.js"></script>
<style type="text/css">

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
		<div class="row" style="margin-top: 15px;">
			<div class="col-md-12 text-right">
				<a href="../home.jsp">Home</a> > <a href="index.jsp">My Page</a>  <span title="현재 위치"> > Recently Viewed</span>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<span style="font-size: 15px; font-weight: 400; letter-spacing: 1.5px;">WISH LIST</span>
			</div>
		</div>
		<div class="row" style="margin-bottom: 100px;">
			<div class="col-12">
				<table class="table text-center">
					<thead>
						<tr>
							<th>이미지</th>
							<th colspan="5">상품정보</th>
							<th>판매가</th>
							<th>적립금</th>
							<th>배송구분</th>
							<th>배송비</th>
							<th>합계</th>
							<th colspan="2">선택</th>
						</tr>
					</thead>
					<tbody>
					<%
						WishListDao wishListDao = new WishListDao();
						List<WishListDetailDto> details = wishListDao.getWishListDetail(loginedUserId);
						int rowsPerPage = 4;
						int pageNo = NumberUtil.stringToInt(request.getParameter("page"), 1);
						int beginNumber = (pageNo - 1) * rowsPerPage + 1;
						int endNumber = pageNo * rowsPerPage;
						List<WishListDetailDto> detailsRange = wishListDao.getWishsByRange(loginedUserId, beginNumber, endNumber);
						
						int pagesPerBlock = 5;
						int rows = wishListDao.getWishListCount(loginedUserId);
						int totalPages = (int) Math.ceil((double)rows/rowsPerPage);
						int totalBlocks = (int) Math.ceil((double)totalPages/pagesPerBlock);
						int currentBlock = (int) Math.ceil((double)pageNo/pagesPerBlock);
						
						int beginPageNo = (currentBlock - 1) * pagesPerBlock + 1;
						int endPageNo = currentBlock * pagesPerBlock;
						if (currentBlock == totalBlocks) {
							endPageNo = totalPages;
						}
					
						if(!detailsRange.isEmpty()){
							
							for(WishListDetailDto range : detailsRange){

					%>
					<!-- 반복문 시작 -->
						<tr>
							<td style="vertical-align: middle !important;">
								<a href="/withice/product/addrecentlyview.jsp?cateno=<%=range.getCateNo() %>&productno=<%=range.getProductNo()%>">
									<img src="../images/product-images/<%=range.getProductThumbnail() %>" alt="" width="80" height="80" />
								</a>
							</td>
							<td style="vertical-align: middle !important;" colspan="5">
								<a style="text-decoration: none;"href="/withice/product/addrecentlyview.jsp?cateno=<%=range.getCateNo() %>&productno=<%=range.getProductNo()%>"><%=range.getProductName() %></a>
							</td>
							<td style="vertical-align: middle !important;"><%=NumberUtil.numberWithComma(range.getProductPrice()) %></td>
							<td style="vertical-align: middle !important;">-</td>
							<td style="vertical-align: middle !important;">기본배송</td>
							<td style="vertical-align: middle !important;">무료</td>
							<td style="vertical-align: middle !important;"><%=NumberUtil.numberWithComma(range.getProductPrice()) %></td>
							<td style="vertical-align: middle !important;" colspan="2">
								<div class="btn-group-vertical">
								  <a href="/withice/order/addcart.jsp?product_no=<%=range.getProductNo()%>&product_stock=1" class="btn btn-outline-secondary btn-sm" role="button">장바구니담기</a>
								  <a href="/withice/order/deletewish.jsp?product_no=<%=range.getProductNo()%>" class="btn btn-outline-secondary btn-sm" role="button">삭제</a>
								</div>
							</td>
						</tr>
					<%
							}
						}else {
						
					%>
						<tr>
							<td colspan="14">
								<p><i class="fa fa-search" style="font-size: 50px; vertical-align: middle !important;"></i></p>
								<p style="font-weight: bold; vertical-align: middle !important;">관심 상품 내역이 없습니다.</p>
							</td>
						</tr>
					<%
						}
					%>
					<!-- 반복문 끝 -->
					</tbody>
				</table>
			</div>
		</div>
		<%
			if(!detailsRange.isEmpty()){
		%>
		<div class="row">
			<div class="col-12 text-right">
				<a href="" id="deletewish" class="btn btn-secondary btn" role="button" onclick="deleteAllConfirmByWish()">관심상품 비우기</a>
			</div>
		</div>
		<%
			}
		%>
		<div class="mb-5">
			<ul class="pagination justify-content-center">
		<%
			if (pageNo > 1) {
		%>
				<li class="page-item">
					<a class="page-link quickPage" href="wish_list.jsp?page=1">&laquo;</a>
				</li>
				<li class="page-item">
					<a class="page-link" href="wish_list.jsp?page=<%=pageNo - 1%>">&lt;</a>
				</li>
		<%
			}
		%>
		<%
			for (int num = beginPageNo; num<=endPageNo; num++) {
		%>
				<li class="page-item <%=pageNo == num ? "active" : ""%>"><a class="page-link" href="wish_list.jsp?page=<%=num%>"><%=num %></a></li>
		<%
			}
		%>
		<%
			if (pageNo < totalPages) {
		%>
				<li class="page-item">
					<a class="page-link" href="wish_list.jsp?page=<%=pageNo + 1%>">&gt;</a>
				</li>
				<li class="page-item">
					<a class="page-link quickPage" href="wish_list.jsp?page=<%=totalPages%>">&raquo;</a>
				</li>
		<%
			}
		%>
			</ul>
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>