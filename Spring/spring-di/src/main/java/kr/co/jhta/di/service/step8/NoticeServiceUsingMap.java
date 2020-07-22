package kr.co.jhta.di.service.step8;

import java.util.List;
import java.util.Map;

import kr.co.jhta.di.service.MessageSender;
import kr.co.jhta.di.service.step7.UserService;
import kr.co.jhta.di.vo.User;

public class NoticeServiceUsingMap implements NoticeService {

	private Map<String, MessageSender> messageSenders;
	private UserService userService;
	
	public void setMessageSender(Map<String, MessageSender> messageSenders) {
		this.messageSenders = messageSenders;
	}
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	@Override
	public void notice(String dpet, String subject, String content) {
		List<User> users = userService.getAllUser();
		
		for (User user : users) {
			System.out.println("수신방식: " + user.getReceiveType());
			// 수신방식에 맞는 메세지 발신객체를 Map객체에서 꺼낸다.
			MessageSender messageSender = messageSenders.get(user.getReceiveType());
			// 획득된 메세지 발신객체를 사용해서 메세지를 발송한다.
			messageSender.send(dpet, user.getTel(), subject, content);
		}	
	}
}
