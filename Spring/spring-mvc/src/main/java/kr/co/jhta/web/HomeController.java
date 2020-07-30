package kr.co.jhta.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping("/home.do")
	public String home(Model model) {
		model.addAttribute("message", "안녕하세요.");
		model.addAttribute("notice", "정식오픈은 다음 주 월요일입니다.");
		
		return "home";
	}
}
