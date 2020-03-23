package oop1_1;

import java.util.Scanner;

public class ScoreDemo1 {

	public static void main(String[] args) {
		/*
		 *  학생의 이름, 국어, 영어, 수학점수를 입력받아서 배열에 저장한다.
		 *  배열에 저장된 학생 성적정보를 출력할 수 있다.
		 *  배열에 저장된 학생 성적정보를 검색할 수 있다.
		 */
		
		Scanner scanner = new Scanner(System.in);		
		Score[] scores = new Score[100];
		int savePosition = 0;
		
		while (true) {
			System.out.println();
			System.out.println("======================================================");
			System.out.println("1.조회  2.검색  3.입력  4.변경  0.종료");
			System.out.println("======================================================");
			
			System.out.print("번호를 입력하세요: ");
			int menuNo = scanner.nextInt();
			
			if (menuNo == 1) {
				System.out.println("[성적정보 조회]");
				
				System.out.println("이름	국어	영어	수학	총점	평균	합격여부");
				System.out.println("--------------------------------------------------------");
				
				for (int i = 0; i < savePosition; i++) {
					Score s = scores[i];
					
					System.out.println(s.studenNm + "\t" + s.kor + "\t" + s.eng + "\t" + s.math + "\t"  +
							s.total + "\t" + s.average + "\t" + s.isPassed);
				}
			} else if (menuNo == 2) {
				System.out.println("[성적정보 검색]");
				
				System.out.print("조회할 이름을 입력하세요:");
				String name = scanner.next();
				
				Score foundScore = null;
				for (int i = 0; i < savePosition; i++) {
					if (name.equals(scores[i].studenNm)) {
						foundScore = scores[i];
						break;
					} 
				}
				
				if (foundScore != null) {
					System.out.println("----- 검색 결과 -----");
					System.out.println("이    름: " + foundScore.studenNm);
					System.out.println("국    어: " + foundScore.kor);
					System.out.println("영    어: " + foundScore.eng);
					System.out.println("수    학: " + foundScore.math);
					System.out.println("총    점: " + foundScore.total);
					System.out.println("평    균: " + foundScore.average);
					System.out.println("합격여부: " + foundScore.isPassed);
					System.out.println("----------------------");
				} else {
					System.out.println("[" + name + "]님의 성적정보가 없습니다.");
				}
			} else if (menuNo == 3) {
				System.out.println("[성적정보 입력]");
				
				// 이름, 국어/영어/수학점수를 입력받는다.
				System.out.print("이름을 입력하세요:");
				String name = scanner.next();
				System.out.print("국어점수를 입력하세요:");
				int kor = scanner.nextInt();
				System.out.print("영어점수를 입력하세요:");
				int eng = scanner.nextInt();
				System.out.print("수학점수를 입력하세요:");
				int math = scanner.nextInt();
				
				// Score객체를 생성한다.
					Score s = new Score();
					
				// 생성된 Score객체의 각 속성에 입력받은 이름, 국어, 영어, 수학점수를 저장한다.
					s.studenNm = name;
					s.kor = kor;
					s.eng = eng;
					s.math = math;
					s.total = kor + eng + math;
					s.average = s.total/3;
					s.isPassed = (s.average >= 60) ? true : false;
				
				// 성적정보가 저장된 Score객체를 위에서 정의한 scores배열에 순서대로 저장한다.
					scores[savePosition] = s;
					savePosition++;
			} else if (menuNo == 0) {
				System.out.println("프로그램을 종료합니다.");
				break;
			} else if (menuNo == 4) {
				System.out.println("[성적정보 변경]");
				
				// 이름, 과목명, 점수를 입력받는다. 
				System.out.print("성적을 변경할 학생이름을 입력하세요:");
				String name = scanner.next();
				System.out.print("성적을 변경할 과목명을 입력하세요:");
				String subjectNm = scanner.next();
				System.out.print("수정할 성적을 입력하세요:");
				int score = scanner.nextInt();
				
				// scores배열에서 이름과 일치하는 학생을 찾는다.
				Score foundScore = null;
				
				for (int i = 0; i < savePosition; i++) {
					if (name.equals(scores[i].studenNm)) {
						foundScore = scores[i];
						break;
					}
				}
				
				// foundScore가 null이 아니라면 입력한 과목명에 해당 점수를 변경한다.
				// 과목명이 "국어"라면 foundScore의 kor값을 변경하고,
				// 과목명이 "영어"라면 foundScore의 eng값을 변경하고,
				// 과목명이 "수학"이라면 foundScore의 math값을 변경한다.				
				if (foundScore != null) {
					if (subjectNm.equals("국어")) {
						foundScore.kor = score;
					} else if (subjectNm.equals("영어")) {
						foundScore.eng = score;
					} else if (subjectNm.equals("수학")) {
						foundScore.math = score;
					}
					foundScore.total = foundScore.kor + foundScore.eng + foundScore.math;
					foundScore.average = foundScore.total/3;
					foundScore.isPassed = (foundScore.average >= 60) ? true : false;
				} else {
					System.out.println("[" + name + "]님의 성적정보가 없습니다.");
				}				
			}
		}
		scanner.close();
	}
}