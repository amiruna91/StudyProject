package kr.co.jhta.di.step1;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import kr.co.jhta.di.SmsMessageSend;

public class Main {

	public static void main(String[] args) {
		String conf = "classpath:/spring/context-step1.xml";
		ApplicationContext ctx = new GenericXmlApplicationContext(conf);
		
		/*SmsMessageSend smsMessageSend = ctx.getBean(SmsMessageSend.class);
		smsMessageSend.send("홍보부", "010-1212-1411", "창고 대방출", "사장님이 미쳤어요~~");*/
		
		EventNotificationServiceImpl ens = ctx.getBean(EventNotificationServiceImpl.class);
		ens.notice("영업부", "특가할인", "1+1 할인 이벤트 시작");
	}
}
