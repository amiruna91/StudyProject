package kr.co.jhta.web;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.jhta.form.LoginForm;
import kr.co.jhta.service.UserService;
import kr.co.jhta.vo.User;


@Controller
@SessionAttributes("LOGIN_USER")
public class SignInOutController {
	
	@Autowired
	private UserService userService;

	@GetMapping("/signin.do")
	public String signIn(Model model) {
		LoginForm loginForm = new LoginForm();
		model.addAttribute("loginForm", loginForm);
		
		return "loginform";
	}
	
	@PostMapping("/signin.do")
	public String login(@ModelAttribute("loginForm") @Valid LoginForm loginForm,
			BindingResult errors, Model model) {
		
		if (errors.hasErrors()) {
			return "loginform";
		}
		
		//로그인 처리
		User user = userService.login(loginForm.getUserId(), loginForm.getUserPwd());
		if (user == null) {
			return "redirect:/signin.do?error=fail";
		}
		
		// 로그인된 사용자 정보를 세션에 저장한다.
		model.addAttribute("LOGIN_USER", user);
	
		return "redirect:/home.do";
	}
	
	@GetMapping("/signout.do")
	public String signout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		
		return "redirect:/home.do";
	}
}
