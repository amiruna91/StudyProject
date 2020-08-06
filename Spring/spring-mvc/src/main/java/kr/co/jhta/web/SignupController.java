package kr.co.jhta.web;

import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.jhta.form.UserForm;
import kr.co.jhta.service.UserService;
import kr.co.jhta.vo.User;


@Controller
@RequestMapping("/signup.do")
public class SignupController {

	@Autowired
	private UserService userService;
	
	@GetMapping
	public String form(Model model) {
		// 폼 입력값 검증을 위해서 폼입력값을 저장할 UserForm객체를 생성하고, Model에 저장한다.
		UserForm userForm = new UserForm();
		userForm.setBirth(new Date());
		model.addAttribute("userForm", userForm);
		return "form";
	}
	
	@PostMapping
	public String signup(@ModelAttribute("userForm") @Valid UserForm userForm, BindingResult errors) {
		
		System.out.println("유효성 체크결과 에러가 발견되었는가? " + errors.hasErrors());
		// 아이디 중복체크
		if (userService.getUserDetail(userForm.getId()) != null) {
			errors.rejectValue("id", null, "이미 사용중인 아이디 입니다.");
		}
	
		if (errors.hasErrors()) {
			return "form";	// 입력화면으로 내부이동하기
		}
		 
		// 유효성 체크를 통과한 입력값을 User객체에 복사한다.
		User user = new User();
		BeanUtils.copyProperties(userForm, user);
		
		// 회원가입 처리
		userService.addNewUser(user);
		
		return "redirect:/home.do";
	}
}
