package kr.co.jhta.service;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import kr.co.jhta.dao.UserDao;
import kr.co.jhta.exception.DuplicatedUserException;
import kr.co.jhta.exception.UnauthenticatedUserException;
import kr.co.jhta.vo.User;

/*
 * @ContextConfiguration
 * 		- 테스트 대상 객체가 정의되어 있는 스프링 bean 설정파일의 경로를 지정하는 어노테이션이다.
 * @RunWith
 * 		- Junit 테스트가 실행될 때 같이 실해될 클래스 Helper클래스를 지정하는 어노테이션이다.
 * SpringJUnit4ClassRunner
 * 		- JUnit을 활용한 단위테스트 실행시 같이 실행되는 Helper 클래스다.
 * 		- @ContextConfiguration으로 지정된 설정파일을 읽어서
 * 			객체를 생성/조립하는 스프링 컨테이너를 생성한다.
 * 		- @Autowired 어노테이션을 사용해서 테스트 대상 객체를 주입받을 수 있도록 지원한다.
 * @Transactional
 * 		- 단위테스트 클래스에 @Transactional 어노테이션을 부착하면
 * 		  테스트 작업 과정에서 수행한 INSERT/UPDATE/DELETE작업을 Database에 반영시키지 않고,
 * 		  각 개별 테스트 메서드의 실행이 종료되면 즉시 rollback시킨다.
 * 		- 테스트 수행 후 테스트 과정에서 databse에 저장된 데이터를 직접 제거하지 않아도 된다.
 * 		- 데이터가 영구적으로 저장되지 않기 때문에 중복된 값의 충돌로 인한 
 * 		  테스트 중단이 발생하지 않는다.
 * 		- 테스트를 반복 수행할 수 있게 한다.
 */
@ContextConfiguration(locations = "classpath:/spring/context-test.xml")
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class UserServiceTest {

	@Autowired
	UserService userService;
	
	@Autowired
	UserDao userDao;
	
	@Test
	public void testConfituration() {
		System.out.println(userService);
		assertNotNull(userService);
	}
	
	@Test
	public void testAddNewUser() {
		User user = new User("hong4", "홍길동", "zxcv", "hong4@naver.com");
		userService.addNewUser(user);
		
		User savedUser = userDao.getUserById(user.getId());
		assertNotNull(savedUser);
		assertEquals("홍길동", savedUser.getName());
	}
	
	@Test(expected=DuplicatedUserException.class)
	public void testDuplicatedAddUser() {
		User user = new User("hong4", "홍길동", "zxcv", "hong4@naver.com");

		userService.addNewUser(user);
		userService.addNewUser(user);
		
	};
	
	@Test
	public void testLogin() {
		User user = userService.login("hong", "zxcv1234");
		
		assertNotNull(user);
	}
	
	@Test(expected=UnauthenticatedUserException.class)
	public void testLoginFail() {
		userService.login("hong", "1234");
	}
}























