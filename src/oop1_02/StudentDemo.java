package oop1_2;

import java.util.Scanner;

public class StudentDemo {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		Student[] students = new Student[20];
		int savePoint = 0;
		
		while (true) {
			System.out.println();
			System.out.println("[학생정보 관리 프로그램]");
			System.out.println("========================================");
			System.out.println("1.조회   2.검색   3.입력   0.종료");
			System.out.println("========================================");
			System.out.println("번호를 입력하세요:");
			int menuNo = scanner.nextInt();
			
			if (menuNo == 1) {
				System.out.println("[성적정보 조회]");
				System.out.println("학생이름   반번호   번호   국어점수   영어점수   수학점수   총점    평균");
	
				for (int i = 0; i < savePoint; i++) {
					students[i].printInformation();
				}
				System.out.println("========================================================================");
			} else if (menuNo == 2) {
				System.out.println("[학생정보 검색]");
				
				System.out.print("조회할 이름을 입력하세요:");
				String name = scanner.next();
				
				boolean isFound = false;
				for (int i = 0; i < savePoint; i++) {
					if (name.equals(students[i].studenNm)) {
						students[i].displayStudentInfo();
						isFound = true;
					} 
				}
				if (!isFound) {
					System.out.println("["+ name +"]님의 정보가 없습니다.");
				}
			} else if (menuNo == 3) {
				System.out.println("[학생정보 입력]");
				Student stu = new Student();
				
				System.out.print("이름을 입력하세요:");
				stu.studenNm = scanner.next();
				System.out.print("반을 입력하세요:");
				stu.classNo = scanner.nextInt();
				System.out.print("학생번호를 입력하세요:");
				stu.studentNo = scanner.nextInt();
				System.out.print("국어점수를 입력하세요:");
				stu.kor = scanner.nextInt();
				System.out.print("영어점수를 입력하세요:");
				stu.eng = scanner.nextInt();
				System.out.print("수학점수를 입력하세요:");
				stu.math = scanner.nextInt();
				
				students[savePoint] = stu;
				savePoint++;
			} else if (menuNo == 0) {
				System.out.println("프로그램을 종료합니다.");
				break;
			}
		}
		scanner.close();
	}
}
