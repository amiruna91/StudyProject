package com.withice.vo;

import java.sql.Date;

public class User {

	private String id;
	private String password;
	private String name;
	private String telephone;
	private String phone;
	private String snsCheck;
	private String email;
	private String gender;
	private String birth;
	private String location;
	private String grade;
	private Date registeredDate;
	private String admin;
	private int totalMileages;
	private int usableMileage;
	private int usedMileage;
	private String drop;
	
	public User() {}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getSnsCheck() {
		return snsCheck;
	}

	public void setSnsCheck(String snsCheck) {
		this.snsCheck = snsCheck;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public Date getRegisteredDate() {
		return registeredDate;
	}

	public void setRegisteredDate(Date registeredDate) {
		this.registeredDate = registeredDate;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public int getTotalMileages() {
		return totalMileages;
	}

	public void setTotalMileages(int totalMileages) {
		this.totalMileages = totalMileages;
	}

	public int getUsableMileage() {
		return usableMileage;
	}

	public void setUsableMileage(int usableMileage) {
		this.usableMileage = usableMileage;
	}

	public int getUsedMileage() {
		return usedMileage;
	}

	public void setUsedMileage(int usedMileage) {
		this.usedMileage = usedMileage;
	}

	public String getDrop() {
		return drop;
	}

	public void setDrop(String drop) {
		this.drop = drop;
	}
}
