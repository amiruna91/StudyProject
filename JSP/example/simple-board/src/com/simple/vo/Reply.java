package com.simple.vo;

import java.util.Date;

public class Reply {

	private int replyNo;
	private String writer;
	private String content;
	private String delYN;
	private Date createDate;
	private int boardNo;
	
	public Reply() {}
	
	public int getBoardNo() {
		return boardNo;
	}
	
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDelYN() {
		return delYN;
	}

	public void setDelYN(String delYN) {
		this.delYN = delYN;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
}
