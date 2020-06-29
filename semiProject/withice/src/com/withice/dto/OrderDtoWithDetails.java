package com.withice.dto;

import java.util.List;

public class OrderDtoWithDetails {

	private String userName;
	private String phoneNumber;
	private String mainAddress;
	private String subAddress;
	private List<OrderDetailWithProductName> details;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getMainAddress() {
		return mainAddress;
	}
	public void setMainAddress(String mainAddress) {
		this.mainAddress = mainAddress;
	}
	public String getSubAddress() {
		return subAddress;
	}
	public void setSubAddress(String subAddress) {
		this.subAddress = subAddress;
	}
	public List<OrderDetailWithProductName> getDetails() {
		return details;
	}
	public void setDetails(List<OrderDetailWithProductName> details) {
		this.details = details;
	}
	
	
}
