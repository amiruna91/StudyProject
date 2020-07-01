package com.simple.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("FrontController.service(req, res) 실행됨...");
		
		// 한글처리를 위한 인코딩방식 저장하기
		req.setCharacterEncoding("utf-8");
		
		// 클라이언트의 요청 분석하기.
		String requestURI = req.getRequestURI();
		requestURI = requestURI.replace("/webmvc", "");
		System.out.println("요청 URI: " + requestURI);
		
		
		try {
			Controller controller = null;
			// 요청URI에 해당하는 요청을 처리할 적절한 Controller객체 생성하기
			if ("/home.hta".equals(requestURI)) {
				controller = new HomeController();
			} else if ("/list.hta".equals(requestURI)) {
				controller = new ListController();
			} else if ("/detail.hta".equals(requestURI)) {
				controller = new DetailController();
			} else if ("/form.hta".equals(requestURI)) {
				controller = new FormController();
			}  else if ("/add.hta".equals(requestURI)) {
				controller = new AddController();
			} else {
				controller = new HomeController();
			}
			
			// xxxController의 process(req, res) 메서드 실행해서 요청처리하고,
			// 이동할 뷰 페이지 이름 제공받기
			String path = controller.process(req, res);
			
			if (path.startsWith("redirect:")) {
				// 재요청 URI를 응답으로 제공
				path = path.replace("redirect:", "");
				res.sendRedirect(path);
			} else {
				// 내부이동
				req.getRequestDispatcher("/WEB-INF/views/" + path).forward(req, res);
			}
			
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
}
