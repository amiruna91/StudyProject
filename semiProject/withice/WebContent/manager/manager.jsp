<%@page import="com.withice.vo.ManagerBoard"%>
<%@page import="com.withice.dao.ManagerBoardDao"%>
<%@page import="com.withice.vo.Question"%>
<%@page import="com.withice.dao.QuestionDao"%>
<%@page import="com.withice.dto.OrderWithUserName"%>
<%@page import="com.withice.dao.OrderDao"%>
<%@page import="com.withice.vo.Category"%>
<%@page import="com.withice.dao.CategoryDao"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@page import="com.withice.vo.Pagenation"%>
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
  <link rel="icon" href="data:;base64,iVBORw0KGgo=">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="../css/sb-admin-2.min.css" rel="stylesheet">
  <link rel="stylesheet" href="/withice/css/naviAndFooter.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <script src="/withice/js/navi.js"></script>
  <style>
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
	
	.row {
		margin-top: 10px;
	}
	
	.modal-body span{
		width: 80px;
	}
	
	.atag {
		color: black;
	}
	
	.atag:hover{
		color: #a6a6a6;
		text-decoration: none;
	}
	#manager-product-detail-table input[type=text], #manager-product-detail-table input[type=number] {
		border: 0;
		width: 100%;
	}
	
	.font-size-20 {
		font-size: 20px;
	}
	.font-size-50 {
		font-size: 50px;
	}
	
	.divbox {
		padding: 5px;
		border: 1px solid black;
	}
	
	th {
		font-weight: 800;
		background-color: #f8f9fc;
	}
  </style>
</head>
<body>
<%@ include file="../common/navbar.jsp" %>
<%
	OrderDao orderDao = new OrderDao();
	int orderStatus = orderDao.getOrderByStatusN();
%>
<div class="container">
	 <div class="row">
		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-primary shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
	                    	<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Today's sales</div>
	                     	<div class="h5 mb-0 font-weight-bold text-gray-800">10,000,000 원</div>
                   		</div>
                   		<div class="col-auto">
                      		<i class="fa fa-won fa-2x text-gray-300"></i>
                    	</div>
                  	</div>
				</div>
			</div>
		</div>

           <!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-success shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-success text-uppercase mb-1">EARNINGS (MONTHLY)</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">500,000,000 원</div>
						</div>
						<div class="col-auto">
							<i class="fa fa-line-chart fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-info shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-info text-uppercase mb-1">members</div>
							<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">3,000 명</div>
						</div>
						<div class="col-auto">
							<i class="fa fa-users fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

			<!-- Pending Requests Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-warning shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-warning text-uppercase mb-1">미처리 건수</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800" id="manager-order-cnt"><%=orderStatus %></div>
						</div>
						<div class="col-auto">
							<i class="fa fa-gift fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!--chart -->
	<div class="row">
		<!-- Area Chart -->
		<div class="col-xl-12 col-lg-12">
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<div class="chart-area">
						<canvas id="myAreaChart"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- chart 끝 -->
	<div class="row">
		<div class="col-6">
			<div class="d-flex justify-content-between bg-info text-white p-1">
				<h5 class="font-weight-bolder">상품목록</h5>
				<button type="button" class="btn btn-light btn-sm p-1" onclick="toggleProductList(1)"><i style="font-size: 20px;" class="fa fa-sort-down" id="btn-toggle-product-list"></i></button>
			</div>
  			<div id="product-list-box" class="collapse">
  				<select class="form-control" name="categoryNo" style="font-size: 12px;">
					<option value="0" selected="selected">전체</option>
				<%
					for (Category cate : mainCategories) {
				%>
					<option value="<%=cate.getNo() %>" ><%=cate.getName() %></option>
				<%
					}
				%>
				</select>
					<%
						ProductDao productDao = new ProductDao();
						int proPageNo = NumberUtil.stringToInt(request.getParameter("proPageNo"), 1);
						int totalProduct = productDao.getAllProductCnt();
						Pagenation pagenation = new Pagenation(totalProduct, 10, 5, proPageNo);
						List<Product> products = productDao.getAllProducts(pagenation.getBeginIndex(), pagenation.getEndIndex());
					%>
					<table class="table table-hover">
						<colgroup>
							<col width="10%">
							<col width="*">
							<col width="15%">
							<col width="30%">
						</colgroup>
						<thead class="thead-dark">
							<tr>
								<th>NO.</th>
								<th>NAME</th>
								<th>수량</th>
								<th>DATE</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<!-- 페이지 처리 시작 -->
				<%
				%>
				<div >
					<ul class="pagination justify-content-center" id="product-pagination">
				<%
					if (pagenation.getPageNo() > 1) {
				%>
						<li class="page-item">
							<a class="page-link" href="manager.jsp?proPageNo=<%=pagenation.getPageNo() - 1%>">&lt;</a>
						</li>
				<%
					}
				%>
				<%
					for (int i = pagenation.getBeginPageIndex(); i <= pagenation.getEndPageIndex(); i++) {
				%>
						<li class="page-item"><a class="page-link" href="" onclick="refreshProductList(<%=i %>, event)"><%=i %></a></li>
				<%
					}
				%>
				<%
					if (pagenation.getPageNo() < pagenation.getTotalpage()) {
				%>
						<li class="page-item">
							<a class="page-link" href="" onclick="nextPage()">&gt;</a>
						</li>
				<%
					}
				%>
					</ul>
				</div>
				<!-- 페이지 처리 끝 -->
				<div class="float-right ">
					<a class="atag-font btn btn-sm btn-outline-dark" data-toggle="modal" data-target="#add-product-model" >상품등록</a>
				</div>
			</div>
  		</div>
		<!-- 상품 등록 모델 -->
			<div class="modal fade" id="add-product-model">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
			        <!-- Modal Header -->
			        <div class="modal-header">
			          	<h4 class="modal-title">신규 상품등록</h4>
			          	<button type="button" class="close" data-dismiss="modal">&times;</button>
			       	</div>
			        
			        <!-- Modal body -->
			   		<form id="add-product-form" method="post" action="productRegister.jsp" enctype="multipart/form-data">
			        	<div class="modal-body">
			   				<select class="form-control mb-3" name="mainCate" onchange="changeCate()" style="font-size: 12px;">
								<option value="0" selected="selected">선택하세요</option>
							<%
								for (Category cate : mainCategories) {
							%>
								<option value="<%=cate.getNo() %>" ><%=cate.getName() %></option>
							<%
								}
							%>
							</select >
							<select class="form-control mb-3" name="subCategory" style="font-size: 12px;">
								<option value="0" selected="selected">선택하세요</option>
							</select>
							<div class="input-group mb-3 input-group-sm">
								<div class="input-group-prepend">
							       <span class="input-group-text">상품이름</span>
							    </div>
							    <input type="text" class="form-control" name="product-name">
							</div>
							<div class="input-group mb-3 input-group-sm">
								<div class="input-group-prepend">
							       <span class="input-group-text">가격</span>
							    </div>
							    <input type="number" class="form-control" name="product-price">
							</div>
							<div class="input-group mb-3 p-1 input-group-sm">
								<div class="input-group-prepend ">
							       <span class="input-group-text">수량</span>
							    </div>
							    <input type="number" class="form-control" name="prdouct-stock">
							</div>
							<div class="input-group mb-3 input-group-sm">
								<div class="input-group-prepend">
							       <span class="input-group-text text-center">코멘트</span>
							    </div>
							    <input type="text" class="form-control" name="product-comment">
							</div>
							<div class="input-group mb-3 input-group-sm">
								<div class="input-group-prepend">
							       <span class="input-group-text">썸네일</span>
							    </div>
							    <input type="file" class="form-control" name="product-thumbnail">
							</div>
							<div class="input-group mb-3 input-group-sm">
								<div class="input-group-prepend">
							       <span class="input-group-text">옵션</span>
							    </div>
							    <input type="text" class="form-control" name="product-option">
							</div>
			        	</div>
			        	<!-- Modal footer -->
				        <div class="modal-footer">
				          <button type="button" class="btn btn-dark" onclick="checkFieldValue()" >등록</button>
				          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				        </div>	
			   		</form>
				</div>
			</div>
		</div>
		<!-- 상품등록 모델 끝 -->
		
		<!-- 상품 디테일 정보  -->
		<div id="manager-product-detail">
			 <!-- The Modal -->
  			<div class="modal fade" id="manager-product-detail-table">
    			<div class="modal-dialog modal-xl modal-dialog-centered">
      				<div class="modal-content">
				        
				        <!-- Modal Header -->
				        <div class="modal-header">
				          	<h4 class="modal-title">상품 상세정보</h4>
				          	<button type="button" class="close" data-dismiss="modal">&times;</button>
				        </div>
        
				        <!-- Modal body -->
				        <form method="post" action="updateProduct.jsp">
					        <div class="modal-body">
					        	<table class="table">
					        		<tbody>
					        		</tbody>
					        	</table>
					        </div>
	        
					        <!-- Modal footer -->
					        <div class="modal-footer">
					        	<button type="submit" class="btn btn-dark" >수정</button>
					        	<a href="" class="btn btn-info" data-toggle="popover" title="상세정보 이미지 등록" onclick="updateProductInfo(event)">상세이미지등록</a>
					          	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					        </div>
				        </form>
			      	</div>
			    </div>
			</div>
		</div>
		<div id="PopoverContent" class="d-none">
			<form method="post" action="uploadProductInfo.jsp" enctype="multipart/form-data">
		        <div class="input-group">
		        	<input type="hidden" id="manager-upload-productNo" name="productNo">
		        	<input type="hidden" id="manager-upload-productName" name="productName">	        	
		            <input type="file" class="form-control" placeholder="Recipient's username"
		                   aria-label="Recipient's username with two button addons" aria-describedby="button-addon1" name="product-thumbnail">
		            <div class="input-group-append" id="button-addon1">
		                <button class="btn btn-outline-primary" type="submit" data-toggle="popover" data-placement="bottom"
		                        data-html="true" data-title="Search">
		                    <i class="fa fa-upload"></i>
		                </button>
		            </div>
		        </div>
			</form>
    	</div>
		<!-- 상품 디테일 정보 끝 -->
		
		<!--주문현황 테이블  -->
    	<div class="col-6">
			<div class="d-flex justify-content-between bg-info text-white p-1">
				<h5 class="font-weight-bolder">주문현황</h5>
				<button class="btn btn-light btn-sm p-1" type="button" onclick="toggleOrderList()"><i class="font-size-20 fa fa-sort-down" id="btn-toggle-order-list"></i></button>
			</div>
  			<div id="order-list-box" class="collapse">
  				<table class="table table-hover">
					<colgroup>
						<col width="15%">
						<col width="*">
						<col width="30%">
						<col width="20%">
					</colgroup>
					<thead class="thead-dark">
						<tr>
							<th>NO.</th>
							<th>수령인</th>
							<th>DATE</th>
							<th>배송처리</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
				
				<!-- order 디테일정보 -->
				<div class="modal fade" id="manager-order-detail-table">
	    			<div class="modal-dialog modal-xl modal-dialog-centered">
	      				<div class="modal-content">
					        
					        <!-- Modal Header -->
					        <div class="modal-header">
					          	<h4 class="modal-title">상품 상세정보</h4>
					          	<button type="button" class="close" data-dismiss="modal">&times;</button>
					        </div>
	        
					        <!-- Modal body -->
			
					        <div class="modal-body">
					        	<table class="table" id="manager-order-detail-table">
					        		<thead>
					        		</thead>
					        		<tbody>
					        		</tbody>
					        	</table>
					        </div>
					        <!-- Modal footer -->
					        <div class="modal-footer">
					          	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					        </div>
				      	</div>
				    </div>
				</div>
				<!-- order 디테일정보 끝-->
  			</div>
		</div>
	</div>
	<!-- 주문현황 테이블 끝 -->
	
	<!-- 매니저보드  -->
	<div class="row">
		<div class="col-6">
			<div class="d-flex justify-content-between bg-secondary font-weight-bold text-white p-1">
				<h5 class="font-weight-bolder">공지사항, 이벤트글 등록</h5>
				<button class="btn btn-light btn-sm p-1" type="button" data-toggle="collapse" data-target="#demo2"><i class="fa fa-sort-down font-size-20"></i></button>
			</div>
  			<div id="demo2" class="collapse">
  				<table class="table table-hover">
					<colgroup>
						<col width="10%">
						<col width="*">
						<col width="20%">
						<col width="20%">
					</colgroup>
					<thead class="thead-dark">
						<tr>
							<th>NO.</th>
							<th>SUBJECT</th>
							<th>CATEGORY</th>
							<th>DATE</th>
						</tr>
					</thead>
					<tbody>
					<%
						ManagerBoardDao managerBoardDao = new ManagerBoardDao();
						List<ManagerBoard> boards = managerBoardDao.getTopfive();
						
					%>
					<%
						for (ManagerBoard board : boards) {
					%>
						<tr>
							<td><%=board.getNo() %></td>
						<%
							if (1 == board.getCateNo()) {
						%>
							<td><a class="atag" href="../board/manager/noticeDetail.jsp?noticeno=<%=board.getNo()%>"><%=board.getTitle() %></a></td>
						<%
							} else {
						%>
							<td><a class="atag" href="../board/manager/eventDetail.jsp?eventno=<%=board.getNo()%>"><%=board.getTitle() %></a></td>
						<%
							}
						%>
							<td><%=board.getCateName() %></td>
							<td><%=board.getRegistedDate() %></td>							
						</tr>
					<%
						}
					%>
					</tbody>
				</table>
				<div class="float-right ">
					<a class="atag-font btn btn-sm btn-outline-dark" href="../board/manager/eventlist.jsp">이벤트 가기</a>
					<a class="atag-font btn btn-sm btn-dark" href="../board/manager/noticelist.jsp">공지사항 가기</a>
					<a class="atag-font btn btn-sm btn-outline-dark" href="../board/manager/form.jsp">글 쓰기</a>
				</div>
  			</div>
		</div>
	<!-- 매니저 보드 끝 -->
	
	<!-- 문의게시판  -->
	<%
		QuestionDao questionDao = new QuestionDao();
		List<Question> questions = questionDao.getQuestionByStatus();
	%>
		<div class="col-6">
			<div class="d-flex justify-content-between bg-secondary font-weight-bold text-white p-1">
				<h5 class="font-weight-bolder">문의게시판</h5>
				<button class="btn btn-light btn-sm p-1" type="button" data-toggle="collapse" data-target="#demo3"><i class="fa fa-sort-down font-size-20"></i></button>
			</div>
  			<div id="demo3" class="collapse">
  				<table class="table table-hover">
					<colgroup>
						<col width="15%">
						<col width="*">
						<col width="20%">
						<col width="20%">
					</colgroup>
					<thead class="thead-dark">
						<tr>
							<th>NO.</th>
							<th>TITLE</th>
							<th>작성자</th>
							<th>답변상태</th>
						</tr>
					</thead>
					<tbody>
					<% 
						for (Question question : questions) {
					%>
						<tr>
							<td><%=question.getQuestionNo() %></td>
							<td><a class="atag" href="../board/question/detail.jsp?questionno=<%=question.getQuestionNo()%>"><%=question.getTitle() %></a></td>
							<td><%=question.getUserId() %></td>
							<td><span class="badge badge-pill badge-danger">답변전</span></td>
						</tr>
					<%
						}
					%>
					</tbody>
				</table>
  			</div>
		</div>
	</div>
	<!-- 문의게시판 끝 -->
</div>
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">

// 상품목록의 표시여부
var isShowProductList = false;

// 토글 버튼 클릭시 실행되는 함수
function toggleProductList() {
	
	var btn = document.getElementById("btn-toggle-product-list");
	var box = document.getElementById("product-list-box");
	
	// 상품목록의 표시여부를 현재 상태의 반대상태로 변경한다.
	isShowProductList = !isShowProductList;
	
	// 상품목록의 표시여부에 따라서 
	if (isShowProductList) {	// 상품목록 표시여부가 true인 경우
		btn.classList.remove("fa-sort-down");
		btn.classList.add("fa-sort-up");
		box.style.display = "block";
		
		refreshProductList(1)	// 토클버튼 클릭시에는 항상 1 페이지 데이터 요청
	} else {					// 상품목록 표시여부가 false인 경우
		btn.classList.remove("fa-sort-up");
		btn.classList.add("fa-sort-down");
		box.style.display = "none";
		
		document.querySelector("tbody").innerHTML = "";	// 모든 상품 목록 삭제
	}
}

// 상품번호에 해당하는 상품목록을 조회해서 화면에 표시하는 함수
// 페이지 로딩시, 토글버튼 클릭시, 페이지번호 클릭시 실행된다.
function refreshProductList(pageNo, event) {
	// 페이지번호를 클릭한 경우에만 event객체가 존재한다.
	if (event) {
		event.preventDefault();
	}
	
	// ajax 실행
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var obj = JSON.parse(xhr.responseText);
			var rows = "";
			for (var i in obj) {
				
				rows += "<tr>";
				rows += "<td>"+obj[i].no+"</td>";
				rows += "<td>"+"<a href='' onclick='showProductDetail(event, "+ obj[i].no +")' class='atag'>" + obj[i].name + "</a>" +"</td>";
				rows += "<td>"+obj[i].stock+"</td>";
				rows += "<td>"+obj[i].date+"</td>";
				rows += "</tr>";
			}
			document.querySelector("tbody").innerHTML = rows;
			
			changeActiveStatus("#product-pagination li", pageNo);
		} 
	}
	// XHR 초기화
	xhr.open("GET", "productControler.jsp?proPageNo=" + pageNo);
	// 서버로 요청보내기
	xhr.send();
}

// 지정된 선택자가 가르키는 페이지네이션에서 페이지 번호에 해당하는 항목을 active 상태로 바꾼다.
function changeActiveStatus(selector, pageNo) {
	clearActiveStatus(selector);
	
	var lis = document.querySelectorAll(selector);
	for (var i=0; i<lis.length; i++) {
		var li = lis[i];
		var linkPageNo = li.textContent.trim();
		if (linkPageNo == pageNo) {
			li.classList.add("active");
		}
	}
}


// 지정된 selector가 모든 li에서 active 클래스 삭제하기
function clearActiveStatus(selector) {
	var lis = document.querySelectorAll(selector);
	for (var i=0; i<lis.length; i++) {
		lis[i].classList.remove('active');
	}
}

function nextPage() {
	event.preventDefault();
	var lis = $("#product-pagination li")
	for (var i = 0; i < lis.length; i++) {
		if (lis[i].classList.contains('active')) {
			var li = lis[i];
			var pageNo = parseInt(li.textContent) + 1;
			 refreshProductList(pageNo, event)
		}
		
	}
}

function changeCate() {
	var mainCate = document.querySelector("select[name=mainCate]").value;
	
	var xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var categorys = JSON.parse(xhr.responseText);
			var rows = "<option value='0' selected='selected' disabled>선택 하세요</option>";
			for (var i = 0; i < categorys.length; i++) {
				rows += "<option value='";
				rows += categorys[i].no;
				rows += "'>";
				rows += categorys[i].name;
				rows +="</option>";
			}
		}
		document.querySelector("select[name=subCategory]").innerHTML = rows;
	}
	
	// XHR 초기화
	xhr.open("GET", "categoryController.jsp?cateno=" + mainCate);
	// 서버로 요청보내기
	xhr.send();
}

// 상품 이름을 클릭하면 해당 상품의 디테일정보를 불러온다.
function showProductDetail(event, no) {
	event.preventDefault();
	$("#manager-product-detail-table").modal("show");
	
	var xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var product = JSON.parse(xhr.responseText);
			var rows = "";
			
			rows += "<tr>";
			rows += "<th>상품번호</th><td><input id='manager-product-No' type='text' name='no' readonly value='"+product.no+"'></td>";
			rows += "<th>등록일</th><td>"+product.date+"</td>";
			rows += "<th>메인카테고리번호</th><td>"+product.mainCateNo+"</td>";
			rows += "</tr>";
			rows += "<tr>";
			rows += "<th>상품이름</th><td><input id='manager-product-name' type='text' name='name' value='"+product.name+"'></td>";
			rows += "<th>옵션</th><td><input type='text' name='option' value='"+product.option+"'></td>";
			rows += "<th>메인카테고리이름</th><td>"+product.mainCateName+"</td>";
			rows += "</tr>";
			rows += "<tr>";
			rows += "<th>상품가격</th><td><input type='number' name='price' value='"+product.price+"'></td>";
			rows += "<th>이미지</th><td>"+product.thumbnail+"</td>";
			rows += "<th>서브카테고리번호</th><td>"+product.subCateNo+"</td>";
			rows += "</tr>";
			rows += "<tr>";
			rows += "<th>상품수량</th><td><input type='number' name='stock' value='"+product.stock+"'></td>";
			rows += "<th>상세정보이미지여부</th><td>"+product.infoStatus+"</td>";
			rows += "<th>서브카테고리이름</th><td>"+product.subCateName+"</td>";
			rows += "</tr>";
			rows += "<tr>";
			rows += "<th>코멘트</th><td><input type='text' name='comment' value='"+product.comment+"'></td>";
			rows += "</tr>";
		}
		$("#manager-product-detail tbody").html(rows);
	}
	
	// XHR 초기화
	xhr.open("GET", "productDetailController.jsp?productno=" + no);
	// 서버로 요청보내기
	xhr.send();
}

function updateProductInfo(event) {
	var productNo = $("#manager-product-No").val();
	$("#manager-upload-productNo").val(productNo);
	var productName = $("#manager-product-name").val();
	$("#manager-upload-productName").val(productName);
	event.preventDefault();
	$('[data-toggle="popover"]').popover({
		container: 'body',
	      title: 'Search',
	      html: true,
	      placement: 'top',
	      sanitize: false,
	      content: function () {
	      return $("#PopoverContent").html();
		}
	})
}

// orderlist 함수들
var isShowOrderList = false;

function toggleOrderList() {
	var btn = document.getElementById("btn-toggle-order-list");
	var box = document.getElementById("order-list-box");
	
	// 상품목록의 표시여부를 현재 상태의 반대상태로 변경한다.
	isShowOrderList = !isShowOrderList;

	// 상품목록의 표시여부에 따라서 
	if (isShowOrderList) {	// 상품목록 표시여부가 true인 경우
		btn.classList.remove("fa-sort-down");
		btn.classList.add("fa-sort-up");
		box.style.display = "block";
		
		showOrder();
	} else {					// 상품목록 표시여부가 false인 경우
		btn.classList.remove("fa-sort-up");
		btn.classList.add("fa-sort-down");
		box.style.display = "none";
		
		document.querySelector("tbody").innerHTML = "";	// 모든 상품 목록 삭제
	}
}

function showOrder(orderNo) {
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var obj = JSON.parse(xhr.responseText);
			var rows = "";
			for (var i in obj) {
				
				rows += "<tr>";
				rows += "<td>"+obj[i].no+"</td>";
				rows += "<td><a class='atag' href='#' onclick='showOrderDetail(event," + obj[i].no + ")'>" + obj[i].userName +"</a></td>";
				rows += "<td>" + obj[i].date + "</td>";
				rows += "<td><a class='atag-font btn btn-sm btn-outline-dark' href='#' onclick='updateOrderStatus(event, "+obj[i].no+")'>배송</a></td>";
				rows += "</tr>"
			}
			
			$("#order-list-box tbody:eq(0)").html(rows);
		} 
	}
	// XHR 초기화
	xhr.open("GET", "manager-orderlist.jsp?orderno=" + orderNo);
	// 서버로 요청보내기
	xhr.send();
}

function updateOrderStatus(event, orderNo) {
	event.preventDefault();
	var cnt = $("#manager-order-cnt").text();
	$("#manager-order-cnt").text(cnt - 1);
	showOrder(orderNo);
}

function showOrderDetail(event, orderNo) {
	event.preventDefault();
	$("#manager-order-detail-table").modal('show');
	
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var obj = JSON.parse(xhr.responseText);
			var $thead = $("#manager-order-detail-table thead");
			var $tbody = $("#manager-order-detail-table tbody");
			var rows = "";
			var rows2 = "";
			
			rows += "<tr>";
			rows +=	"<th>수령인</th>";
			rows +=	"<td>"+obj.userName+"</td>";
			rows +=	"<th>연락처</th>";
			rows +=	"<td>"+obj.phoneNumber+"</td>";
			rows += "</tr><tr>";
			rows +=	"<th>배송지</th>";
			rows +=	"<td colspan='3'>"+obj.mainAddress +" "+ obj.subAddress+"</td>";
			rows += "</tr><tr>";
			rows +=	"<th>NO.</th>";
			rows +=	"<th>상품명</th>";
			rows +=	"<th>상품가격</th>";
			rows +=	"<th>수량</th>"
			rows += "</tr>"
			
			$thead.html(rows);
			
			var details = obj.details;
			for (var i in details) {
				rows2 += "<tr>";
				rows2 +=	"<td>"+details[i].no+"</td>";
				rows2 +=	"<td>"+details[i].productName+"</td>";
				rows2 +=	"<td>"+details[i].price+"</td>";
				rows2 +=	"<td>"+details[i].amount+"</td>";
				rows2 += "</tr>";
			}

			$tbody.html(rows2);
			
		}
	}
	// XHR 초기화
	xhr.open("GET", "orderDetailController.jsp?orderno=" + orderNo);
	// 서버로 요청보내기
	xhr.send();
}

function checkFieldValue() {		
	var subCategory = $("select[name=subCategory]");
	
	if (subCategory.val() == 0) {
		alert("카테고리를 선택해주세요.");
		subCategory.focus();
		return;
	}
	
	var productName = $("input[name=product-name]");
	
	if (!productName.val()) {
		alert("상품이름을 입력해주세요.");
		productName.focus();
		return;
	}
	
	var productPrice = $("input[name=product-price]");
	
	if (!productPrice.val()) {
		alert("상품가격을 입력해주세요.")
		productPrice.focus();
		return;
	}
	
	var productStock = $("input[name=prdouct-stock]");
	
	if (!productStock.val()) {
		alert("상품수량를 입력해주세요.");
		productStock.focus();
		return;
	}
	
	var productCommet = $("input[name=product-comment]");
	
	if (!productCommet.val()) {
		alert("상품커멘트를 입력해주세요.");
		productCommet.focus();
		return;
	}
	
	var productThumbnail = $("input[name=product-thumbnail]");
	
	if (!productThumbnail.val()) {
		alert("썸네일를 등록하세요");
		productThumbnail.focus();
		return;
	}
	
	var productOption = $("input[name=product-option]");
	
	if (!productOption.val()) {
		alert("옵션을 입력해주세요.");
		productOption.focus();
		return;
	}
	
	$("#add-product-form").submit();
}

</script>
  <script src="/withice/js/Chart.min.js"></script>
  <script src="/withice/js/chart-area-demo.js"></script>
  <script src="/withice/js/Chart.bundle.min.js"></script>
</body>
</html>