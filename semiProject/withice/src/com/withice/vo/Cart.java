package com.withice.vo;

import java.util.Date;

public class Cart {

	private int cartNo;
	private int productNo;
	private int productAmount;
	private String userId;
	private Date cartRegisteredDate;
	private String cartType;
	public Cart () {}

	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getProductAmount() {
		return productAmount;
	}

	public void setProductAmount(int productAmount) {
		this.productAmount = productAmount;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getCartRegisteredDate() {
		return cartRegisteredDate;
	}

	public void setCartRegisteredDate(Date cartRegisteredDate) {
		this.cartRegisteredDate = cartRegisteredDate;
	}

	public String getCartType() {
		return cartType;
	}

	public void setCartType(String cartType) {
		this.cartType = cartType;
	}
	
	
}
