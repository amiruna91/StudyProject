package kr.co.jhta.di.service.step3;

import kr.co.jhta.di.service.ConsoleOutput;
import kr.co.jhta.di.service.FileOutput;

public class Main {

	public static void main(String[] args) {
		/*
		 * 1. Reporter객체는 더이상 자신이 의존하는 객체를 생성하지 않는다.
		 * 2. Reporter객체는 어떤 종류의 객체가 필요한지 그리고, 필요한 객체를
		 *    전달받는 setter 메소드를 가지고 있다.
		 * 3. Reporter의 주요 기능을 사용하기 위해서는 반드시 Reporter객체가 의존하는
		 *    객체를 제공해 줄 필요가 있다.
		 * 4. Reporter객체는 더이상 의존하는 객체에 대한 생성 책임이 없어지고,
		 *    Reporter객체를 이용하는 제 3자에게 Reporter객체가 의존하는 객체를 
		 *    생성하고, Reporter객체에게 제공할 책임이 있다.
		 */
		
		// 프로그램 실행에 필요한 객체 생성
		ConsoleOutput consoleOutput = new ConsoleOutput();
		FileOutput fileOutput = new FileOutput("c:/temp", "step3.txt");
		Reporter reporter = new Reporter();
		
		// 프로그램 실행에 필요한 객체들끼리 조립
		// Reporter객체가 의존하는 Output객체류가 Reporter객체에게 제공되는 순간이다.
		// Reporter객체에게 의존성이 주입되었다.
		reporter.setOutput(fileOutput);
		
		// 실제 작업 수행
		reporter.report("인터페이스 의존", "직접 의존하는 객체를 생성하지 않는다.");
	}
}
