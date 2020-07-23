package kr.co.jhta.di.step1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.di.SmsMessageSend;

@Service
public class EventNotificationServiceImpl implements NotificationService {

	@Autowired
	private SmsMessageSend smsMessageSend;
	
	public void setSmsMessageSend(SmsMessageSend smsMessageSend) {
		this.smsMessageSend = smsMessageSend;
	}
	
	@Override
	public void notice(String dept, String subject, String content) {
		smsMessageSend.send(dept, "모든 고객", subject, content);
	}
}
