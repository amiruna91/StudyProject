package com.withice.dto;


public class RecentlyDetailDto {

	private int recentlyNo;
	private String productThumbnail;
	private String productName;
	private String productComment;
	private int productPrice;
	private int productNo;
	private int cateNo;
	
	public RecentlyDetailDto () {}

	public int getRecentlyNo() {
		return recentlyNo;
	}

	public void setRecentlyNo(int recentlyNo) {
		this.recentlyNo = recentlyNo;
	}

	public String getProductThumbnail() {
		return productThumbnail;
	}

	public void setProductThumbnail(String productThumbnail) {
		this.productThumbnail = productThumbnail;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductComment() {
		return productComment;
	}

	public void setProductComment(String productComment) {
		this.productComment = productComment;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getCateNo() {
		return cateNo;
	}

	public void setCateNo(int cateNo) {
		this.cateNo = cateNo;
	}

	
}
