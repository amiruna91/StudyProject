package kr.co.jhta.di.service.step7;

import java.util.List;

import kr.co.jhta.di.service.MessageSender;
import kr.co.jhta.di.vo.User;

public class EventNotificationServiceImpl implements EventNotificationService {

	private MessageSender messageSender;
	private UserService userService;
	
	public void setMessageSender(MessageSender messageSender) {
		this.messageSender = messageSender;
	}
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	@Override
	public void noticeEvent(String eventName, String eventContent) {

		// 사용자 정보를 조회해서 모든 사용자에게 이벤트 내용을 Sms로 발송 시킨다.
		List<User> userList = userService.getAllUser();
		
		for (User user : userList) {
			messageSender.send("중앙HTA학원", user.getName(), eventName, eventContent);
		}
	}
}
