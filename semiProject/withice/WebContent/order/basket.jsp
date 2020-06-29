<%@page import="com.withice.dto.WishListDetailDto"%>
<%@page import="com.withice.dao.WishListDao"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@page import="com.withice.dao.UserDao"%>
<%@page import="com.withice.vo.User"%>
<%@page import="com.withice.dto.CartDetailDto"%>
<%@page import="java.util.List"%>
<%@page import="com.withice.dao.CartDao"%>
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
				<a href="../home.jsp">Home</a> <span title="현재 위치"> > Cart</span>
			</div>
		</div>
		<%
			UserDao userDao = new UserDao();
			User user = userDao.getUserById(loginedUserId);
			if(user!=null){
		%>
		<div class="row">
			<div class="col-12">
				<p style="padding-top: 20px;">CART</p>
				<div class="row">
					<div class="col-12">
					<table class="table table-bordered table-active">
						<tr>
							<th class="text-center" rowspan="3" style="padding-top: 30px;">혜택정보</th>
							<td>
								<span style="font-weight: bold;">
									<%=user.getName() %>
								</span> 님은, [<%=user.getGrade() %>] 회원이십니다. 
							</td>
						</tr>
						<tr>
							<td>가용 적립금 : <span style="font-weight: bold;"><%=user.getUsableMileage() %>원</span></td>
						</tr>
					</table>
					</div>
				</div>
			</div>
		</div>
		<%
			}
		%>
		<%
		CartDao cartDao = new CartDao();
		List<CartDetailDto> details = cartDao.getCartDetail(loginedUserId);
		%>
		<div class="row">
			<div class="col-12">
				<p style="padding-top: 20px; font-weight: bold; font-size: 12px;">일반상품 (<%=details.size() %>)</p>
			</div>
		</div>
		<form method="post" action="orderform.jsp" id="cart">
			<div class="row">
				<div class="col-12">
					<table class="table text-center">
						<thead>
							<tr>
								<th>
									<div class="form-check-inline">
		  								<label class="form-check-label">
		    								<input type="checkbox" class="form-check-input" id="header-checkbox" onchange="toggleAllCheckboxes(event)">
		  								</label>
									</div>
								</th>
								<th>이미지</th>
								<th colspan="5">상품정보</th>
								<th>판매가</th>
								<th>수량</th>
								<th>적립금</th>
								<th>배송구분</th>
								<th>배송비</th>
								<th>합계</th>
								<th colspan="2">선택</th>
							</tr>
						</thead>
						<tbody>
					<%
						if(!details.isEmpty()){
							
							for(CartDetailDto detail : details){
							
					%>
						<!-- 반복문 시작 -->
							<tr id="row-<%=detail.getCartNo()%>">
								<td style="vertical-align: middle !important;">
									<div class="form-check-inline">
										<label class="form-check-label">
	   										<input type="checkbox" class="form-check-input" id="product-checkbox-<%=detail.getCartNo() %>" name="no" value="<%=detail.getCartNo() %>" onchange="toggleChecked()">
											<input type="hidden" name="product_no" value="<%=detail.getProductNo() %>" />
											<input type="hidden" name="product_amount" value="<%=detail.getProductAmount() %>" />
										</label>
									</div>
								</td>
								<td style="vertical-align: middle !important;">
									<a href="/withice/product/addrecentlyview.jsp?cateno=<%=detail.getCateNo() %>&productno=<%=detail.getProductNo()%>"><img src="../images/product-images/<%=detail.getProductThumbnail() %>" alt="" width="80" height="80" />
									</a>
								</td>
								<td style="vertical-align: middle !important;" colspan="5">
									<a style="text-decoration: none;" href="/withice/product/addrecentlyview.jsp?cateno=<%=detail.getCateNo() %>&productno=<%=detail.getProductNo()%>"><%=detail.getProductName() %></a>
								</td>
								<td style="vertical-align: middle !important; font-weight: bold;"><%=NumberUtil.numberWithComma(detail.getProductPrice())%>원</td>
								<td style="vertical-align: middle !important;"><%=detail.getProductAmount() %></td>
								<td style="vertical-align: middle !important;">-</td>
								<td style="vertical-align: middle !important;">기본배송</td>
								<td style="vertical-align: middle !important;">무료</td>
								<td style="vertical-align: middle !important; font-weight: bold;"><%=NumberUtil.numberWithComma(detail.getProductPrice() * detail.getProductAmount())%>원</td>
								<td style="vertical-align: middle !important;" colspan="2">
									<div class="btn-group-vertical">
									  <a href="/withice/order/orderform.jsp?product_no=<%=detail.getProductNo() %>&product_amount=<%=detail.getProductAmount() %>" 
									  	 class="btn btn-secondary btn-sm" role="button">주문하기</a>
									  <a href="/withice/order/addwish.jsp?cateno=<%=detail.getCateNo() %>&productno=<%=detail.getProductNo() %>" class="btn btn-outline-secondary btn-sm" role="button">관심상품등록</a>
									  <a href="/withice/order/deletecart.jsp?product_no=<%=detail.getProductNo() %>" class="btn btn-outline-secondary btn-sm" role="button">삭제</a>
									</div>
								</td>
							</tr>
					<%
							}
						} else {
							
					
					%>
						<tr>
							<td colspan="15">
								<p><i class="fa fa-search" style="font-size: 50px;"></i></p>
								<p style="font-weight: bold;">장바구니가 비어 있습니다.</p>
							</td>
						</tr>
						<!-- 반복문 끝 -->
					<% 
						}  
					%>		
						</tbody>
					</table>
				</div>
			</div>
		</form>
		<%
			if(!details.isEmpty()){
				
		%>
		<div class="row">
			<div class="col-3">
				<span style="font-size: 12px;">[기본배송]</span>
			</div>
			<div class="col-9 text-right">
			<!-- 반복문 시작 -->
			<%
				int totalPrice = 0;
				for(CartDetailDto detail : details){
					totalPrice+=(detail.getProductPrice()*detail.getProductAmount());
				}
			%>
				<span style="font-size: 12px;">
					상품구매금액 <span style="font-weight: bold;"><%=NumberUtil.numberWithComma(totalPrice) %></span> 
					+ 배송비 무료 = 합계 : <span style="font-weight: bold; font-size:16px; margin-left: 8px;"><%=NumberUtil.numberWithComma(totalPrice)%>원</span>
				</span>
			<!-- 반복문 끝 -->
			</div>
		</div>
		<div class="row">
			<div class="col-6">
				<button class="btn btn-secondary btn-sm" onclick="selectDelete()">삭제하기</button>
			</div>
			<div class="col-6 text-right">
				<a href="" id="deletecart" class="btn btn-outline-secondary btn-sm" role="button" onclick="deleteAllConfirmByCart()">장바구니 비우기</a>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<table class="table text-center">
					<thead>
						<tr>
							<th>총 상품금액</th>
							<th>총 배송비</th>
							<th>결제예정금액</th>
						</tr>
					</thead>
					<tbody>
					<!-- 반복문 시작 -->
						<tr style="font-size: 14px; font-weight: bold;">
							<td><%=NumberUtil.numberWithComma(totalPrice) %>원</td>
							<td>무료</td>
							<td>=<%=NumberUtil.numberWithComma(totalPrice) %>원</td>
						</tr>
					<!-- 반복문 끝 -->
					</tbody>
				</table>
			</div>
		</div>
		<%
			}
		%>
		<div class="row">
			<div class="col-7 text-right">
				<button class="btn btn-dark btn-lg" onclick="orderAll()"><small>전체상품주문</small></button>
				<button class="btn btn-secondary btn-lg" onclick="selectOrder()"><small>선택상품주문</small></button>			
			</div>
			<div class="col-5 text-right">
				<a href="/withice/home.jsp" class="btn btn-outline-secondary btn-lg" role="button"><small>쇼핑계속하기</small></a>
			</div>
		</div>
		 <%
		 	WishListDao wishListDao = new WishListDao();
		 	List<WishListDetailDto> wishDetails = wishListDao.getWishListDetail(loginedUserId);
		 	if(!wishDetails.isEmpty()){
		 		
		 %>
		 <div class="row">
			<div class="col-12">
			<!-- wishList에 있는 상품번호로 상품정보 찾기 -->
				<p style="padding-top: 20px; font-weight: bold; font-size: 12px;">관심상품 (<%=wishDetails.size() %>)</p>
			</div>
			<div class="row">
				<div class="col-12">
					<table class="table text-center" style="width: 1125px;">
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
						<!-- 반복문 시작 -->
						<%
				 		for(WishListDetailDto wishDetail : wishDetails){
				 			
						%>
							<tr>
								<td style="vertical-align: middle !important;">
									<a href="/withice/product/addrecentlyview.jsp?cateno=<%=wishDetail.getCateNo() %>&productno=<%=wishDetail.getProductNo()%>">
										<img src="../images/product-images/<%=wishDetail.getProductThumbnail() %>" alt="" width="80" height="80" />
									</a>
								</td>
								<td colspan="5" style="vertical-align: middle !important;">
									<a style="text-decoration: none;" href="/withice/product/addrecentlyview.jsp?cateno=<%=wishDetail.getCateNo() %>&productno=<%=wishDetail.getProductNo()%>"><%=wishDetail.getProductName() %></a>
								</td>
								<td style="vertical-align: middle !important;"><%=NumberUtil.numberWithComma(wishDetail.getProductPrice()) %></td>
								<td style="vertical-align: middle !important;">-</td>
								<td style="vertical-align: middle !important;">기본배송</td>
								<td style="vertical-align: middle !important;">무료</td>
								<td style="vertical-align: middle !important;"><%=NumberUtil.numberWithComma(wishDetail.getProductPrice()) %></td>
								<td colspan="2" style="vertical-align: middle !important;">
									<div class="btn-group-vertical">
									  <a href="/withice/order/addcart.jsp?product_no=<%=wishDetail.getProductNo() %>" class="btn btn-secondary btn-sm" role="button">장바구니담기</a>
									  <a href="/withice/order/deletewish.jsp?product_no=<%=wishDetail.getProductNo() %>" class="btn btn-outline-secondary btn-sm" role="button">삭제</a>
									 
									</div>
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
		</div>
		<%
		 	}
		%>
		<div class="row">
			<div class="col-12">
				<div class="list-group">
					<div class="list-group-item list-group-item-action">
						<p>이용안내</p>
						<p style="font-weight: bold;">장바구니 이용안내</p>
						<h6><span class="badge badge-secondary">1</span>선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경]버튼을 누르시면 됩니다.</h6>
						<h6><span class="badge badge-secondary">2</span>[쇼핑계속하기]버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.</h6>
						<h6><span class="badge badge-secondary">3</span>장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나</h6>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>