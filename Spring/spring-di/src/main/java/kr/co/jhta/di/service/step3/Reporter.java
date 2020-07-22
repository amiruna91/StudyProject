package kr.co.jhta.di.service.step3;

import kr.co.jhta.di.service.Output;

public class Reporter {

	// Reporter객체가 의존하는 객체는 Output인터페이스를 구현한 객채다.
	// Output인터페이스를 구현한 객체를 직접 생성하지 않는다.
	private Output output;
	
	// Output인터페이스 타입의 객체를 전달받을 수 있는 setter 메소드를 정의한다.
	public void setOutput(Output output) {
		this.output = output;
	}
	
	public void report(String title, String text) {
		output.write("제목: " + title);
		output.write("내용: " + text);
	}
}
