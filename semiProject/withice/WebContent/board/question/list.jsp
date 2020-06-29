<%@page import="com.withice.vo.Condition"%>
<%@page import="com.withice.vo.Pagenation"%>
<%@page import="com.withice.util.StringUtil"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@page import="com.withice.vo.QuestionCategory"%>
<%@page import="java.util.List"%>
<%@page import="com.withice.dao.QuestionDao"%>
<%@page import="com.withice.vo.Question"%>
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
<div class="container" style="width: 1300px;">
<!-- 현재위치 -->
	<div class="row">
		<div class="col-12">
			<ul class="breadcrumb float-right">
				<li class="breadcrumb-item"><a href="../../home.jsp">Home</a></li>			
				<li class="breadcrumb-item"><a style="color: black">Board</a></li>
			</ul>
		</div>
	</div>
	<!-- 현재위치 -->
	<!-- 검색조건, 정렬기준, 테이블, 페이지처리 내용을 포함하는 Row 시작  -->
	<%
		request.setCharacterEncoding("utf-8");
	
		int pageNo = NumberUtil.stringToInt(request.getParameter("page"), 1);
		int categoryNo = NumberUtil.stringToInt(request.getParameter("categoryNo"), 0);
		int completed = NumberUtil.stringToInt(request.getParameter("completed"), -1);
		String error = request.getParameter("error");
		
		Condition condition = new Condition();
		condition.setCategoryNo(categoryNo);
		condition.setCompleted(completed);

		QuestionDao questionDao = new QuestionDao();
		int totalRows = questionDao.getQuestionsCount(condition);
		
		Pagenation pagenation = new Pagenation(totalRows, 10, 5, pageNo);
		
		condition.setBeginIndex(pagenation.getBeginIndex());
		condition.setEndIndex(pagenation.getEndIndex());
	
		List<Question> questions = questionDao.getSearchQuestions(condition);
		List<QuestionCategory> categories = questionDao.getCategories();
	
	%>
	<%
		if ("false".equals(error)) {
	%>	
		<div style="text-align: center">
		<button class = "btn btn-outline-danger btn-sm"><strong>헉! 안타깝게도 작성자만 볼 수 있는 비밀글 입니다.</strong></button>
		</div>
	<%
		}
	%>
	<div class="row">
		<div class="col-12" style="padding-left:30px;">
			<strong>문의게시판</strong>
		</div>
		<div class="col-12"  style="padding-left:30px;">
			<small>WITHICE의 상품 QnA</small>
		</div>
	</div>

	<div class="row">
		<div class="col-12">
			<!-- 검색조건, 정렬기준, 테이블, 페이지처리 내용을 포함하는 card 시작 -->
			<div >
				<div class="card-body">
					<!-- 검색조건, 정렬기준 입력 폼 시작 -->
					<form id="search-form" method="get" action="list.jsp">
						<input type="hidden" name="page" value="1" />
						<div class="row">
							<!-- 검색조건 입력폼 시작 -->
							<div class="col-6" >
								<div class="input-group mb-3" >
									<div class="input-group-prepend" >
										<select class="form-control" name="categoryNo" onchange="searchList()" style="font-size: 12px;">
											<option value="0" selected="selected">전체</option>
										<%
											for (QuestionCategory category : categories)
												if("C".equals(category.getType())){
										%>
		    								<option value="<%=category.getNo() %>" <%=categoryNo == category.getNo() ? "selected" : "" %>><%=category.getTitle() %></option>
		    								
		    							<%
		    									}
		    							%>
		    							
		  								</select>
		  								
		  							</div>
									<div class="input-group-prepend ml-3" >
										<select class="form-control" name="completed" onchange="searchList()" style="font-size: 12px;">
											<option value="-1" selected="selected">전체글보기</option>
		    								<option value="0" <%=completed == 0 ? "selected" : "" %>> 답변 전</option>
										    <option value="1" <%=completed == 1 ? "selected" : "" %>> 답변 완료</option>
		  								</select>
		  							</div>
	  							</div>
							</div>
							<!-- 검색조건 입력폼 끝 -->
							<!-- 정렬기준 선택 시작  -->
			
							<!-- 정렬기준 선택 끝  -->
						</div>
					<!-- 검색조건, 정렬기준 입력 폼 끝 -->
					<div class="row">
						<div class="col-12">
							<table id="question-table" class="table table-lg border border-top-0 border-right-0 border-left-0" >
								<colgroup>
									<col width="10%">
						
									<col width="12%">
									<col width="*">
									<col width="5%">
									<col width="10%">
									<col width="7%">
								</colgroup>
								<thead>
									<tr>
										<th  class="font-weight-normal small">NO.</th>
						
										<th class="font-weight-normal small">CATEGORY</th>
										<th class="font-weight-normal text-center  small">SUBJECT</th>
										<th class="font-weight-normal small" >NAME</th>
										<th class="font-weight-normal small" >DATE</th>
										<th class="font-weight-normal small">VIEW</th>
									</tr>
								</thead>
								<tbody>
								<%
							for (Question question : questions) {
								if ("Y".equals(question.getDelYN())) {
							%>
								<tr>
									<td><%=question.getQuestionNo()%></td>
									<td colspan="4"><del>삭제된 글입니다.</del></td>
								</tr>
							<%
								} else {
							%>
									<tr >
										<td class="small"><%=question.getQuestionNo() %></td>
						
										<td class="small"><%=question.getTitle() %></td>
							<%
								if (question.getStatus() == 1) {
							%>
										<td class="small">
											<i class="fa fa-check-circle-o"></i> <a href="view.jsp?questionno=<%=question.getQuestionNo()%>" style="color: black; text-decoration: none;"><%=question.getSubject() %></a> <span class="badge badge-fill badge-danger">답변완료</span>
										</td>
							<%
								} else {
							%>
										<td class="small"><a href="view.jsp?questionno=<%=question.getQuestionNo()%>" style="color: black; text-decoration: none;" ><%=question.getSubject() %></a></td>
							<%
								}
							%>
										<td class="small"><%=question.getUserId() %></td>
										<td class="small"><%=question.getResisteredDate() %></td>
										<td class="small"><%=question.getViewCount()%></td>
									</tr>
								<%	
										}
									}
								%>
							
								
								</tbody>
							</table>
						
						</div>
					</div>
					<div class="row">
						<div class="col-1 offset-11 text-right">
							<a href="form.jsp" type="button" class="btn btn-dark btn-block btn-sm" >쓰기</a>
						</div>
					</div>
					
		<!-- 페이지 처리 시작 -->
		<%
		%>
		<div >
			<ul class="pagination justify-content-center">
		<%
			if (pagenation.getPageNo() > 1) {
		%>
				
				<li class="page-item">
					<a class="page-link" href="javascript:searchList(<%=pagenation.getPageNo()-1%>)">&lt;</a>
				</li>
		<%
			}
		%>
		<%
			for (int i = pagenation.getBeginPageIndex(); i <= pagenation.getEndPageIndex(); i++) {
		%>
				<li class="page-item <%=i == pageNo ? "active" : ""%>"><a class="page-link" href="javascript:searchList(<%=i%>)"><%=i %></a></li>
		<%
			}
		%>
		<%
			if (pagenation.getPageNo() < pagenation.getTotalpage()) {
		%>
				<li class="page-item">
					<a class="page-link" href="javascript:searchList(<%=pagenation.getPageNo()+1%>)">&gt;</a>
				</li>
				
		<%
			}
		%>
			</ul>
		</div>
		<!-- 페이지 처리 끝 -->
					
					</form>
					
				</div>
				
			</div>
			
			<!-- 검색조건, 정렬기준, 테이블, 페이지처리 내용을 포함하는 card 끝 -->
		</div>
	</div>
</div>
<%@ include file="../../common/footer.jsp" %>
<script type="text/javascript">
	function searchList(pageNo) {
		pageNo = pageNo || 1;
		document.querySelector("input[name=page]").value = pageNo;
		var form = document.getElementById("search-form");
		form.submit();
	}
</script>
</body>
</html>
    