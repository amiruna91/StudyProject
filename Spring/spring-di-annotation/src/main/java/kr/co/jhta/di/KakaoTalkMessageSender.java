package kr.co.jhta.di;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component("kakao")
public class KakaoTalkMessageSender implements MessageSend {
	
	@Value("${message.sender.kakao.username}")
	private String username;
	@Value("${message.sender.kakao.password}")
	private String password;
	
	@PostConstruct
	public void connect() {
		System.out.println(username + ", " + password + " 접속정보로 카카오톡 대용량 서비스에 연결됨");
	}
	
	@PostConstruct
	public void disconnect() {
		System.out.println(username + " 접속을 해제함...");
	}
	
	@Override
	public void send(String from, String to, String subject, String content) {
		System.out.println("카톡 메세지를 보냄");
		System.out.println("카톡 발신자: " + from);
		System.out.println("카톡 수신자: " + to);
		System.out.println("메세지 제목: " + subject);
		System.out.println("메세지 내용: " + content);
		System.out.println("---------------------------------");
	}
}
