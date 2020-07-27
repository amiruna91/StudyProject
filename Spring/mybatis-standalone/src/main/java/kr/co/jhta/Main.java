package kr.co.jhta;

import java.util.List;

import kr.co.jhta.dao.UserDao;
import kr.co.jhta.vo.User;

public class Main {

	public static void main(String[] args) {
		
		UserDao userDao = new UserDao();
		
//		User user1 = new User("hong2", "홍길동", "1234", "hong2@gmail.com");
//		userDao.insertUser(user1);
//		System.out.println("새 사용자 등록이 완료되었습니다.");
		
//		System.out.println("모든 사용자 조회하기");
//		List<User> users1 = userDao.getAllUsers();
//		for (User user : users1) {
//			System.out.println(user.getId() + ", " + user.getName());
//		}
//		System.out.println();
		
//		System.out.println("특정 아이디의 사용자 조회하기");
//		User user2 = userDao.getUserById("hong3");
//		System.out.println(user2);
//		if (user2 != null) {
//			System.out.println(user2.getId() + ", " + user2.getName() + ", " + user2.getEmail());			
//		} else {
//			System.out.println("지정된 아이디의 사용자정보가 존재하지 않습니다.");
//		}
		
//		System.out.println("전체 사용자 수 조회하기");
//		System.out.println("전체 사용자수: " + userDao.getUsersCount());
//		System.out.println();
		
//		System.out.println("전체 사용자 삭제하기");
//		userDao.deleteAllUsers();
//		System.out.println("모든 사용자가 삭제되었습니다.");

//		System.out.println("특정 아이디 사용자 삭제하기");
//		userDao.deleteUserById("hong3");
//		System.out.println("해당 사용자가 삭제되었습니다.");
		
//		System.out.println("특정 아이디 정보 업데이트 하기");
//		
//		userDao.updateUser(new User("hong", "홍길동", "zxcv1234", "hong@gmail.com"));
//		System.out.println("업데이트가 완료되었습니다.");
		
//		System.out.println("특정 이름으로 사용자 조회하기");
//		List<User> users4 = userDao.getUsersByNames("홍길동");
//		for (User user : users4) {
//			System.out.println(user.getId() + ", " + user.getName());
//		}
		
		System.out.println("특정 이메일로 사용자 조회하기");
		User user = userDao.getUserByEmail("hong2@gail.com");
		if (user != null) {
			System.out.println(user.getId() + ", " + user.getName() + ", " + user.getEmail());			
		} else {
			System.out.println("해당 사용자 정보가 없습니다.");
		}
	}
}
