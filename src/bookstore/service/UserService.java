package bookstore.service;

import bookstore.vo.User;

public class UserService {

	private User[] db = new User[100];
	private int position = 0;
	private int userSequence = 10001;
	
	public UserService() {
		User u1 = new User(userSequence++, "홍길동", "010-1111-2345", 100, false);
		User u2 = new User(userSequence++, "김유신", "010-2345-2423", 100, false);
		User u3 = new User(userSequence++, "강감찬", "010-3464-1231", 100, false);
		User u4 = new User(userSequence++, "이순신", "010-6567-2321", 100, false);
		User u5 = new User(userSequence++, "류관순", "010-2343-8643", 100, false);
		
		db[position++] = u1;
		db[position++] = u2;
		db[position++] = u3;
		db[position++] = u4;
		db[position++] = u5;
	}
	
	// 회원등록 기능
	// 회원정보를 전달받아서 db배열에 저장한다.
	public void insertUser(User user) {
		user.no = userSequence;
		
		db[position] = user;
		position++;
		userSequence++;
	}
	
	// 회원정보 조회 기능
	// 회원번호를 전달받아서 db배열에서 회원정보를 찾아 반환한다.
	public User findUserByNo(int no) {
		User result = null;
		
		for (int i = 0; i < position; i++) {
			if (no == db[i].no) {
				result = db[i];
			}
		}
		return result;
	}
	
	// 회원정보 수정 기능
	// 회원정보를 전달받아서 회원번호에 해당하는 회원의 정보를 db에서 검색해서 회원정보를 수정한다.
	public void updateUser(User user) {
		User u = findUserByNo(user.no);
		if (u != null) {
		u.name = user.name;
		u.tel = user.tel;
		} else {
			System.out.println("해당 회원의 정보가 없습니다.");
		}
	}
	
	// 전체 회원정보 조회기능
	// 전체 회원정보를 반환한다.
	public User[] getAllUsers() {
		
		return db;
	}
}









