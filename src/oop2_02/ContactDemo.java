package oop2_2;

public class ContactDemo {

	public static void main(String[] args) {
		
		Contact c1 = new Contact("홍길동", "010-1234-5432", "hong@naver.con");
		Contact c2 = new Contact("김유신", "010-3435-1232", "kimys@naver.con");
		Contact c3 = new Contact("강감찬", "010-4645-5632", "kanggc@naver.con");
		
		System.out.println(c1);
		System.out.println(c2);
		System.out.println(c3);
	}
}
