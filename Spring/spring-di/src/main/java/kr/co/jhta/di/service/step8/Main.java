package kr.co.jhta.di.service.step8;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		/*String conf = "kr/co/jhta/di/service/step8/context-step8.xml";
		
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext(conf);
		
		NoticeService noticeService = ctx.getBean("noticeService", NoticeService.class);
		
		noticeService.notice("경리팀", "급여삭감 안내", "임원급 이상 직원의 급여를 20% 삭감합니다.");
		
		ctx.destroy();*/
		
		String conf = "kr/co/jhta/di/service/step8/context-step8-map.xml";
		ApplicationContext ctx = new GenericXmlApplicationContext(conf);
		
		NoticeService noticeService = ctx.getBean("noticeService", NoticeService.class);
		noticeService.notice("인사팀", "인사이동 안내", "금일 오후2시에 인사이동 발표가 있습니다.");
	}
}
