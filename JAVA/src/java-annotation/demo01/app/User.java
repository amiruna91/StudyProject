package demo01.app;

import demo01.annotation.NotNull;

public class User {

	@NotNull(message = "이름은 필수입력값입니다.")
	String name;
	
	@NotNull(message = "이메일은 필수입력값입니다.")
	String email;
	
	String tel;
	
	public User() {}

	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public String getTel() {
		return tel;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
}
