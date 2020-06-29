<%@page import="com.withice.vo.ManagerBoard"%>
<%@page import="com.withice.dao.ManagerBoardDao"%>
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
<%@ include file="../../common/navbar.jsp"%> 
</head>
<body>
<%
	int managerBoardNo = NumberUtil.stringToInt(request.getParameter("noticeno"));
					
	ManagerBoardDao managerBoardDao = new ManagerBoardDao();
	ManagerBoard managerBoard = managerBoardDao.getManagerBoardByNo(managerBoardNo);
	ManagerBoard preManagerBoard = managerBoardDao.preView(managerBoardNo, 1);
	ManagerBoard afterManagerBoard = managerBoardDao.afterView(managerBoardNo, 1);
%>
<div class="container">
	<div class="row">
		<div class="col-12">
			<ul class="breadcrumb float-right">
				<li class="breadcrumb-item"><a href="../../home.jsp">Home</a></li>			
				<li class="breadcrumb-item"><a href="noticelist.jsp" style="color: black;">Notice</a></li>
			</ul>
		</div>
	</div>
	<div class="row">
		<div class="row">
			<div class="col-12" style="padding-left:30px;">
				<strong>공지사항</strong>
			</div>
			<div class="col-12"  style="padding-left:30px;  padding-bottom: 20px;">
				<small>WITHICE의 공지사항입니다.</small>
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
						<td colspan="3" class="small"><%=managerBoard.getTitle()%></td>
					</tr>
					<tr>
						<th class="font-weight-normal small">NAME</th>
						<td class="small"><%=managerBoard.getUserId()%></td>
					</tr>
					<tr>
						<th class="font-weight-normal small">DATE</th>
						<td class="small"><%=managerBoard.getRegistedDate()%></td>
						<th class="font-weight-normal small">VIEW</th>
						<td  class="small"><%=managerBoard.getViewCnt()%></td>
					</tr>
		
					<%
						if (managerBoard.getContent() != null) {
					%>
					<tr>
						<td colspan="4" class="text-center"><img src="../../images/managerBoard/<%=managerBoard.getContent() %>" class="img-thumbnail" style="height: 100%;"/></td>
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
			<a href="noticelist.jsp"  type="button" class="btn-sm btn btn-secondary" ><strong>목록</strong></a>
<%
	if ("Y".equals(adminLogin)) {
%>
			<div>
				<a href="noticedelete.jsp?managerboardno=<%=managerBoardNo%>"  type="button" class="btn-sm btn btn-outline-secondary"><strong>삭제</strong></a>
				<button type="button" class="btn-sm btn btn-secondary" data-toggle="modal" data-target="#noticeBoard"><strong>수정</strong></button>
			</div>
<%
	}
%>
		</div>
		<!-- The Modal -->
		<div class="modal fade" id="noticeBoard">
			<div class="modal-dialog modal-sm modal-dialog-centered">
		     	<div class="modal-content">
		      
			        <!-- Modal Header -->
			        <div class="modal-header">
			          <h4 class="modal-title">공지사항 수정</h4>
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			        </div>
			        
			        <form method="post" action="updateNotice.jsp">
				        <!-- Modal body -->
				        <div class="modal-body">
				        	<input type="hidden" name="noticeno" value="<%=managerBoard.getNo() %>" />
				        	<div class="input-group mb-3 input-group-sm">
								<div class="input-group-prepend">
									<span class="input-group-text">TITLE</span>
								</div>
								<input type="text" class="form-control" name="title" value="<%=managerBoard.getTitle()%>">
							</div>
				        </div>
			        
				        <!-- Modal footer -->
				        <div class="modal-footer">
				          	<button type="submit" class="btn btn-outline-secondary">수정</button>
				          	<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				        </div>		        
			        </form>
		      	</div>
		    </div>
		</div>
	</div>
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
						if (preManagerBoard != null) {
					%>
						<td class="small"><a href="viewCount.jsp?noticeno=<%=preManagerBoard.getNo()%>" style="color: black; text-decoration: none;" ><%=preManagerBoard.getTitle() %></a></td>
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
						if (afterManagerBoard != null) {
					%>
						<td class="small"><a href="viewCount.jsp?noticeno=<%=afterManagerBoard.getNo()%>" style="color: black; text-decoration: none;" ><%=afterManagerBoard.getTitle()%></a></td>
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
    