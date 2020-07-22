package kr.co.jhta.di.vo;

public class User {

	private String id;
	private String name;
	private String tel;
	private String receiveType;
	
	public User() {}
	
	public User(String id, String name, String tel, String receiveType) {
		this.id = id;
		this.name = name;
		this.tel = tel;
		this.receiveType = receiveType;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getReceiveType() {
		return receiveType;
	}
	
	public void setReceiveType(String receiveType) {
		this.receiveType = receiveType;
	}
	
	
}
