package kr.co.jhta.form;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;

public class UserForm {

	@NotBlank(message="아이디는 필수입력값입니다.")
	@Length(min=5, message="아이디는 5글자 이상입니다.")
	@Pattern(regexp="^[a-zA-Z0-9]{5,}$", message="아이디는 영어대소문자, 숫자로만 구성되어야 합니다.")
	private String id;
	
	@NotBlank(message="이름은 필수입력값입니다.")
	@Length(min=2, message="이름은 2글자 이상입니다.")
	@Pattern(regexp="^[가-힣]{2,}$", message="이름은 한글로 구성해야 합니다.")
	private String name;
	
	@NotBlank(message="비밀번호는 필수입력값입니다.")
	@Length(min=8, message="비밀번호는 8글자 이상입니다.")
	private String password;
	
	@NotBlank(message="이메일은 필수입력값입니다.")
	@Email(message="유효한 이메일 형식이 아닙니다.")
	private String email;
	
	@NotBlank(message="전화번호는 필수입력값입니다.")
	@Pattern(regexp="^\\d{3}-\\d{3,4}-\\d{4}$", message="유효한 전화번호가 아닙니다.")
	private String tel;
	
	@Min(value=19, message="19세 이상만 가입할 수 있습니다.")
	private int age;
	
	@Past(message="생일은 오늘 이전 날짜만 가능합니다.")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birth;
	
	public UserForm() {}

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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}
	
	
}
