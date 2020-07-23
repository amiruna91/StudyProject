package kr.co.jhta.sender;

public interface MessageSender {

	void send(String from, String to, String subject, String content);
}
