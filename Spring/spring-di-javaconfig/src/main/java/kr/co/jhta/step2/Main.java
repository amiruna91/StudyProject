package kr.co.jhta.step2;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import kr.co.jhta.service.EventService;

public class Main {

	public static void main(String[] args) {
		AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext();
		ctx.register(AppConfig.class);	// java-based 설정정보가 포함된 자바클래스 등록
		ctx.refresh();					// 스프링 컨테이너를 갱신
		
		EventService service = ctx.getBean(EventService.class);
		service.notice("경리부", "급여관련", "8월 15일이 토요일이기 때문에 14일날 급여가 입금됩니다.");
	}
}
