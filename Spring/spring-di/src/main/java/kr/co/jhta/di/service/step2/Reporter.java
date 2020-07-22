package kr.co.jhta.di.service.step2;

import kr.co.jhta.di.service.ConsoleOutput;
import kr.co.jhta.di.service.FileOutput;
import kr.co.jhta.di.service.Output;

public class Reporter {

	// 구체적인 구현클래스가 아닌 인터페이스 타입의 변수를 선언한다.
	// 해당 인터페이스를 구현한 객체를 직접 생성한다.
	private Output output = new FileOutput("c:/temp", "step2.txt"); //new ConsoleOutput();
	
	public void report(String title, String text) {
		// 인터페이스에 정의된 표준화된 기능만을 사용해서 코드를 작성하였다.
		output.write("제목: " + title);
		output.write("내용: " + text);
	}
}
