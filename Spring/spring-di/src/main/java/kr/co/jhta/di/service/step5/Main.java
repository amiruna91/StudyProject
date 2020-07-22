package kr.co.jhta.di.service.step5;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		String conf = "kr/co/jhta/di/service/step5/context-step5.xml";
		// GenericXmlApplicationContext는 스프링 컨테이너 클래스다.
		// 1. 스프링 컨테이너는 빈 설정파일을 로드한다.
		// 2. 빈 설정파일에 정의된 모든 객체를 생성한다.
		// 3. 객체들간의 의존관계를 조사해서 객체들을 조립한다.
		// 4. 조립이 완료된 객체들을 보관/유지/관리한다.
		ApplicationContext ctx = new GenericXmlApplicationContext(conf);
		
		
		// 스프링 컨테이너가 보관중이 객체 꺼내기
		Reporter reporter = ctx.getBean("reporter", Reporter.class);
		
		// Reporter객체의 핵심기능 사용하기
		reporter.report("스프링 컨테이너 활용", 
					"스프링 컨테이너는 객체 생성/조립/보관/유지/관리를 담당하는 객체다.");
	}
}











