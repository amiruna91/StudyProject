<%@page import="com.withice.dao.ReplyDao"%>
<%@page import="com.withice.vo.Review"%>
<%@page import="com.withice.dao.ReviewDao"%>
<%@page import="com.withice.vo.Reply"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../common/logincheck.jsp" %>
<%
	request.setCharacterEncoding("utf-8");

	// 댓글정보 등록에 필요한 리뷰번호, 댓글 내용 조회 
	int reviewNo = NumberUtil.stringToInt(request.getParameter("reviewno"));
	String content = request.getParameter("replycontent");
		
	// 댓글 저장
	Reply reply = new Reply();
	reply.setContent(content);
	reply.setReviewNo(reviewNo);
	reply.setUserId(loginedUserId);	// 작성자는 로그인한 사용자의 아이디
	
	ReplyDao replyDao = new ReplyDao();
	replyDao.registerReply(reply);
	
	// 해당 리뷰의 댓글 갯수 증가
	ReviewDao reviewDao = new ReviewDao();
	reviewDao.updateReplyCnt(reviewNo);
	
	response.sendRedirect("detail.jsp?reviewno=" + reviewNo);
%>