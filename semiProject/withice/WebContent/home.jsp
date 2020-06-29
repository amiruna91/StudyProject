<%@page import="com.withice.vo.ManagerBoard"%>
<%@page import="com.withice.dao.ManagerBoardDao"%>
<%@page import="com.withice.vo.ProductTag"%>
<%@page import="com.withice.vo.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.withice.dao.ProductDao"%>
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
  <link rel="stylesheet" href="css/swiper.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <script src="js/swiper.min.js"></script>
  <script src="/withice/js/navi.js"></script>
  <style type="text/css">
  	
	#demo img {
		height: 65%;
		width: 90%;
		margin-left: auto;
		position: relative;
		left: 5%;
	}
	
	#home-image-1 img {
		width: 100%;
		height: 100%;
	}
	
	#home-notice-head a {
		color: black;
		font-weight: bold;
		text-decoration: none;
	}
	
	#home-notice-head a:hover {
		color: gray;
	}
	
	#home-notice-body {
		border: 1px solid lightgray;
	}
	#home-notice-body p {
		font-size: 11px;
		margin: 8px 5px;
	
	}
	
	 .swiper-container {
      width: 100%;
      height: 100%;
      margin-left: auto;
      margin-right: auto;
    }
    .swiper-slide {
      text-align: center;
      background: #fff;
      height: calc((100% - 30px) / 2);
      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
    :root {
    --swiper-theme-color: #343a40;
	}
	
	.hometitle{
		margin: 150px 0 30px;
    	text-align: center;
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
	
	.atag {
		color: black;
	}
	
	.atag:hover{
		color: #a6a6a6;
		text-decoration: none;
	}
  </style>
</head>
<body>
<div>
	<%@ include file="common/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<!-- 슬라이드 사진 시작 -->
				<div id="demo" class="carousel slide" data-ride="carousel" style="width: 100%;">
				  <!-- Indicators -->
				  <ul class="carousel-indicators">
				    <li data-target="#demo" data-slide-to="0" class="active"></li>
				    <li data-target="#demo" data-slide-to="1"></li>
				    <li data-target="#demo" data-slide-to="2"></li>
				    <li data-target="#demo" data-slide-to="3"></li>
				    <li data-target="#demo" data-slide-to="4"></li>
				    <li data-target="#demo" data-slide-to="5"></li>
				  </ul>
				  
				  <!-- The slideshow -->
				  <div class="carousel-inner ">
				    <div class="carousel-item active">
				      <img src="images/homeimages/homeslide1.jpg" alt="Los Angeles" width="1650" height="624">
				    </div>
				    <div class="carousel-item">
				      <img src="images/homeimages/homeslide2.jpg" alt="Chicago" width="1650" height="624">
				    </div>
				    <div class="carousel-item">
				      <img src="images/homeimages/homeslide3.jpg" alt="New York" width="1650" height="624">
				    </div>
				    <div class="carousel-item">
				      <img src="images/homeimages/homeslide4.jpg" alt="New York" width="1650" height="624">
				    </div>
				    <div class="carousel-item">
				      <img src="images/homeimages/homeslide5.jpg" alt="New York" width="1650" height="624">
				    </div>
				    <div class="carousel-item">
				      <img src="images/homeimages/homeslide6.jpg" alt="New York" width="1650" height="624">
				    </div>
				  </div>
				  
				  <!-- Left and right controls -->
				  <a class="carousel-control-prev" href="#demo" data-slide="prev">
				    <span class="carousel-control-prev-icon"></span>
				  </a>
				  <a class="carousel-control-next" href="#demo" data-slide="next">
				    <span class="carousel-control-next-icon"></span>
				  </a>
				</div>
				<!-- 슬라이드 사진 끝 -->
			</div>
		</div>
	</div>	
	<div class="container">
		<!-- 홈화면 공지상항 시작  -->
		<div class="row mt-4" id="home-image-1">
			<div class="col-3"><img src="images/homeimages/home1-1.jpg" alt="New York" width="306" height="165"></div>
			<div class="col-3"><img src="images/homeimages/home1-2.jpg" alt="New York" width="306" height="165"></div>
			<div class="col-3"><img src="images/homeimages/home1-3.jpg" alt="New York" width="306" height="165"></div>
			<div class="col-3">
				<div id="home-notice-head" class="d-flex justify-content-between mb-2">
					<a href="board/manager/noticelist.jsp" style="font-size: 11px;">NOTICE</a>
					<a href="board/manager/noticelist.jsp"" style="font-size: 10px;">+more</a>
				</div>
				<%
					ManagerBoardDao boardDao = new ManagerBoardDao();
					List<ManagerBoard> managerBoards = boardDao.getNotices(1, 5);
				%>
				<div id="home-notice-body" class="pl-2 pb-1">
				<%
					for (ManagerBoard board : managerBoards) {
				%>
					<p><a class="atag" href="board/manager/noticeDetail.jsp?noticeno=<%=board.getNo()%>"><%=board.getTitle() %></a></p>
				<%
					}
				%>
				</div>
			</div>
		</div>
		<!-- 홈화면 공지상항 끝  -->
		
		<!-- 최신상품 -->
		<div class="row hometitle">
			<div class="col-12">
				<h5>NEW ARRIVAL ITEM</h5>
			</div>
		</div>
		
		<%
			ProductDao productDao = new ProductDao();
			List<Product> products = productDao.getNewProductByDate();
		%>
		<!-- 최신 상품 슬라이드 시작 -->
		<div class="row">
			<div class="col-12">
				<div class="swiper-container">
			    <div class="swiper-wrapper" style="height: 565px">
			    <%
			    	for (Product product : products) {
			    %>
			      <div class="swiper-slide">
			      	<a href="product/addrecentlyview.jsp?cateno=<%=product.getCateNo()%>&productno=<%=product.getNo()%>">
				      	<img src="images/product-images/<%=product.getThumbnail() %>" alt="<%=product.getName() %>" class="img-thumbnail" width="260px" height="260px"/>
			      	</a>
			      </div>
			    <%
			    	}
			    %>
			    </div>
			    <!-- Add Pagination -->
			    <div class="swiper-pagination"></div>
			  </div>
			</div>
		</div>
		<!-- 최신 상품 슬라이드 끝 -->
		<!-- 최신상품 끝 -->
		
		<%
			List<Product> bestpros = productDao.getBestProduct();
		%>
		<!-- 주간 베스트 -->
		<div class="row hometitle">
			<div class="col-12">
				<h5>WEEKLY BEST</h5>
			</div>
		</div>
		<div class="row">
		<%
			for (Product pro : bestpros) {
		%>
			<div class="col-3 mb-1">
				<div class="card">
					<a href="product/addrecentlyview.jsp?cateno=<%=pro.getCateNo() %>&productno=<%=pro.getNo()%>">
						<img class="img-thumnail" width="100%" src="/withice/images/product-images/<%=pro.getThumbnail()%>">
					</a>
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
						<span><a href="/withice/product/productDetail.jsp?cateno=<%=pro.getCateNo() %>&productno=<%=pro.getNo()%>"><i class="fa fa-external-link"></i></a></span>
					</div>
				</div>
			</div>
		<%
			}
		%>
		</div>
		<!-- 주간베스트 끝 -->
		
		<div style="margin-top: 80px;">
			<div class="col-12 d-flex justify-content-center" style="margin-bottom: 80px;">
				<img src="/withice/images/homeimages/homefooter.jpg"/>
			</div>
		</div>
	</div>
	<%@ include file="common/footer.jsp" %>
</div>
 <script>
    var swiper = new Swiper('.swiper-container', {
      slidesPerView: 4,
      slidesPerColumn: 2,
      spaceBetween: 10,
      autoplay: {
          delay: 2500,
          disableOnInteraction: false,
        },
      pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
      navigation: {
          nextEl: '.swiper-button-next',
          prevEl: '.swiper-button-prev',
        }
    });
  </script>
</body>
</html>