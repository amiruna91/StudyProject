package kr.co.jhta.di.service.step2;

public class Main {

	public static void main(String[] args) {
		Reporter reporter = new Reporter();
		reporter.report("인터페이스 의존", "Reporter클래스는 지정된 인터페이스 타입의 객체를 사용한다.");
	}
}
