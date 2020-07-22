package kr.co.jhta.di.service.step8;

import java.util.List;
import java.util.Set;

import kr.co.jhta.di.service.MessageSender;
import kr.co.jhta.di.service.step7.UserService;
import kr.co.jhta.di.vo.User;

/**
 * 사용가능한 모든 MessageSender류 객체를 이용해서 공지사항을 전달하는 기능을 제공
 * @author USER
 *
 */
public class NoticeServiceUsingSet implements NoticeService {

	private Set<MessageSender> messagesenders;
	private UserService userService;
	
	public void setMessagesenders(Set<MessageSender> messagesenders) {
		this.messagesenders = messagesenders;
	}
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	@Override
	public void notice(String dpet, String subject, String content) {
		List<User> users = userService.getAllUser();

		for (MessageSender messageSender : messagesenders) {
			System.out.println("사용중인 MessageSender 구현객체: " + messageSender);
			for (User user : users) {
				messageSender.send(dpet, user.getTel(), subject, content);				
			}
		}
	}
}
