<%@page import="com.withice.vo.Answer"%>
<%@page import="com.withice.dao.AnswerDao"%>
<%@page import="com.withice.vo.User"%>
<%@page import="com.withice.dao.UserDao"%>
<%@page import="com.sun.xml.internal.ws.api.pipe.NextAction"%>
<%@page import="com.withice.dao.QuestionDao"%>
<%@page import="com.withice.vo.Question"%>
<%@page import="com.withice.util.StringUtil"%>
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
<%@ include file="../../common/logincheck.jsp" %>
<%@ include file="../../common/navbar.jsp"%> 
</head>
<body>
<%
	int questionNo = NumberUtil.stringToInt(request.getParameter("questionno"));
					
	QuestionDao questionDao = new QuestionDao();
	Question question = questionDao.getQuestionByNo(questionNo);
	Question preQuestion = questionDao.preView(questionNo);
	Question afterQuestion = questionDao.afterView(questionNo); 
%>
<div class="container">
	<div class="row">
		<div class="col-12">
			<ul class="breadcrumb float-right">
				<li class="breadcrumb-item"><a href="../../home.jsp">Home</a></li>			
				<li class="breadcrumb-item"><a href="list.jsp">board</a></li>
			</ul>
		</div>
	</div>
	<div class="row">
		<div class="row">
			<div class="col-12" style="padding-left:30px;">
				<strong>문의게시판</strong>
			</div>
			<div class="col-12"  style="padding-left:30px;  padding-bottom: 20px;">
				<small>WITHICE의 상품 QnA</small>
			</div>
		</div>
		<div class="col-12">
			<table class="table">
				<colgroup>
					<col width="10%">
					<col width="40%">
					<col width="10%">
					<col width="40%">
				</colgroup>
				<tbody>
					<tr >
						<th class="font-weight-normal small">SUBJECT</th>
						<td colspan="3" class="small"><%=question.getTitle()%></td>
					</tr>
					<tr>
						<th class="font-weight-normal small">NAME</th>
						<td class="small"><%=question.getUserId()%></td>
					</tr>
					<tr>
						<th class="font-weight-normal small">DATE</th>
						<td class="small"><%=question.getResisteredDate()%></td>
						<th class="font-weight-normal small">VIEW</th>
						<td  class="small"><%=question.getViewCount()%></td>
					</tr>
					<tr>
						<td colspan="4" class="small" style="padding-bottom: 60px; padding-top: 25px;"><%=StringUtil.strWithBr(question.getContent()) %></td>
					</tr>
					<%
						if (question.getImage() != null) {
					%>
					<tr>
						<td colspan="4" ><img src="../../images/questions/<%=question.getImage() %>" class="img-thumbnail" style="height: 300px;"/></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			<hr>
		</div>
	</div>
	<div class="row" >
		<div class="col-12 d-flex justify-content-between" style="padding-bottom: 50px;">
			<a href="list.jsp"  type="button" class="btn-sm btn btn-secondary" ><strong>목록</strong></a>
			<div>
				<a href="delete.jsp?questionno=<%=questionNo%>"  type="button" class="btn-sm btn btn-outline-secondary"><strong>삭제</strong></a>
				<a href="modify.jsp?questionno=<%=questionNo%>"  type="button" class="btn-sm btn btn-secondary"><strong>수정</strong></a>
			</div>
		</div>
	</div>
	<%
		UserDao userDao = new UserDao();
		User user = userDao.getUserById(loginedUserId);
		AnswerDao answerDao = new AnswerDao();
		Answer answer = answerDao.getAnswerByNo(questionNo);
	%>
	<%
		if ("Y".equals(user.getAdmin())) {
			if (question.getStatus() == 0) {
	%>
	<div class="row">
		<div class="col-12">
			<h4>문의 답변 작성</h4>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<form method="post" action="registeranswer.jsp">
				<input type="hidden" name="questionNo" value="<%=questionNo %>" />
					<div class="row">
						<div class="col-12">
							<textarea rows="20" class="form-control" name="answercontent" style="font-size: 12px;"></textarea>
						</div>
					</div>
					<div class="row" style="padding-top: 20px">
						<div class="col-12 text-right">
							<button type="submit" class="btn-sm btn btn-dark"><strong>등록</strong></button>
							<a href="list.jsp"  type="button" class="btn-sm btn btn-secondary"><strong>취소</strong></a>
						</div>
					</div>
			</form>
		</div>
	</div>
		<%
			} else {
		%>
	<div class="row">
		<div class="col-12">
			<h4>문의 답변 수정</h4>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<form method="post" action="modifyanswer.jsp">
				<input type="hidden" name="questionNo" value="<%=questionNo %>" />
					<div class="row">
						<div class="col-12">
							<textarea rows="20" class="form-control" name="answercontent" style="font-size: 12px;"><%=answer.getAnswerContent() %></textarea>
						</div>
					</div>
					<div class="row" style="padding-top: 20px">
						<div class="col-12 text-right">
							<button type="submit" class="btn-sm btn btn-dark"><strong>수정</strong></button>
							<a href="list.jsp"  type="button" class="btn-sm btn btn-secondary"><strong>취소</strong></a>
						</div>
					</div>
			</form>
		</div>
	</div>
	<%
			} 
		} else {
	%>
		<div class="row" style="padding-top: 20px;">
			<div class="col-12">
				<h4>문의 답변</h4>
			</div>
		</div>
		<div class="row" style="height: 300px; padding-top: 10px; padding-bottom:20px;">
			<div class="col-12 card">
		<%
			if (question.getStatus() == 1) {
		%>
				<%=answer.getAnswerContent() %>
		<%
			} else {
		%>
			아직 등록된 답변이 없습니다.
		<%
			}
		%>
			</div>
		</div>
	<%
		}
	%>
	<div class="row">
		<div class="col-12">
			<table class="table table table-lg border border-top-0 border-right-0 border-left-0" style="padding-bottom: 20px;">
				<colgroup>
					<col width="10%">
					<col width="90%">
				</colgroup>
				<tr>
					<th class="small"><strong>∧ </strong> PREV</th>
					<%
						if (preQuestion != null) {
					%>
						<td class="small"><a href="view.jsp?questionno=<%=preQuestion.getQuestionNo()%>" style="color: black; text-decoration: none;" ><%=preQuestion.getSubject() %></a></td>
					<%
						} else {
					%>
						<td class="small">이전 글 없음</td>
					<%
						}
					%>
				</tr>	
				<tr>
					<th class="small"><strong>∨ </strong>NEXT</th>
					<%
						if (afterQuestion != null) {
					%>
						<td class="small"><a href="view.jsp?questionno=<%=afterQuestion.getQuestionNo()%>" style="color: black; text-decoration: none;" ><%=afterQuestion.getSubject() %></a></td>
					<%
						} else {
					%>
						<td class="small">다음 글 없음</td>
					<%	
						}
					%>
				</tr>	
			</table>
		</div>
	
	</div>
</div>
<%@ include file="../../common/footer.jsp" %>
</body>
</html>
    