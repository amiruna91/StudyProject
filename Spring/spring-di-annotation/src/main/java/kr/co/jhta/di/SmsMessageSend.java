package kr.co.jhta.di;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component("sms")
public class SmsMessageSend implements MessageSend {

	@Value("${message.sender.sms.company}")
	private String company;
	
	public void setCompany(String company) {
		this.company = company;
	}
	
	@Override
	public void send(String from, String to, String subject, String content) {
		System.out.println(this.company + "통신사를 이용합니다.");
		System.out.println("SMS 발신자: " + from);
		System.out.println("SMS 수신자: " + to);
		System.out.println("SMS 제목: " + subject);
		System.out.println("SMS 내용: " + content);
		System.out.println("---------------------------------");
	}
}
