package kr.co.jhta.di.service.step7;

import java.util.ArrayList;
import java.util.List;

import kr.co.jhta.di.vo.User;

public class UserServiceImpl implements UserService {

	@Override
	public List<User> getAllUser() {
		List<User> userList = new ArrayList<User>();

		userList.add(new User("hong", "홍길동", "010-1012-1212", "sms"));
		userList.add(new User("kim", "김유신", "010-1201-0123", "katalk"));
		userList.add(new User("lee", "이순신", "010-4214-1231", "sms"));
		userList.add(new User("lyu", "류관순", "010-1212-1512", "sms"));
		userList.add(new User("kang", "강감찬", "010-1211-2312", "katalk"));
		
		return userList;
	}
}
