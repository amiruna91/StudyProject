<%@page import="java.util.List"%>
<%@page import="com.withice.vo.QuestionCategory"%>
<%@page import="com.withice.dao.QuestionDao"%>
<%@page import="com.withice.vo.Question"%>
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
<div class="container">
	<div class="row">
		<div class="col-12">
			<ul class="breadcrumb float-right">
				<li class="breadcrumb-item"><a href="../../home.jsp">Home</a></li>			
				<li class="breadcrumb-item"><a href="list.jsp">board</a></li>
			</ul>
		</div>
	</div>

	<%
		int questionNo = NumberUtil.stringToInt(request.getParameter("questionno"));
		
		QuestionDao questionDao = new QuestionDao();
		List<QuestionCategory> categories = questionDao.getCategories();
		List<QuestionCategory> categories2 = questionDao.getCategoryTitle();
		Question question = questionDao.getQuestionByNo(questionNo);
		
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
				<div class="card-body">
					<!--문의하기 입력 폼 시작  -->
					<form method="post" action="update.jsp" enctype="multipart/form-data">
						<!-- 상세화면에서 상품에 대한 문의하기 버튼을 클릭하고 왔을 때 해당 상품번호를 전달받게 되는데, 그 번호를 hidden필드에 입력한다. -->
						<input type="hidden" name="questionno" value="<%=questionNo%>"/>
						<div class="form-group row small">
							<label class="col-2 col-form-label">SUBJECT</label>
							<div class="col-3 ">
								<select class="form-control " name="cate"  style="font-size: 12px;">
									<option value="" selected="selected" disabled="disabled" style="font-size: 12px;"> 카테고리 선택</option>
									<%
										for (QuestionCategory category : categories)
											if("C".equals(category.getType())) {
									%>
									
											<option value="<%=category.getNo()%>" <%=question.getCateNo() == category.getNo() ? "selected" : "" %>><%=category.getTitle() %> </option>
									<%
											} 
									%>
								</select>
							</div>
							<div class="col-3">
								<select class="form-control" name="subject"  style="font-size: 12px;">
									<option value="" selected="selected" disabled="disabled" style="font-size: 12px;"> 제목 선택</option>
									<%
										for (QuestionCategory category : categories2)
											if("T".equals(category.getType())) {
									%>
									<option value="<%=category.getTitle() %>" <%=question.getSubject().equals(category.getTitle()) ? "selected" : "" %>><%=category.getTitle() %></option>
									
									<%
											}
									%>
								</select>
							</div>
						</div>
						<div class="form-group row small">
							
							<div class="col-12 small">
								<textarea rows="20" class="form-control" name="content" style="font-size: 12px;"><%=question.getContent() %></textarea>
								
							</div>
						</div>
						<div class="form-group row">
							<label class="col-2 col-form-label" style="font-size: 12px;">FILE</label>
							<div class="col-3 small">
		    					<input type="file" class="form-control" name="upfile"  style="font-size: 12px;" >
							</div>
						</div>
					<hr>
						<div class="row">
							<div class="col-12 text-right">
								<div class="row" >
									<div class="col-12 d-flex justify-content-between" style="padding-bottom: 50px;">
									<a href="list.jsp"  type="button" class="btn-sm btn btn-secondary" ><strong>목록</strong></a>
								<div>
									<button type="submit" class="btn-sm btn btn-dark">수정</button>
									<a href="list.jsp"  type="button" class="btn-sm btn btn-outline-secondary"><strong>취소</strong></a>
								</div>
								</div>
							</div>
							</div>
						</div>
					</form>
					<!--문의하기 입력 폼 끝  -->
				</div>
			</div>
</div>
<%@ include file="../../common/footer.jsp" %>
</body>
</html>
    