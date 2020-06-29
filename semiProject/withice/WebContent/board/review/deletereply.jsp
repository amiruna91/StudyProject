<%@page import="com.withice.vo.Review"%>
<%@page import="com.withice.dao.ReviewDao"%>
<%@page import="com.withice.dao.ReplyDao"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	int replyNo = NumberUtil.stringToInt(request.getParameter("replyno"));
	int reviewNo = NumberUtil.stringToInt(request.getParameter("reviewno"));
	ReplyDao replyDao = new ReplyDao();
	
	replyDao.deleteReply(replyNo);
	
	ReviewDao reviewDao = new ReviewDao();
	Review review = reviewDao.getReviewByNo(reviewNo);
	int cnt = review.getReplyCnt();
	review.setReplyCnt(cnt-1);
	reviewDao.updateReview(review);
	response.sendRedirect("/withice/board/review/detail.jsp?reviewno="+reviewNo);
%>