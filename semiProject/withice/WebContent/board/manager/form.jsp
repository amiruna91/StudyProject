<%@page import="com.withice.dao.ManagerBoardDao"%>
<%@page import="com.withice.vo.ManagerBoardCate"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@page import="com.withice.dao.ReviewDao"%>
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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
				<li class="breadcrumb-item"><a href="noticelist.jsp">Board</a></li>
			</ul>
		</div>
	</div>
	<!-- 입력폼을 포함하는 row 시작 -->
			<%
			request.setCharacterEncoding("utf-8");
			ManagerBoardDao managerBoardDao = new ManagerBoardDao();
			List<ManagerBoardCate> managerBoardCates = managerBoardDao.getCates();
			System.out.println(managerBoardCates.size());
			%>

	 	
		<h5 style="font-size: 16px; padding-left: 17px; padding-bottom: 7px; padding-top: 10px;">매니저 보드</h5>
	<hr>
	
	<div class="row">
			<!-- 문의하기 입력폼을 포함하고 있는 card 컴포넌트 시작 -->
				<div class="col-12">
					<!--문의하기 입력 폼 시작  -->
					<form id="add-manager-board-form" method="post" action="register.jsp" enctype="multipart/form-data">
						<!-- 상세화면에서 상품에 대한 문의하기 버튼을 클릭하고 왔을 때 해당 상품번호를 전달받게 되는데, 그 번호를 hidden필드에 입력한다. -->
					
						<div class="form-group sm" style="font-size: 12px;">
							<label class="col-2">CATEGORY</label>
								<select name="cateno" class="col-2" style="margin-left: -70px;">
									<option value="0" selected="selected" disabled="disabled" style="font-size: 12px;"> 카테고리 선택</option>
						<%
								for(ManagerBoardCate cate : managerBoardCates) {
						%>
									<option style="font-size: 12px;" value="<%=cate.getNo()%>"><%=cate.getTitle()%></option>
						<%
								}
						%>
								</select>	
							
							<label class="col-2 col-form-label" style="margin-left: 10px;">TITLE</label>
								<input class="col-5" name="title" style="margin-left: -110px;">
						<hr>
						</div>
						<div class="form-group row small">
							
							
						</div>
						<div class="form-group row" style="font-size: 12px; ">
							<label class="col-1 col-form-label small" >FILE</label>
							<div class="col-3 small" >
		    					<input type="file" class="form-control small" name="upfile" style="font-size: 12px;" >
							</div>
						</div>
						
						<hr>
						
						<div class="row">
							<div class="col-12 text-right">
								<div class="row" >
									<div class="col-12 d-flex justify-content-between" style="padding-bottom: 50px;">
									<a href="../../manager/manager.jsp"  type="button" class="btn-sm btn btn-secondary" ><strong>매니저보드 바로가기</strong></a>
								<div>
									<button  type="button" class="btn-sm btn btn-dark" onclick="checkValue()"><strong>등록</strong></button>
									<a href="../../manager/manager.jsp" type="button" class="btn-sm btn btn-secondary"><strong>취소</strong></a>
								</div>
								</div>
							</div>
							</div>
						</div>
					</form>
					<!--문의하기 입력 폼 끝  -->
				</div>

			<!-- 문의하기 폼을 포함하고 있는 card 컴포넌트 끝 -->
		</div>
	</div>
	<!-- 오류알림과 입력폼을 포함하는 row 끝 -->
<script type="text/javascript">
function checkValue() {

	var select = $("select[name=cateno]");
	
	if (select.val() == null) {
		alert("카테고리를 입력해주세요.");
		select.focus();
		return;
	}
	
	var title = $("input[name=title]");
	
	if (!title.val()) {
		alert("제목을 입력해주세요.");
		title.focus();
		return;
	}
	
	
	$("#add-manager-board-form").submit();
	
}
</script>
</body>
<%@ include file="../../common/footer.jsp" %>
</html>
    
    