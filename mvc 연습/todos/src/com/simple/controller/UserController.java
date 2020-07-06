package com.simple.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.simple.service.UserService;
import com.simple.vo.User;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;
import kr.co.jhta.mvc.view.JSONView;

@Controller
public class UserController {

	private JSONView jsonView = new JSONView();
	private UserService userService = new UserService();
	
	// 회원가입 요청을 처리하는 요청핸들러 메서드를 구현한다.
	@RequestMapping("/register.hta")
	public ModelAndView registerUser(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 요청 파리미터값 조회
		String name = req.getParameter("name");
		String id = req.getParameter("id");
		String password = req.getParameter("pwd");
		String email = req.getParameter("email");
		
		// User객체를 생성해서 값 저장
		User user = new User();
		user.setId(id);
		user.setName(name);
		user.setPassword(password);
		user.setEmail(email);
		// UserService의 addNewUser(User user)를 실행한다.
		boolean isSuccess = userService.addNewUser(user);
		
		// ModelAndView객체를 생성하고,
		// addUser의 반환값을 ModelAndView에 담는다.
		// mav.addAttribue("result", 반환값);
		// JSON 응답을 제공하기 위해서 ModelAndView에 JSONView객체를 담는다.
		// ModelAndView를 반환한다.
		ModelAndView mav = new ModelAndView();
		mav.addAttribute("result", isSuccess);
		mav.setView(jsonView);	// 클라이언트에 jsonText 응답을 제공
		// {"result":true} 혹은 {"result":false} JSON텍스트가 응답으로 제공된다. 
		
		return mav;
	}
	
	@RequestMapping("/login.hta")
	public ModelAndView login(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 요청파라미터 정보를 조회한다.
		// UserService의 loginCheck(String id, String password)를 실행한다.
		// 반환값이 null이면 ModelAndView에 result -> false를 저장한다.
		// 반환값이 null이 아니면 ModelAndView에 result -> true를 저정한다.
		// 						  HttpSession객체를 획득해서 "loginUser"라는 
		// 						  속성명으로 사용자 정보를 세션에 저장한다.
		String id = req.getParameter("userid");
		String password = req.getParameter("userpwd");
		boolean isSuccess = false;
		User user = userService.loginCheck(id, password);
		
		if (user != null) {
			isSuccess = true;
		}
		
		HttpSession session = req.getSession();
		session.setAttribute("loginUser", user);
		
		ModelAndView mav = new ModelAndView();
		mav.addAttribute("result", isSuccess);
		mav.setView(jsonView);
		
		return mav;
	}
	
	@RequestMapping("/logout.hta")
	public ModelAndView logout(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession(false);
		
		if (session != null) {
			session.invalidate();
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/home.hta");
		
		return mav;
		
	}
}
