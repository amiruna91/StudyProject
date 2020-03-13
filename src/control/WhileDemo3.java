package control;

import java.util.Scanner;

public class WhileDemo3 {

	public static void main(String[] args) {
		// 1~100까지 임의의 정수를 하나 생성한다.
		// 사용자가 입력한 숫자와 정수를 비교해서 up/down을 표시한다.
		// 사용자가 입력한 숫자와 정수가 임의의 정수가 일치하면 
		// 몇번만에 맞췄는지 화면에 표시한다.
		
		Scanner scanner = new Scanner(System.in);
		// 1 ~ 100 범위의 임의의 정수를 생성해서 secretNum에 저장한다.
		int secretNum = (int) (Math.random() * 100 + 1),
			inputCount = 0;
		
		while (true) {
			System.out.print("숫자를 입력하세요:");
			int userNum = scanner.nextInt();
			
			inputCount++;
			
			if (userNum > secretNum) {
				System.out.println("[" + userNum + "] 보다 작습니다.");
			} else if (userNum < secretNum) {
				System.out.println("[" + userNum + "] 보다 큽니다.");
			} else if (userNum == secretNum) {
				System.out.println("\n정답입니다.");
				break;
			}
		}
		System.out.print("정답 : " + secretNum + "\n입력한 횟수: " + inputCount);
	}
}
