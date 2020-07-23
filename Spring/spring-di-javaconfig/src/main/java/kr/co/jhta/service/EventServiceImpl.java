package kr.co.jhta.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.sender.MessageSender;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	private MessageSender messageSender;
	
	public void setMessageSender(MessageSender messageSender) {
		this.messageSender = messageSender;
	}
	
	@Override
	public void notice(String dept, String subject, String content) {
		messageSender.send(dept, "전 고객", subject, content);
	}
}
