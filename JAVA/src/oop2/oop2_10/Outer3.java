package oop2_10;

public class Outer3 {

	int x;
	static int y;
	void m1() {}
	static void m2() {}
	
	void m3() {
		
		int a = 10;			// 값이 한번도 변하지 않았다.
		int b = 10;
		final int c = 10;	// 원래 값을 바꾸지 못한다.
		
		b = 20;				// 값이 변경된 적이 있다.
		
		class Inner3 {
			int 가;
//			static int 나;			// 클래스변수를 정의할 수 없다.
			void m4() {}
//			static void m5() {}		// 클래스메서드를 정의할 수 없다.
			
			void m6() {
				System.out.println(x);	// 외부클래스의 멤버변수
				System.out.println(y);	// 외부클래스의 클래스변수
				m1();					// 외부클래스의 멤버메서드
				Outer3.m2();			// 외부클래스의 클래스메서드
				System.out.println(a);	// 내부클래스가 정의된 메서드의 변수
//				System.out.println(b);	// 내부클래스가 정의된 메서드의 변수가 값이 변하면 접근안됨
				System.out.println(c);	// 내부클래스가 정의된 메서드의 상수
			}
		}
	}
}
