package com.bookstore.dto;

import java.util.Date;

public class OrderDto {

	private int orderNo;
	private String userId;
	private String userName;
	private int bookNo;
	private String bookTitle;
	private int amount;
	private int orderPrice;
	private Date registeredDate;
	private int writeReveiw;
	private int isLike;
	
	public OrderDto() {}
	
	public int getIsLike() {
		return isLike;
	}
	
	public void setIsLike(int isLike) {
		this.isLike = isLike;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getWriteReveiw() {
		return writeReveiw;
	}
	
	public void setWriteReveiw(int writeReveiw) {
		this.writeReveiw = writeReveiw;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public String getBookTitle() {
		return bookTitle;
	}

	public void setBookTitle(String bookTitle) {
		this.bookTitle = bookTitle;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}

	public Date getRegisteredDate() {
		return registeredDate;
	}

	public void setRegisteredDate(Date registeredDate) {
		this.registeredDate = registeredDate;
	}
	
	
	
}
