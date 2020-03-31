package oop2_9;

public class NormalMonitor extends AbstractMonitor{

	// Monitor 인터페이스의 추상화된 메서드를 구현함
	@Override
	public void display() {
		if (!getPower()) {
			System.out.println("전원이 꺼져있습니다.");
			return;
		}
		
		System.out.println("컬러로 동영상을 표시합니다.");
	}

}
