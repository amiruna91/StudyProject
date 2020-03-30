package oop2_9;

// 추상 클래스 => (기획서데 대한) 미완성 설계도
// 모든 모니터가 공통으로 가지는 속성 혹은 기능을 구현함으로써 자식클래스의 구현부담을 갑소시킨다.
// 자식클래스마다 조금씩 다르게 구현되는 기능을 자식클래스에서 직접 재정의 하도록 한다.
// * 추상클래스에서 해당 기능을 별도로 구현하지 않고, 자식클래스에게 구현을 위임한다.
public abstract class AbstractMonitor implements Monitor{
	
	private boolean power;			// 멤버변수
	
	@Override
	public void on() {				// 인터페이스의 추상화된 메서드를 재정의한 멤버 메서드
		power = true;
		System.out.println("전원을 켭니다.");
	}
	
	@Override
	public void off() {				// 인터페이스의 추상화된 메서드를 재정의한 멤버 메서드
		power = false;
		System.out.println("전원을 끕니다.");
	}
	
	public boolean getPower() {		// 일반 멤버 메서드
		return power;
	}
	
	// Monitor 인터페이스의 void display() 기능의 구현은 자식 클래스에게 구현을 위임한다.

}
