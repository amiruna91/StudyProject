package kr.co.jhta.step1;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import kr.co.jhta.service.EventService;

public class Main {

	public static void main(String[] args) {
		
		/*
		 * AnnotationConfigApplicationContext
		 * 		- Java-Based 빈 설정을 사용해서 객체를 생성/조립하는 스프링 컨테이너다.
		 * 		- JavaConfig.class는 @Bean 어노테이션을 사용해서 프로그램 실행에 필요한
		 * 		  객체를 반환하는 메서드가 정의되어 있는 클래스다.
		 * 		- 스프링 컨테이너는 JavaConfig.class의 어노테이션 정보를 분석해서
		 * 		  해당 메서드가 반환하는 객체들을 스프링 컨테이너의 빈(관리되는 객체)으로
		 * 		  등록한다.
		 */
		ApplicationContext ctx = new AnnotationConfigApplicationContext(JavaConfig.class);
		EventService service = ctx.getBean(EventService.class);
		
		service.notice("홍보팀", "할인행사", "사장님이 미쳤어요~");
	}
}
