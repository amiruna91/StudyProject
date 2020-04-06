package array;

import java.util.Scanner;

public class ArrayDemo13 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		String[] names = new String[20];
		int[] korArr = new int[20];
		int[] engArr = new int[20];
		int[] mathArr = new int[20];
		int savePosition = 0;
		
		while (true) {
			System.out.println("성적관리 프로그램");
			System.out.println("================================================");
			System.out.println("1.조회	2.검색	3.입력	0.종료");
			System.out.println("================================================");
			
			System.out.print("메뉴선택> ");
			int menuNo = scanner.nextInt();
			
			if (menuNo == 1) {
				System.out.println("[성적 조회]");
				System.out.println("순번	이름	국어	영어	수학	총점	평균");
				System.out.println("----------------------------------------------------");
				
				for (int i = 0; i < savePosition; i++) {
					System.out.print(i + 1 + "\t");
					System.out.print(names[i] + "\t");
					System.out.print(korArr[i] + "\t");
					System.out.print(engArr[i] + "\t");
					System.out.print(mathArr[i] + "\t");
					
					int total = korArr[i] + engArr[i] + mathArr[i];
					int avg = total/3;
					
					System.out.print(total +  "\t");
					System.out.println(avg);
				}
				System.out.println("----------------------------------------------------");
				
			} else if (menuNo == 2) {
				System.out.println("[성적 검색]");
				
			} else if (menuNo == 3) {
				System.out.println("[성적 입력]");
				
				System.out.print("이름을 입력하세요");
				names[savePosition] = scanner.next();
				System.out.print("국어점수를 입력하세요");
				korArr[savePosition] = scanner.nextInt();
				System.out.print("영어점수를 입력하세요");
				engArr[savePosition] = scanner.nextInt();
				System.out.print("수학점수를 입력하세요");
				mathArr[savePosition] = scanner.nextInt();
				
				savePosition++;
				System.out.println("성적정보가 저장되였습니다!");
			} else if (menuNo == 0) {
				break;
			}
			System.out.println();
		}
		System.out.println("[성적관리 프로그램]을 종료합니다.");
		scanner.close();
	}
}
