package kr.co.jhta.di.service.step7;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		String conf = "kr/co/jhta/di/service/step7/context-step7.xml";
		ApplicationContext ctx = new GenericXmlApplicationContext(conf);
		
		EventNotificationServiceImpl event = ctx.getBean("EventNotificationServiceImpl", EventNotificationServiceImpl.class);
		
		event.noticeEvent("어린이날 특별 행사",	"어린이날 특별 할인을 시작합니다.");
	}
}
