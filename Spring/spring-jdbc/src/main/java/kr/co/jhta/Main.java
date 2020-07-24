package kr.co.jhta;

import java.util.List;
import java.util.Scanner;

import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.dao.DataAccessException;

import kr.co.jhta.dao.UserDao;
import kr.co.jhta.vo.User;

public class Main {

	public static void main(String[] args) {
		String conf = "classpath:/spring/context.xml";

		GenericXmlApplicationContext ctx = new GenericXmlApplicationContext(conf);
		UserDao userDao = ctx.getBean(UserDao.class);

		Scanner scanner = new Scanner(System.in);

		try {
			while (true) {
				System.out.println("[사용자 관리]");
				System.out.println("-------------------------------------------------------------------------------");
				System.out.println("1.전체조회 2.조회(아이디) 3.조회(이름) 4.등록 5.삭제(아이디) 6.전체삭제 0.종료");
				System.out.println("-------------------------------------------------------------------------------");

				System.out.print("메뉴 선택 > ");
				int menuNo = scanner.nextInt();

				if (menuNo == 1) {
					System.out.println("[전체 조회]");
					List<User> users = userDao.getAllUser();
					for (User user : users) {
						System.out.println("아이디: " + user.getId());
						System.out.println("이   름:" + user.getName());
						System.out.println("비밀번호: " + user.getPassword());
						System.out.println("이메일: " + user.getEmail());
					}
				} else if (menuNo == 2) {
					System.out.println("[아이디로 조회]");
					
					System.out.print("아이디를 입력> ");
					String userId = scanner.next();
					
					User user = userDao.getUserById(userId);
					System.out.println("아이디: " + user.getId());
					System.out.println("이   름:" + user.getName());
					System.out.println("비밀번호: " + user.getPassword());
					System.out.println("이메일: " + user.getEmail());
					
				} else if (menuNo == 3) {
					System.out.println("[이름으로 조회]");

				} else if (menuNo == 4) {
					System.out.println("[신규 사용자 등록]");

					System.out.print("아이디 입력> ");
					String id = scanner.next();
					System.out.print("이름 입력> ");
					String name = scanner.next();
					System.out.print("비밀번호 입력> ");
					String password = scanner.next();
					System.out.print("이메일 입력> ");
					String email = scanner.next();

					userDao.insertUser(new User(id, name, password, email));
					System.out.println("<<사용자 등록 완료>>");
				} else if (menuNo == 5) {
					System.out.println("[아이디로 삭제]");

				} else if (menuNo == 6) {
					System.out.println("[전체 삭제]");

				} else if (menuNo == 0) {
					ctx.destroy();
					System.out.println("[프로그램 종료]");
					break;
				}

			}
		} catch (DataAccessException e) {
			e.printStackTrace();
		}
	}
}
