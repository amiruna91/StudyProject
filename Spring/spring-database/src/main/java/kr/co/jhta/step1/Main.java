package kr.co.jhta.step1;

import javax.sql.DataSource;

import org.springframework.context.support.GenericXmlApplicationContext;

public class Main {

	public static void main(String[] args) {
		String conf = "classpath:/spring/context.xml";
		
		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext(conf);
		
		DataSource ds = ctx.getBean(DataSource.class);
		System.out.println("커넥션 풀 객체: " + ds);
	}
}
