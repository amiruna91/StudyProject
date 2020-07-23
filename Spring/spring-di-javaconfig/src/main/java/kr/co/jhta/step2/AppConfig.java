package kr.co.jhta.step2;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;

/*
 *  자바 기반 빈 설정
 *  	@Configuration
 *  		자바클래스가 빈 설정 정보를 포함하고 있는 자바 클래스임을 나타낸다.
 *  	@PropertySource("properties파일 경로")
 *  		읽어올 properties 파일의 경로를 지정한다.
 *  	@ComponentScan(basePackages= (["패키지명", "패키지명])
 *  		지정된 패키지에서 스프링 컨테이너가 생성/조립할 클래스를 스캔한다.
 *  	@Bean
 *  		어노테이션이 부착된 메서드가 반환하는 객체는 스프링 컨테이너가 관리한다.
 */
@Configuration
@PropertySource("classpath:/config/spring.properties")
@ComponentScan(basePackages= {"kr.co.jhta.sender", "kr.co.jhta.service"})
public class AppConfig {
	
	/*
	 *  <context:property-placeholder location="properties파일 경로"/> 태그와 마찬가지로
	 *  properties 파일정보를 읽어서 key/value값을 가지고 있는 객체를 생성한다.
	 *  properties 파일의 위치는 @PropertySource로 지정한다.
	 */
	@Bean
	public PropertySourcesPlaceholderConfigurer placeholderConfigurer() {
		return new PropertySourcesPlaceholderConfigurer();
	}
}
