package com.withice.vo;

import java.util.Date;

public class Mileage {

	private int no;
	private String content;
	private Date registeredDate;
	private String userId;
	private int getMileage;
	private int mileageOrder;
	
	public Mileage() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getGetMileage() {
		return getMileage;
	}

	public void setGetMileage(int getMileage) {
		this.getMileage = getMileage;
	}

	public int getMileageOrder() {
		return mileageOrder;
	}

	public void setMileageOrder(int mileageOrder) {
		this.mileageOrder = mileageOrder;
	}
}
