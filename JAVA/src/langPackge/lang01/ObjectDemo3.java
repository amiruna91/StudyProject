package lang01;

import java.util.Date;

public class ObjectDemo3 {

	public static void main(String[] args) {
		User user1 = new User(10, "홍길동", "010-1234-4567");
		User user2 = new User(20, "강감찬", "010-4240-1240");
		
		// 참조변수를 출력하면
		// Object의 toString() 메서드 실행결과가 출력된다.
		// Object의 toString() 메서드는 "클래스명@해시코드"를 반환한다.
		// Object의 toString() 메서드를 재정의해서 객체의 멤버변수(속성값)값을 텍스트로
		// 반환하도록 하는 경우가 많다.
		System.out.println(user1);
		System.out.println(user1.toString());
		
		System.out.println(user2);
		System.out.println(user2.toString());
		
		// Date객체더 Object의 toString()을 재정의했다.
		Date today = new Date();
		System.out.println(today);	// Thu Apr 02 15:43:07 KST 2020
	}
}
