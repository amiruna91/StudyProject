package com.bookstore.dto;

import java.util.Date;

public class BoardDto {

	private int boardNo;
	private String title;
	private String writer;
	private String content;
	private int hit;
	private Date registeredDate;
	private int reply;
	
	public BoardDto() {}
	
	public int getHit() {
		return hit;
	}
	
	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public Date getRegisteredDate() {
		return registeredDate;
	}

	public void setRegisteredDate(Date registeredDate) {
		this.registeredDate = registeredDate;
	}

	public int getReply() {
		return reply;
	}

	public void setReply(int reply) {
		this.reply = reply;
	}
	
	
}
