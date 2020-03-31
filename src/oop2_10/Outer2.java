package oop2_10;

public class Outer2 {

	int x;
	static int y;
	void m1() {
		Inner2 i = new Inner2();	// 외부 클래스의 멤버 메서드에서 내부클래스 사용가능
	}
	static void m2() {
		Inner2 i = new Inner2();	// 외부 클래스의 클래스 메서드에서 내부클래스 사용가능
	}
	
	static class Inner2 {
		int a;
		static int b;			// 클래스변수의 선언이 가능
		void m3() {}
		static void m4() {}		// 클래스 메서드의 선언이 가능하다
		void m5() {
//			System.out.println(x);			// 멤버변수 사용 불가능
			System.out.println(Outer2.y);	// 멤버메서드 사용 불가능
//			m1();
			Outer2.m2();
		}
	}
}
