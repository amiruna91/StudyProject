<%@page import="com.withice.vo.Review"%>
<%@page import="com.withice.dao.ReviewDao"%>
<%@page import="com.withice.dto.ProductInfo"%>
<%@page import="com.withice.vo.Pagenation"%>
<%@page import="com.withice.vo.ProductTag"%>
<%@page import="com.withice.vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.withice.dao.ProductDao"%>
<%@page import="com.withice.dto.CategoryAndCnt"%>
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
  <script src="/withice/js/zoom.js"></script>
  <style type="text/css">
  	.breadcrumb {
  		background-color: white;
  		padding: 5px;
  		font-size: 10px;
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
	
	.board-b-line {
		border-bottom: 1px solid lightgray;
	}
	.board-t-line {
		border-top: 1px solid lightgray;
	}
	.table {
		padding: 0;
	}
	th, td {
		font-size: 13px;
	}
	
	.inputnumber {
		width: 40%;
		border: 1px solid lightgray;
		
	}
	input[type=number]::-webkit-inner-spin-button {
	 	opacity: 1;
	}
	
	.fontsize {
		font-size: 11px;
		color: gray;
		letter-spacing: 1px;
	}

	.myBtn {
	    width: 100%;
	    height: 51px;
	    line-height: 54px;
	    border: 2px solid #222;
	    background: #fff;
	    color: #111;
	    font-size: 12px;
	    font-weight: 500;
	    letter-spacing: 4px;
	}
	
	.myBtn:hover {
		background-color: #222;
		color: #fff;
	}
	
	.myABtn {
	    width: 50%;
	    height: 46px;
	    line-height: 37px;
	    border: 1px solid #ddd;	   
	    background: #fff;
	    color: #111;
	    font-size: 11px;
	    font-weight: 400;
	    letter-spacing: 1px;
	}
	
	.myABtn:hover {
		background: #f2f2f2;
	}
	
	.myPtag {
	 	padding: 8px 0 8px 13px;
	    border: 1px solid #ddd;
	    background: #f2f2f2;
	    font-size: 11px;
	    font-weight: 500;
	    letter-spacing: -1px;
	    color: #333;
	    margin-bottom: 0;
	}
	
	.atag {
		color: black;
		letter-spacing: 2px;
	}
	
	.atag:hover{
		color: darkgray;
		text-decoration: none;
	}
	
	.btn-dark:hover {
		color: black;
		background-color: #fff;
	}
	.btn-outline-dark:hover {
		background-color: #f2f2f2;
		color: black;
	}
	
	.atag-font {
		font-size: 11px;
		padding: 6px 9px 7px 10px;
		border-radius: 9px;
	}
	
	.img-zoom-container {
  		position: relative;
	}

	.img-zoom-lens {
		  position: absolute;
		  border: 1px solid #d4d4d4;
		  /*set the size of the lens:*/
		  width: 150px;
		  height: 150px;
		  background-color: #fff;
		  opacity: 0.2;
		  

	}
	
	.img-zoom-result {
		  position: absolute;
		  border: 1px solid #d4d4d4;
		  /*set the size of the result div:*/
		  width: 270px;
		  height: 270px;
		  z-index: 80;
		  top: 30px;
		  right: -280px;
		  
	}
	
	* {box-sizing: border-box;}
  </style>
</head>
<body>
<%@ include file="../common/navbar.jsp"%>
<div class="container">
	<!-- 현재위치 -->
	<div class="row">
		<div class="col-12">
			<ul class="breadcrumb float-right">
				<li class="breadcrumb-item"><a href="../home.jsp">Home</a></li>
			<%  
				int cateNo = NumberUtil.stringToInt(request.getParameter("cateno"));
				Category category = categoryDao.getCategoryWithMain(cateNo);
			%>					
				<li class="breadcrumb-item"><a href="productList.jsp?cateno=<%=category.getMainCateNo() %>" style="color: black;"><%=category.getMainCateName() %></a></li>
			</ul>
		</div>
	</div>
	<!-- 현재위치 -->
	<!-- 상품 상세정보 시작 -->
	<!-- 상품 간략 정보 -->
	<%
		int productNo = NumberUtil.stringToInt(request.getParameter("productno"));
		ProductDao productDao = new ProductDao();
		Product product = productDao.getProductByNo(productNo);
		List<ProductTag> productTags = productDao.getProductTagsByNo(productNo);
	%>
	<div class="row mt-5 ">
		<div class="col-7 mb-5">
			<div class="img-zoom-container float-left">
				<img id="myimage" width="600px" height="600px" src="../images/product-images/<%=product.getThumbnail()%>"/>
				<div id="myresult" class="img-zoom-result "></div>
			</div>
		</div>
		<div class="col-4 ml-5">
			<div class="board-b-line">
				<div class="mr-2" style="font-size: 15px; font-weight: 500;"><%=product.getName() %></div>
				<div class="mb-2">
				<%
					for (ProductTag proTag : productTags) {
				%>
					<span><img src="/withice/images/tag/<%=proTag.getTagThumbnail()%>"/></span>
				<%
					}
				%>
				</div>
			</div>
			<div>
				<form method="post" action="../order/orderform.jsp">
					<input type="hidden" name="product_no" value="<%=productNo%>">
					<table class="table table-borderless ">
						<colgroup>
							<col width="50%">
							<col width="50%">
						</colgroup>
						<tbody>
							<tr class="board-b-line">
								<th>판매가</th>
								<td><%=NumberUtil.numberWithComma(product.getPrice()) %></td>
							</tr>
							<tr class="board-b-line">
								<th>수량</th>
								<td><input class="inputnumber" type="number"  min="0" max="10" name="product_amount" value="1"/></td>
							</tr>
						</tbody>
					</table>
					<div class="fontsize mt-2">
						<p>최소주문수량 1개 이상 </p>
						<p style="font-weight: bold">총 상품금액 <span id="total-price"><%=NumberUtil.numberWithComma(product.getPrice()) %>원 (1개)</span></p>
					</div>
					<div>
						<button class="myBtn btn-block mt-5" type="submit">BUY NOW</button>
					</div>
				</form>
				<div class="mt-2 d-flex flex-row ">
					<a class="btn myABtn" href="/withice/order/addonlycart.jsp?product_no=<%=product.getNo()%>&product_amount=1">ADD TO CART</a>
					<a class="btn myABtn" href="/withice/order/addonlywish.jsp?cateno=<%=product.getCateNo()%>&productno=<%=product.getNo()%>">WITH LIST</a>
				</div>
			<%
				if ("Y".equals(loginedYN)) {
			%>
				<div class="mt-4">
					<p class="myPtag">저희 쇼핑몰을 이용해 주셔서 감사합니다.</p>
					<p class="myPtag"><%=loginedUserName %> 님은 [기부천사] 회원이십니다.</p>
				</div>
			<%
				}
			%>
			</div>
			<%
				ReviewDao reviewDao = new ReviewDao();
				List<Review> reviews = reviewDao.getReviewByProductNo(productNo);
			%>
			<div class="fontsize mt-4 float-right">
				<a class="atag" href="#detail-review">REVIEW [<%=reviews.size() %>]</a>
			</div>
		</div>
	</div>
	<!-- 상품 간략정보 끝 -->
	<div class="row mt-5 board-t-line" >
		<div class="col-12 d-flex justify-content-center mt-3">
			<h6>DETAIL INFO</h6>
		</div>
	</div>
	<!-- 상품 상세정보 이미지 -->
	<%
		List<ProductInfo> productInfos = productDao.getProductInfo(productNo);
	%>
	<div class="row mb-5">
	<%
		for (ProductInfo pro : productInfos) {
	%>
		<div class="col-12 d-flex justify-content-center mt-4">
			<img width="80%" src="/withice/images/productInfo-images/<%=pro.getImagePath() %>" />
		</div>
	<%
		}
	%>
	</div>
	<!-- 상품 상세정보 끝 -->
	<div id="detail-review" class="row mt-5 board-t-line d-flex justify-content-center " >
		<div class="col-12 d-flex justify-content-center  mt-3">
			<h6>REVIEW</h6>
		</div>
		<div class="fontsize mt-1">
			<p>상품의 사용후기를 적어주세요.</p>
		</div>
		<div class="col-12 mb-5">
			<table class="table">
			<colgroup>
				<col width="10%">
				<col width="*">
				<col width="10%">
				<col width="10%">				
			</colgroup>
				<thead>
					<tr>
						<th>NO.</th>
						<th>SUBJECT</th>
						<th>NAME</th>
						<th>DATE</th>
					</tr>
				</thead>
				<tbody>
				<%
					for (Review review : reviews) {
				%>
					<tr>
						<td><%=review.getReviewNo() %></td>
						<td><a class="atag" href="../board/review/detail.jsp?reviewno=<%=review.getReviewNo()%>"><%=review.getTitle() %></a></td>
						<td><%=review.getUserId() %></td>
						<td><%=review.getRegisteredDate() %></td>
					</tr>
				<%
					}
				%>
				</tbody>
			</table>
			<div class="float-right ">
				<a class="atag-font btn btn-sm btn-outline-dark" href="../board/review/list.jsp">모두보기</a>
			</div>
		</div>
	</div>
	
</div>
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">

function numberWithCommas(x) {
    return x.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
}

$(function() {
	$("input[name=product_amount]").change(function() {
		var priceStr = $("tbody > tr:eq(0) > td").text();
		var price = parseInt(priceStr.replace(",",""));
		var amount = parseInt($(this).val());
		var totalprice = numberWithCommas(price*amount);
		
		if (amount < 1) {
			alert("최소 주문수량은 1개 입니다.")
			$(this).val(1);
			$("#total-price").text(numberWithCommas(price)+"원 ("+ 1 +"개)");
			return;
		} 	
		$("#total-price").text(numberWithCommas(price*amount)+"원 ("+ amount +"개)");
		
	})
	
	$(".img-zoom-container").mouseover(function() {
		$("#myresult").css('display','block');
		$(".img-zoom-lens").css('display','block');
	
	})
	$(".img-zoom-container").mouseout(function() {
		$("#myresult").css('display', 'none');
		$(".img-zoom-lens").css('display', 'none');
		
	})
})
	
imageZoom("myimage", "myresult");


</script>
</body>
</html>