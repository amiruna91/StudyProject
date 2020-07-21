package kr.co.jhta.di.service;

public class ConsoleOutput implements Output {
	@Override
	public void write(String text) {

		System.out.println(text);
	}
}
