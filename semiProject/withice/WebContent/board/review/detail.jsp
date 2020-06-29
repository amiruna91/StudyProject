<%@page import="com.withice.dao.ReplyDao"%>
<%@page import="com.withice.vo.Reply"%>
<%@page import="com.withice.vo.User"%>
<%@page import="com.withice.dao.UserDao"%>
<%@page import="com.withice.vo.Review"%>
<%@page import="com.withice.dao.ReviewDao"%>
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
				<li class="breadcrumb-item"><a href="list.jsp" style="color: black;">Review</a></li>
			</ul>
		</div>
	</div>
	
	<div class="row">
		<h5 style="font-size: 16px;  padding-bottom: 7px; padding-top: 10px;">상품후기</h5>
	</div>
	
	<div class="row">
		<div class="col-12">
			<table class="table">
				<colgroup>
					<col width="10%">
					<col width="40%">
					<col width="10%">
					<col width="40%">
				</colgroup>
				<tbody>
				<%
					int reviewNo = NumberUtil.stringToInt(request.getParameter("reviewno"));				
					request.setCharacterEncoding("utf-8");
					ReviewDao reviewDao = new ReviewDao();
					Review review = reviewDao.getReviewByNo(reviewNo);
				%>
					<tr >
						<th class="font-weight-normal small">SUBJECT</th>
						<td colspan="3" class="small"><%=review.getTitle()%></td>
					</tr>
					<tr>
						<th class="font-weight-normal small">NAME</th>
						<td class="small"><%=review.getUserId()%></td>
					</tr>
					<tr>
						<th class="font-weight-normal small">DATE</th>
						<td class="small"><%=review.getRegisteredDate()%></td>
						<th class="font-weight-normal small">VIEW</th>
						<td  class="small"><%=review.getViewCount()%></td>
					</tr>
					<tr>
						<td colspan="4" class="small" style="padding-bottom: 60px; padding-top: 25px;"><%=StringUtil.strWithBr(review.getContent()) %></td>
					</tr>
					<%
						if (review.getImage() != null) {
					%>
					<tr>
						<td colspan="4" ><img src="../../images/review/<%=review.getImage()%>" class="img-thumbnail" style="height: 300px;"/></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
		</div>
	</div>
	
	<div class="row border border-top-0 border-right-0 border-left-0 pb-2" >
		<div class="col-12 d-flex justify-content-between" >
			<a href="list.jsp"  type="button" class="btn-sm btn btn-secondary" ><strong>목록</strong></a>
			<%
				if (review.getUserId().equals(loginedUserId) || "Y".equals(adminLogin)) {
			%>
			<div>
				<a href="delete.jsp?reviewno=<%=reviewNo%>"  type="button" class="btn-sm btn btn-outline-secondary"><strong>삭제</strong></a>
				<a href="modify.jsp?reviewno=<%=reviewNo%>"  type="button" class="btn-sm btn btn-secondary"><strong>수정</strong></a>
			</div>
			<%
				}
			%>
		</div>
	</div>
	
	<%
		Review preReview = reviewDao.preView(reviewNo);
		Review afterReview = reviewDao.afterView(reviewNo);
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
						if (preReview != null) {
					%>
						<td class="small"><a href="detail.jsp?reviewno=<%=preReview.getReviewNo()%>" style="color: black; text-decoration: none;" ><%=preReview.getTitle() %></a></td>
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
						if (afterReview!= null) {
					%>
						<td class="small"><a href="detail.jsp?reviewno=<%=afterReview.getReviewNo()%>" style="color: black; text-decoration: none;" ><%=afterReview.getTitle() %></a></td>
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

	<div class="row mt-3">
		<div class="col-12">
			<p style="font-size: 13px; padding-top: 15px;"><strong>댓글 쓰기</strong></p>
			<form method="post" action="replyregister.jsp">
				<input type="hidden" name="reviewno" value="<%=reviewNo %>" />
					<div class="row">
						<div class="col-12">
							<textarea rows="3" class="form-control" name="replycontent" ></textarea>
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
		ReplyDao replyDao = new ReplyDao();
		List<Reply> replyList = replyDao.getReplyByNo(reviewNo);
	%>
	<div class="row">
		<div class="col-12">
			<p style="font-size: 13px; " class="pb-2 border border-top-0 border-right-0 border-left-0"><strong>댓글 목록</strong></p>
			
			<%
				if (replyList.isEmpty()) {
			%>
				<p>등록된 댓글이 없습니다.</p>
			<%		
				} else {
					for (Reply reply : replyList) {
			%>
				<div class="col-12">
					<div class="mb-3">
						<div>
							<small>Comment By 
								<strong class="mr-3"><%=reply.getUserId() %></strong> <%=reply.getRegisteredDate() %>
							</small>
						</div>
			<%	
						if(reply.getUserId().equals(loginedUserId) ||"withice".equals( loginedUserId)) {
			%>
						<small><%=reply.getContent()%> </small>
					</div>
				</div>
				<div class="col-12 ">
					<div class="mb-3 text-right">						
						<a href="/withice/board/review/deletereply.jsp?replyno=<%=reply.getReplyNo() %>&reviewno=<%=reply.getReviewNo() %>"  type="button" class="btn-sm btn btn-secondary"><strong>삭제</strong></a>
					</div>
				</div>										
			<%
						} else {	
			%>
				<div class="col-12">
					<div class="mb-3">
						<small><%=reply.getContent()%></small>
					</div>
				</div>
			<%
						}
					}
				}
			%>
		</div>
	</div>
	<%
		List<Review> review2 = reviewDao.getReviewByProductNo(review.getProductNo());
	%>
	<div class="row">
		<div class="col-12">
			<p style="font-size: 13px; " class="mt-3 mb-2 "><strong>관련글 목록</strong></p>
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
				
					if (review2.isEmpty()) {
				%>
					<tr>
					<td colspan="4"><del>리뷰가 더 존재하지 않습니다.</del></td>
					</tr>
		
				<%
					} else {
						for (Review re : review2) {
				%>
					<tr >
						<td class="small"><%=re.getReviewNo() %></td>
						<td class="small"><%=re.getOrderDetailNo() %></td>
						<td class="small"><a href="detail.jsp?reviewno=<%=re.getReviewNo()%>" style="color: black; text-decoration: none;" ><%=re.getTitle()%></a></td>
						<td class="small"><%=re.getUserId() %></td>
						<td class="small"><%=re.getRegisteredDate() %></td>
						<td class="small"><%=re.getViewCount()%></td>
					</tr>
				<%	
						}
					}
				%>
				
				</tbody>
			</table>
		</div>
	</div>
</div>
<%@ include file="../../common/footer.jsp" %>
</body>
</html>
    