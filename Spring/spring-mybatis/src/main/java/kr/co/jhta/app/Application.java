package kr.co.jhta.app;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import kr.co.jhta.service.UserService;
import kr.co.jhta.vo.User;

public class Application {

	public static void main(String[] args) {
		String conf = "classpath:/spring/context.xml";
		ApplicationContext ctx = new GenericXmlApplicationContext(conf);
		
		// 스프링 컨테이너에서 UserService의 구현객체를 찾아오기
		// UserServiceImpl이 획득됨
		UserService userService = ctx.getBean(UserService.class);
		
		userService.addNewUser(new User("hong", "홍길동", "zxcv1234", "hong@gmail.com"));
		System.out.println("등록 완료");
	}
}
