package kr.co.jhta.resolver;

import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import kr.co.jhta.vo.User;

/*
 * HandlerMethodArgumentResolver
 * 		- 요청핸들러 메서드의 매개변수를 분석하는 객체가 구현하는 인터페이스다.
 * 		- HandlerMetohdArgumentResolver를 구현해서 사용자정의 ArgumentResolver를
 * 		  정의하면, 요청핸들러 메서드 실행시 필요한 객체를 ArgumentResolver를 통해서
 * 		  제공받을 수 있다.
 * 		- 예)
 * 			* 로그인한 사용자정보가 필요한 요청핸들러 메서드에서 세션에 저장된 로그인 사용자
 * 		 	정보가 보관된 객체를 제공하는 ArgumentResolver를 정의할 수 있다.
 */
public class UserArgumentResolver implements HandlerMethodArgumentResolver {
	
	// * 요청핸들러 메서드의 매개변수가 사용자가 지정한 타입의 매개변수와 일치하면
	//	 true를 반환하는 메서드다.
	// * 이 메서드가 true를 반환하면 아래의 resolverArgument()가 실행된다.
	@Override
	public boolean supportsParameter(MethodParameter parameter) {
		return parameter.getParameterType() == User.class;
	}

	// * resolveArgument() 메서드가 반환하는 객체가
	//	 매개변수로 전달된다.
	// * UserArgumentResolver는 요청핸들러 메서드의 매개변수 타입이 User인
	//	 변수가 있으면, 세션에 LOGIN_USER로 등록된 객체를 찾아서 반환한다.
	@Override
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
			NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		
		// supportsParameter() 메서드가 true값을 반환하면
		// 요청 핸들러 메서드에 User타입의 매개변수가 선언되어 있음을 나타낸다.
		// 해당 매개변수가 필요로 하는 User객체를 세션에서 찾아서 반환한다.
		User user = (User) webRequest.getAttribute("LOGIN_USER", NativeWebRequest.SCOPE_SESSION);
		return user;
	}

}
