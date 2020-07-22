package kr.co.jhta.di.service;

public interface MessageSender {

	void send(String from, String to, String subject, String content);
}
