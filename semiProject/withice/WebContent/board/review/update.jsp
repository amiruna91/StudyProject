<%@page import="com.withice.dao.ReviewDao"%>
<%@page import="com.withice.vo.Review"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.withice.vo.QuestionCategory"%>
<%@page import="com.withice.dao.QuestionDao"%>
<%@page import="com.withice.vo.Question"%>
<%@page import="com.withice.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String saveDirectory = application.getInitParameter("imageSaveDirectory") + "questions";
	int maxPostSize = NumberUtil.stringToInt(application.getInitParameter("maxUploadFileSize"));
	String encoding = "utf-8";
	MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding);


	String title = mr.getParameter("title");
	String content = mr.getParameter("content");
	String fileName = mr.getFilesystemName("upfile");

	
	int reviewNo = NumberUtil.stringToInt(mr.getParameter("reviewno"));
	

	ReviewDao reviewDao =new ReviewDao();

	
	//수정 전 Question 정보 조회
	Review review = reviewDao.getReviewByNo(reviewNo);

	// 수정화면에서 입력한 값으로 Question객체의 값 수정
	review.setTitle(title);

	review.setContent(content);
	if (fileName != null) {
		review.setImage(fileName);		
	}
	
	// 수정된 Question객체를 Dao에 전달해서 DB에 반영시키기
	reviewDao.updateReview(review);
	
	response.sendRedirect("list.jsp?reviewno=" + reviewNo);
	
	

%>