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
	
	.product-list-menu li {
		border: none;
		font-size: 11px;
		padding: 0;
		font-weight: 100;
	}
	.product-list-menu li a {
		color: black;
	}
	.product-list-menu li a:hover {
		font-weight: 500;
		text-decoration: none;
	}
	
	.card, .card-header, .card-body, .card-footer {
		background-color: white;
		border: none;
		font-size: 11px;
		text-align: left;
		padding: 0;
		font-weight: 500;
	}
	
	.card-header {
		border-bottom: 1px solid #e8e8e8;
		margin-top: 14px;
		padding-bottom: 5px;
	}
	.card-body p {
		margin-top: 6px;
		margin-bottom: 3px;
	}
	.card-footer {
		margin-top: 6px;
		margin-bottom:5px;
	}
	.card-status {
		margin-top: 6px;
		margin-bottom:40px;
	}
	.card-status i {
		padding-right: 5px;
		font-size: 17px;
	}
	.card-status a {
		color: darkgray;
	}
	.card-status a:hover {
		color: lightgray;
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
	
	.quickPage {
		font-size: 13px; 
		padding: 7px 12px;
	}	
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
				int mainNo = cateNo;
				Category category = categoryDao.getCategoryWithMain(cateNo);
				
				if (category.getMainCateNo() != 0) {
					mainNo = category.getMainCateNo();
			%>					
				<li class="breadcrumb-item"><a href="productList.jsp?cateno=<%=category.getMainCateNo() %>"><%=category.getMainCateName() %></a></li>
			<%
				}
			%>
				<li class="breadcrumb-item"><a style="color: black;"><%=category.getName() %></a></li>
			</ul>
		</div>
	</div>
	<!-- 현재위치 -->
	
	<!-- body top 시작 -->
	<%
		List<CategoryAndCnt> subCategorys = categoryDao.getCategoryAndCntByNo(mainNo);
		int totalCnt = 0;
	%>
	<div style="font-size: 15px"><%=category.getName() %></div>
	<div class="product-list-menu m-3">
		<ul class="list-group list-group-horizontal">
		<%
			for (CategoryAndCnt cate : subCategorys) {
				if (category.getMainCateNo() == 0) {
					totalCnt += cate.getCount();					
				} else if (cateNo == cate.getNo()) {
					totalCnt = cate.getCount();
				}
		%>
		  <li class="list-group-item mr-3 "><a href="productList.jsp?cateno=<%=cate.getNo() %>"><%=cate.getName() %> <span style="color: gray;">(<%=cate.getCount() %>)</span></a></li>
		<%
			}
		%>
		</ul>
	</div>
	<!-- body top 끝 -->
	<!-- body main 시작 -->
	<div class="mt-5">
		<div class="d-flex justify-content-between">
			<div>
				<span class="font-weight-bold small"><%=totalCnt%></span>
				<span style="color: gray; font-size: 10px;"> IN THIS CATEGORY</span>
			</div>
			<div class="product-list-menu">
				<ul class="list-group list-group-horizontal">
				  <li class="list-group-item mr-4 font-weight-nomal"><a href="">NEW</a></li>
				  <li class="list-group-item mr-4 font-weight-nomal"><a href="">NAME</a></li>
				  <li class="list-group-item mr-4 font-weight-nomal"><a href="">LOW PRICE</a></li>
				  <li class="list-group-item mr-4 font-weight-nomal"><a href="">HIGH PRICE</a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- body main 끝 -->
	<%
		ProductDao productDao = new ProductDao();
		List<Product> products = new ArrayList<Product>();
		int pageNo = NumberUtil.stringToInt(request.getParameter("pageno"), 1);
		
		// 페이지 객체 생성
		Pagenation pagenation = new Pagenation(totalCnt, 12, 5, pageNo);
		
		if (category.getMainCateNo() != 0) {
			products = productDao.getProductByCategory(cateNo, pagenation.getBeginIndex(), pagenation.getEndIndex());
		} else {
			products = productDao.getProductByMainCategory(cateNo, pagenation.getBeginIndex(), pagenation.getEndIndex());
		}
	%>
	<!-- 상품 리스트 시작 -->
		<div class="row mt-5">
	<%
			for (Product pro : products) {
	%>
			<div class="col-3 mb-1">
				<div class="card">
					<a href="addrecentlyview.jsp?cateno=<%=pro.getCateNo()%>&productno=<%=pro.getNo()%>"><img class="img-thumnail" width="100%" src="/withice/images/product-images/<%=pro.getThumbnail()%>"></a>
					<div class="card-header"><%=pro.getName() %></div>
					<div class="card-body">
					<%
						if (pro.getComment() != null) {
					%>
						<p style="color: gray;"><%=pro.getComment() %><p>
					<%
						}
					%>
						<p><%=pro.getPrice()%></p>
					</div>
					<div class="card-footer">
					<%
						List<ProductTag> tags = productDao.getProductTagsByNo(pro.getNo());
						for (ProductTag tag : tags) {
					%>
						<span><img src="/withice/images/tag/<%=tag.getTagThumbnail()%>"/></span>
					<%
						}
					%>
					</div>
					<div class="card-status">
						<span><a href="/withice/order/addonlycart.jsp?product_no=<%=pro.getNo()%>&product_amount=1"><i class="fa fa-cart-plus"></i></a></span>
						<span><a href="/withice/order/addonlywish.jsp?cateno=<%=pro.getCateNo() %>&productno=<%=pro.getNo()%>"><i class="fa fa-heart-o"></i></a></span>
						<span><a href="productDetail.jsp?cateno=<%=pro.getCateNo() %>&productno=<%=pro.getNo()%>"><i class="fa fa-external-link"></i></a></span>
					</div>
				</div>
			</div>
		<%
			}
		%>
		</div>
		<!-- 상품리스트 끝 -->
		<!-- 페이지 처리 시작 -->
		<%
		%>
		<div >
			<ul class="pagination justify-content-center">
		<%
			if (pagenation.getPageNo() > 1) {
		%>
				<li class="page-item">
					<a class="page-link quickPage" href="productList.jsp?cateno=<%=cateNo%>&pageno=1"><i class="fa fa-angle-double-left"></i></a>
				</li>
				<li class="page-item">
					<a class="page-link" href="productList.jsp?cateno=<%=cateNo%>&pageno=<%=pagenation.getPageNo() - 1%>">&lt;</a>
				</li>
		<%
			}
		%>
		<%
			for (int i = pagenation.getBeginPageIndex(); i <= pagenation.getEndPageIndex(); i++) {
		%>
				<li class="page-item <%=i == pageNo ? "active" : ""%>"><a class="page-link" href="productList.jsp?cateno=<%=cateNo%>&pageno=<%=i%>"><%=i %></a></li>
		<%
			}
		%>
		<%
			if (pagenation.getPageNo() < pagenation.getTotalpage()) {
		%>
				<li class="page-item">
					<a class="page-link" href="productList.jsp?cateno=<%=cateNo%>&pageno=<%=pagenation.getPageNo() + 1%>">&gt;</a>
				</li>
				<li class="page-item">
					<a class="page-link quickPage" href="productList.jsp?cateno=<%=cateNo%>&pageno=<%=pagenation.getTotalpage()%>"><i class="fa fa-angle-double-right"></i></a>
				</li>
		<%
			}
		%>
			</ul>
		</div>
		<!-- 페이지 처리 끝 -->
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>