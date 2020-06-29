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
				<li class="breadcrumb-item"><a style="color: black;">Review</a></li>
			</ul>
		</div>
	</div>
	<%
		ReviewDao reviewDao = new ReviewDao();
		Review review = new Review();
		
		
		int viewRows = 10;
		int viewPageCnt = 5;
		int pageNo = NumberUtil.stringToInt(request.getParameter("page"), 1);
		int totalRows = reviewDao.getTotalCount();
		Pagenation pagenation = new Pagenation(totalRows, viewRows, viewPageCnt, pageNo);
		int begin = pagenation.getBeginIndex();
		int end = pagenation.getEndIndex();
		List<ReviewListDto> reviewList = reviewDao.getReviews(begin, end);
		
		int reviewNo = NumberUtil.stringToInt(request.getParameter("reviewno"));
	
		
		
	
	%>
	<div class="row">
			<div class="col-12">
			<img alt="main" src="../../images/review/main.jpg" width="100%" class="rounded" />
			</div>
	</div>
	<div class="row">
		<h5 style="font-size: 16px; padding-left: 17px; padding-bottom: 7px; padding-top: 10px;">상품후기</h5>
	</div>

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
					<th  class="font-weight-normal small">PRODUCT</th>
					<th class="font-weight-normal text-center  small">SUBJECT</th>
					<th class="font-weight-normal small" >NAME</th>
					<th class="font-weight-normal small" >DATE</th>
					<th class="font-weight-normal small">VIEW</th>
				</tr>
			</thead>
			<tbody>
			<%
			for (ReviewListDto re : reviewList) {
			%>
				<tr >
					<td class="small"><%=re.getNo() %></td>
					<td class="small">
						<a href="../../product/productDetail.jsp?cateno=<%=re.getCateNo() %>&productno=<%=re.getProductNo()%>">
							<img src="../../images/product-images/<%=re.getProductThum()%>" width="36" height="36">
						</a>
					</td>
					<td class="small"><a href="view.jsp?reviewno=<%=re.getNo()%>" style="color: black; text-decoration: none;" ><%=re.getTitle()%> <span class="badge badge-primary"><%=re.getReplyCnt() %></span></a></td>
					<td class="small"><%=re.getUserId() %></td>
					<td class="small"><%=re.getRegisterDate() %></td>
					<td class="small"><%=re.getViewCnt()%></td>
				</tr>
			<%	
			}
				
			%>
			</tbody>
		</table>
	
	</div>
</div>
		
		
</div>
<div>
	<ul class="pagination justify-content-center">
		<%
			if (pagenation.getPageNo() > 1) {
		%>
				<li class="page-item active">
					<a class="page-link quickPage" href="list.jsp?page=1">&laquo;</a>
				</li>
				
				<li class="page-item">
					<a class="page-link" href="list.jsp?page=<%=pagenation.getPageNo()-1%>">&lt;</a>
				</li>
		<%
			}
		%>
		<%
			for (int num=pagenation.getBeginPageIndex(); num<=pagenation.getEndPageIndex(); num++) {
		%>
			<li class="page-item"><a class="page-link" href="list.jsp?page=<%=num %>"> <%=num %></a> </li>
		<%
			}
		%>
		
			<%
			if (pagenation.getPageNo() < pagenation.getTotalpage()) {
		%>
				<li class="page-item">
					<a class="page-link" href="list.jsp?page=<%=pagenation.getPageNo()+1%>">&gt;</a>
				</li>
				
				<li class="page-item">
					<a class="page-link quickPage" href="list.jsp?page=<%=pagenation.getTotalpage()%>">&raquo;</a>
				</li>
				
		<%
			}
		%>
	</ul>
</div>

<%@ include file="../../common/footer.jsp" %>
</body>
</html>
    