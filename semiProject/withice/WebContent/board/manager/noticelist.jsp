<%@page import="com.withice.vo.ManagerBoard"%>
<%@page import="com.withice.dao.ManagerBoardDao"%>
<%@page import="com.withice.dto.ReviewListDto"%>
<%@page import="com.withice.vo.Pagenation"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.withice.dao.ReviewDao"%>
<%@page import="com.withice.vo.Review"%>
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
  	#question-table tbody td:nth-child(3) a:hover {
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
				<li class="breadcrumb-item"><a style="color: black;">Notice</a></li>
			</ul>
		</div>
	</div>
	<%	
		ManagerBoardDao managerBoardDao = new ManagerBoardDao();
		ManagerBoard mgBoard = new  ManagerBoard();
		
		
		
		int viewRows = 10;
		int viewPageCnt = 5;
		int pageNo = NumberUtil.stringToInt(request.getParameter("page"), 1);
		int totalRows = managerBoardDao.getnoticesTotalCnt();
		Pagenation pagenation = new Pagenation(totalRows, viewRows, viewPageCnt, pageNo);
		int begin = pagenation.getBeginIndex();
		int end = pagenation.getEndIndex();
		List<ManagerBoard> noticesList = managerBoardDao.getNotices(begin, end);
		
	%>
	<div class="row">
		<div class="col-12">
			<img alt="main" src="../../images/managerBoard/main.jpg" width="100%" class="rounded" />
		</div>
	</div>
	<div class="row">
		<h5 style="font-size: 16px; padding-left: 17px; padding-bottom: 7px; padding-top: 10px;">공지사항</h5>
	</div>
	<div class="row">
		<p style="font-size: 12px; padding-left: 17px; padding-bottom: 13px; color: gray;">위드아이스의 공지를 알리는 게시판입니다.</p>
	</div>
	<div class="row">
		<div class="col-12">
			<table id="question-table" class="table table-lg border border-top-0 border-right-0 border-left-0" >
				<colgroup>
					<col width="10%">
					<col width="*">
					<col width="15%">
					<col width="10%">
					<col width="7%">
				</colgroup>
				<thead>
					<tr>
						<th  class="font-weight-normal small">NO.</th>
						<th class="font-weight-normal text-center  small">SUBJECT</th>
						<th class="font-weight-normal small" >NAME</th>
						<th class="font-weight-normal small" >DATE</th>
						<th class="font-weight-normal small">VIEW</th>
					</tr>
				</thead>
				<tbody>
				<%
				for (ManagerBoard managerBoard : noticesList) {
				%>
					<tr >
						<td class="small"><%=managerBoard.getNo() %></td>
						<td class="small"><a href="viewCount.jsp?noticeno=<%=managerBoard.getNo()%>" style="color: black; text-decoration: none;" ><%=managerBoard.getTitle()%></a></td>
						<td class="small"><%=managerBoard.getUserId() %></td>
						<td class="small"><%=managerBoard.getRegistedDate() %></td>
						<td class="small"><%=managerBoard.getViewCnt()%></td>
					</tr>
				<%	
				}
					
				%>
				</tbody>
			</table>
		</div>
	</div>
<%
	if ("Y".equals(adminLogin)) {	
%>
	<div class="float-right ">
		<a class="atag-font btn btn-sm btn-dark" href="form.jsp">공지사항 등록</a>
	</div>
<%
	}
%>
	<!-- 페이지 처리 -->
	<div>
		<ul class="pagination justify-content-center">
		<%
			if (pagenation.getPageNo() > 1) {
		%>
			<li class="page-item">
				<a class="page-link quickPage" href="noticelist.jsp?page=1"><i class="fa fa-angle-double-left"></i></a>
			</li>
			<li class="page-item ">
					<a class="page-link" href="noticelist.jsp?page=<%=pagenation.getPageNo()-1%>">&lt;</a>
			</li>
		<%
			}
		%>
		<%
			for (int num=pagenation.getBeginPageIndex(); num<=pagenation.getEndPageIndex(); num++) {
		%>
			<li class="page-item <%=num == pageNo ? "active" : ""%>"><a class="page-link" href="noticelist.jsp?page=<%=num %>"> <%=num %></a> </li>
		<%
			}
		%>
			
		<%
			if (pagenation.getPageNo() < pagenation.getTotalpage()) {
		%>
			<li class="page-item">
				<a class="page-link" href="noticelist.jsp?page=<%=pagenation.getPageNo()+1%>">&gt;</a>
			</li>
			<li class="page-item">
				<a class="page-link quickPage" href="noticelist.jsp?page=<%=pagenation.getTotalpage()%>"><i class="fa fa-angle-double-right"></i></a>
			</li>
		<%
			}
		%>
		</ul>
	</div>
</div>

<%@ include file="../../common/footer.jsp" %>
</body>
</html>
    