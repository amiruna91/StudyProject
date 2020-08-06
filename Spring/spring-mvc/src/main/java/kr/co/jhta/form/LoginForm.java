package kr.co.jhta.form;

import javax.validation.constraints.NotBlank;

public class LoginForm {

	@NotBlank(message="아이디는 필수입력값입니다.")
	private String userId;
	@NotBlank(message="비밀번호는 필수입력값입니다.")
	private String userPwd;
	
	public LoginForm() {}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	
	
}
