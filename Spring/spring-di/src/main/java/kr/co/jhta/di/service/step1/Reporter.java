package kr.co.jhta.di.service.step1;

import kr.co.jhta.di.service.ConsoleOutput;
import kr.co.jhta.di.service.FileOutput;

public class Reporter {

	// 화면출력을 지원하는 ConsoleOutput객체를 생성하였음
	//private ConsoleOutput consoleOutput = new ConsoleOutput();
	
	private FileOutput fileOutput = new FileOutput("c:/temp", "sample.txt");
	
	public void report(String title, String text) {
		//consoleOutput.write("제목: " + title);
		//consoleOutput.write("내용: " + text);
		
		fileOutput.write("제목: " + title);
		fileOutput.write("내용: " + text);
	}
}
