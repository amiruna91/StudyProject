package com.simple.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.simple.vo.User;

public class LoginCheckFilter implements Filter {
	
	private String loginCheckURL;
	private String loginUncheckURL;

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		loginCheckURL = filterConfig.getInitParameter("checkURL");
		loginUncheckURL = filterConfig.getInitParameter("uncheckURL");
		
	}
	
	@Override
	public void destroy() {}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		// 전처리 작업
		HttpServletRequest httpReq = (HttpServletRequest) request;
		String requestURL = httpReq.getRequestURI();
		
		// 요청url이 로그인체크 url과 일치하는 경우
		if (requestURL.equals(loginCheckURL)) {				
			HttpSession session = httpReq.getSession();
			User user = (User) session.getAttribute("loginUser");
			// 세션에 loginUser정보가 존재하지 않으면 error.jsp로 이동시킨다.
			if (user == null) {
				httpReq.getRequestDispatcher("/WEB-INF/views/error.jsp").forward(request, response);;
				return;
			}
			
		}
		// 요청url과 로그인체크 url이 일치하지 않는경우
		// 로그인여부를 체크할 필요가 없으므로 다음번 필터나 서블릿을 실행한다.
		chain.doFilter(request, response);

		// 후처리 작업
	}
}
