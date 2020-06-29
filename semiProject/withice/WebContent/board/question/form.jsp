<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.withice.dao.QuestionDao"%>
<%@page import="com.withice.vo.QuestionCategory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="/withice/css/naviAndFooter.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
  <script src="/withice/js/navi.js"></script>
  
    <style type="text/css">
  	#question-table tbody td:nth-child(4) a:hover {
  		color: gray !important;
  	}
  	
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
	
	.quickPage {
		font-size: 13px; 
		padding: 7px 12px;
	}
  </style>
</head>
<body>
<%@ include file="../../common/navbar.jsp"%>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-12">
			<ul class="breadcrumb float-right">
				<li class="breadcrumb-item"><a href="../../home.jsp">Home</a></li>			
				<li class="breadcrumb-item"><a href="../question/list.jsp">board</a></li>
				<li class="breadcrumb-item"><a href="">문의게시판</a></li>
			</ul>
		</div>
	</div>
	<!-- 입력폼을 포함하는 row 시작 -->
			<%
			request.setCharacterEncoding("utf-8");
			
			QuestionDao questionDao = new  QuestionDao();
			List<QuestionCategory> categories = questionDao.getCategories();
			List<QuestionCategory> categories2 = questionDao.getCategoryTitle();
		
		
			%>
		<div class="row">
		<div class="col-12" style="padding-left:30px; padding-top: 30px;" >
			<strong>문의게시판</strong>
		</div>
		<div class="col-12"  style="padding-left:30px; padding-bottom: 10px;">
			<small>WITHICE의 상품 QnA</small>
		</div>
	
	</div>
	
	<hr>
	
	<div class="row">
		<div class="col-12">
			
			<!-- 문의하기 입력폼을 포함하고 있는 card 컴포넌트 시작 -->
			<div >

				<div class="col-12">
					<!--문의하기 입력 폼 시작  -->
					<form id="add-question-form" method="post" action="register.jsp" enctype="multipart/form-data">
						<!-- 상세화면에서 상품에 대한 문의하기 버튼을 클릭하고 왔을 때 해당 상품번호를 전달받게 되는데, 그 번호를 hidden필드에 입력한다. -->
						<input type="hidden" name="productNo"/>
						<div class="form-group row small">
							<label class="col-2 col-form-label">SUBJECT</label>
							<div class="col-3 ">
								<select class="form-control " name="cate"  style="font-size: 12px;">
									<option value="0" selected="selected" disabled="disabled" style="font-size: 12px;"> 카테고리 선택</option>
									<%
										for (QuestionCategory category : categories)
											if("C".equals(category.getType())) {
									%>
									
											<option value="<%=category.getNo()%>"><%=category.getTitle() %> </option>
									<%
											} 
									%>
								</select>
							</div>
							<div class="col-3">
								<select class="form-control" name="subject"  style="font-size: 12px;">
									<option value="0" selected="selected" disabled="disabled" style="font-size: 12px;"> 제목 선택</option>
									<%
										for (QuestionCategory category : categories2)
											if("T".equals(category.getType())) {
									%>
									<option value="<%=category.getTitle() %>"><%=category.getTitle() %></option>
									
									<%
											}
									%>
								</select>
							</div>
						</div>
						<div class="form-group row small">
							
							<div class="col-12">
								<textarea rows="20" class="form-control" name="content" style="font-size: 12px;"></textarea>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-2 col-form-label small" style="font-size: 12px;">FILE</label>
							<div class="col-3 small" >
		    					<input type="file" class="form-control small" name="upfile" style="font-size: 12px;" >
							</div>
						</div>
						
						<hr>
						
						<div class="row">
							<div class="col-12 text-right">
								<div class="row" >
									<div class="col-12 d-flex justify-content-between" style="padding-bottom: 50px;">
									<a href="list.jsp"  type="button" class="btn-sm btn btn-secondary" ><strong>목록</strong></a>
								<div>
									<button  type="button" class="btn-sm btn btn-dark" onclick="checkValue()"><strong>등록</strong></button>
									<a href="list.jsp"  type="button" class="btn-sm btn btn-secondary"><strong>취소</strong></a>
								</div>
								</div>
							</div>
							</div>
						</div>
					</form>
					<!--문의하기 입력 폼 끝  -->
				</div>
			</div>
			<!-- 문의하기 폼을 포함하고 있는 card 컴포넌트 끝 -->
		</div>
	</div>
	<!-- 오류알림과 입력폼을 포함하는 row 끝 -->


</div>
<script type="text/javascript">
function checkValue() {
	var mainCategory = $("select[name=cate]");
	console.log(mainCategory.val());
	if (mainCategory.val() == null) {
		alert("카테고리를 선택해주세요.");
		mainCategory.focus();
		return;
	}
	
	var subCategory = $("select[name=subject]");
	
	if (subCategory.val() == null) {
		alert("제목을 선택해주세요.");
		subCategory.focus();
		return;
	}

	var content = $("textarea[name=content]");
	
	if (!content.val()) {
		alert("내용을 입력해주세요.");
		content.focus();
		return;
	}
	
	$("#add-question-form").submit();
	
}
</script>
<%@ include file="../../common/footer.jsp" %>
</body>
</html>
    