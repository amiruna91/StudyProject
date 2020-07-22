package kr.co.jhta.di.service.step4;

public class Main {

	public static void main(String[] args) {
		// config.properties 파일의 설정정보를 읽어서
		// 필요한 객체를 생성하고, 객체들을 조립한다.
		// Factory는 객체 생성 및 객체간의 의존성 주입을 전담한다. 
		Factory factory = new Factory();
		
		Reporter reporter = factory.getBean("reporter", Reporter.class);
		reporter.report("의존성 주입", "설정파일을 이용한 객체 생성 및 조립");
	}
}
