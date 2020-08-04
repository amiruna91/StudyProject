package kr.co.jhta.vo;

import java.util.Date;

public class Order {

	private long no;
	private String username;
	private String tel;
	private String status;
	private Date createdDate;
	
	public Order() {}

	public long getNo() {
		return no;
	}

	public void setNo(long no) {
		this.no = no;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	@Override
	public String toString() {
		return "Order [no=" + no + ", username=" + username + ", tel=" + tel + ", status=" + status + ", createdDate="
				+ createdDate + "]";
	}
}
