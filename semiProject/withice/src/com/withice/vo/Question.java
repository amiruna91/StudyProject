package com.withice.vo;

import java.util.Date;

public class Question {
	
	private int questionNo;
	private String title;
	private Date resisteredDate;
	private String content;
	private int status;
	private String image;
	private String userId;
	private int productNo;
	private int cateNo;
	private int viewCount;
	private String subject;
	private String delYN;
	
	public Question() {}
	
	public String getDelYN() {
		return delYN;
	}

	public void setDelYN(String delYN) {
		this.delYN = delYN;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}


	public int getQuestionNo() {
		return questionNo;
	}
	
	


	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public void setQuestionNo(int questionNo) {
		this.questionNo = questionNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getResisteredDate() {
		return resisteredDate;
	}

	public void setResisteredDate(Date resisteredDate) {
		this.resisteredDate = resisteredDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getProductNo() {
		return productNo ;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getCateNo() {
		return cateNo;
	}

	public void setCateNo(int cateNo) {
		this.cateNo = cateNo;
	};
	
	
 
}
