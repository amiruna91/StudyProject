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

	int cateNo = NumberUtil.stringToInt(mr.getParameter("cate"));
	String subject = mr.getParameter("subject");
	String content = mr.getParameter("content");
	String fileName = mr.getFilesystemName("upfile");

	
	int questionNo = NumberUtil.stringToInt(mr.getParameter("questionno"));
	
	QuestionDao questionDao =new QuestionDao();
	QuestionCategory questionCategory = questionDao.getCategoryByNo(cateNo);

	//수정 전 Question 정보 조회
	Question question = questionDao.getQuestionByNo(questionNo);

	// 수정화면에서 입력한 값으로 Question객체의 값 수정
	question.setCateNo(cateNo);
	question.setTitle(questionCategory.getTitle());
	question.setSubject(subject);
	question.setContent(content);
	if (fileName != null) {
		question.setImage(fileName);		
	}
	
	// 수정된 Question객체를 Dao에 전달해서 DB에 반영시키기
	questionDao.updateQuestion(question);
	
	response.sendRedirect("detail.jsp?questionno=" + questionNo);
	
	

%>