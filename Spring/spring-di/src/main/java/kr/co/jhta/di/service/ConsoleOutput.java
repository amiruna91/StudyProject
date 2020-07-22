package kr.co.jhta.di.service;

/*
 * 텍스트를 화면에 출력한다.
 */
public class ConsoleOutput implements Output {

	@Override
	public void write(String text) {
		System.out.println(text);
	}
}
