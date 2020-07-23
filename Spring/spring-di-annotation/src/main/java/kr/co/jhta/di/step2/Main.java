package kr.co.jhta.di.step2;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		String conf = "classpath:/spring/context-step2.xml";
		ApplicationContext ctx = new GenericXmlApplicationContext(conf);
		AlarmServiceImpl alarm =  ctx.getBean(AlarmServiceImpl.class);
		
		alarm.alarm("코로나 확진자 증가 추세");
	}
}
