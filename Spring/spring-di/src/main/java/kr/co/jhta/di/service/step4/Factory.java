package kr.co.jhta.di.service.step4;

import java.io.FileReader;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import kr.co.jhta.di.service.FileOutput;
import kr.co.jhta.di.service.Output;

public class Factory {

	private Map<String, Object> beanMap = new HashMap<>();
	
	public Factory() {
		createBean();
	}
	
	private void createBean() {
		try {
			// config.properties 설정파일 정보 읽기
			System.out.println("config.properties 파일을 읽습니다.");
			Properties prop = new Properties();
			prop.load(new FileReader("src/main/java/kr/co/jhta/di/service/step4/config.properties"));
			
			String reporterClassName = prop.getProperty("reporter.className");
			String outputClassName = prop.getProperty("outputer.className");
			System.out.println("리포트클래스명: " + reporterClassName);
			System.out.println("아웃풋클래스명: " + outputClassName);
			
			System.out.println("객체를 생성합니다.");
			Reporter reporter = (Reporter) Class.forName(reporterClassName).newInstance();
			Output output = (Output) Class.forName(outputClassName).newInstance();
			System.out.println("["+reporter+", "+output+"]");
			
			// output에 FileOutput객체가 생성되어있는 경우
			if (output instanceof FileOutput) {
				String directory = prop.getProperty("directory");
				String filename = prop.getProperty("filename");
				FileOutput fileOutput = (FileOutput) output;
				fileOutput.setDirectory(directory);
				fileOutput.setFilename(filename);				
			}			
			
			System.out.println("의존성을 주입합니다.");
			reporter.setOutput(output);
			
			System.out.println("생성된 객체를 보관합니다.");
			beanMap.put("reporter", reporter);
			beanMap.put("output", output);
			
			System.out.println("생성된 객체 ---> " + beanMap);
			
			System.out.println("객체 생성 및 조립이 완료되었습니다.");
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
	public Object getBean(String name) {
		return beanMap.get(name);
	}
	
	@SuppressWarnings("unchecked")
	public <T> T getBean(String name, Class<T> c) {
		return (T) beanMap.get(name);
	}
	
}









