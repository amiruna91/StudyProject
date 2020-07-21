package kr.co.jhta.di.service.step4;

import kr.co.jhta.di.service.Output;

public class Reporter {

	
	private Output output;
	
	public void setOutput(Output output) {
		this.output = output;
	}
	
	public void report(String title, String text) {
		output.write("제목: " + title);
		output.write("내용: " + text);
	}
}
