package kr.co.jhta.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.jhta.vo.User;

// 인증된 사용자가 해당 페이지에 대한 접근권한을 가지고 있는지 체크한다.
public class AuthorizationInterceptor extends HandlerInterceptorAdapter {

	@SuppressWarnings("unchecked")
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		// 인증과정 통과여부를 조회한다.
		// 통과여부가 skip인 경우는 접근권한 체크
		String auth = (String) request.getAttribute("auth");
		
		// 인증과정 통과여부가 skip인 경우
		//		- 접근권한이 필요없는 요청임
		//		- 로그인 여부, 접근권한 소유여부를 체크할 필요가 없음
		
		// 인증과정 통과여부가 pass인 경우 
		//		- 접근권한이 필요한 요청임
		//		- 로그인된 사용자임
		//		- 로그인된 사용자가 필요한 접근권한을 가지고 있는지 체크해야함
		if ("pass".equals(auth)) {
			List<String> reqRoles = (List<String>) request.getAttribute("reqRoles");
			List<String> hasRoles = (List<String>) request.getAttribute("hasRoles");
			
			if (!canAccess(reqRoles, hasRoles)) {
				response.sendRedirect("/signin.do?error=role");
				return false;
			}
		}
		
		return true;
	}
	
	private boolean canAccess(List<String> reqRoles, List<String> hasRoles) {
		
		for (String role : hasRoles) {
			if (reqRoles.contains(role)) {
				return true;
			}
		}
		return false;
	}
}
