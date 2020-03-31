package oop1_2;

public class MyMethod {

	// 인스턴스 변수, 멤버면수
	String name;
	
	// 클래스변수, 정적변수
	static final double PI = 3.14;
	
	// 인스턴스 메서드
	// 인스턴스변수, 클래스변수 모두 사용 가능
	void memberMethod() {
		System.out.println("인스턴스변수 사용: " + name);
		System.out.println("클래스변수 사용: " + MyMethod.PI);
	}	
	
	// 인스턴스메서드
	// 인스턴스 메서드,  클래스 메서드 모두 사용가능
	void memberMethod2() {
		memberMethod();
		MyMethod.staticMethod();
	}
	// 클래스 메서드, 정적메서드
	// 인스턴스변수 사용불가, 클래스변수 사용 가능
	static void staticMethod() {
		//system.out.println("인스턴스변수 사용: " + name);    <-- 사용 불가능
		System.out.println("클래스변수 사용: " + MyMethod.PI);
	}
	
	// 클래스메서드, 정적메서드
	// 인스턴스메서드, 사용불가, 클래스 메서드 사용가능
	static void staticMethod2() { 
		//memberMethod();		<-- 사용 불가능
		MyMethod.staticMethod();
	}
}
