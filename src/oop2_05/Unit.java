package oop2_05;

// 추상클래스 정의
public abstract class Unit {

	String name;
	
	void move() {
		System.out.println("[" + name + "] 이 지정된 포인트로 이동합니다.");
	}
	
	// 추상메서드 정의
	abstract void attack();
}
