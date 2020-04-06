package control;

import java.util.Scanner;

public class WhileDemo1 {

	public static void main(String[] args) {
		
		/*
		 *  while (조건식) {
		 *  	조건식이 true로 판정될 동안 실행되는 수행문;
		 *  }
		 */
		
		Scanner scanner = new Scanner(System.in);
		
		while (true) {
			System.out.print("숫자를 입력하세요(0을 입력하면 반복을 종료합니다):");
			int num = scanner.nextInt();
			
			// 무한반복 탈출조건
			if (num == 0) {
				System.out.println("시스템을 종료합니다.");
				break;
			}
			System.out.println("입력한 번호는 " + num + "입니다.");
		}
	}
}
