package array;

import java.util.Scanner;

public class ArrayDemo14 {

	public static void main(String[] args) {
		/*
		 *  야구 게임
		 *  1~9까지의 임의의 수 3개를 가진 배열이 있다.
		 *  사용자로부터 숫자 3개를 입력받아서 순서대로 배열에 저장한다.
		 *  사용자가 입력한 숫자와 임의의 숫자들을 비교해서 숫자가 동일하고 인덱스도 동일하면 strike
		 *  숫자는 동일하지만 인덱스는 일치하지 않으면 ball로 판정한다.
		 *  	최대 10회까지 시도할 수 있다.
		 *  	출력값이 "3S0B"인 경우 사용자가 숫자를 모두 맞힌 경우다.
		 */
		
		Scanner scanner = new Scanner(System.in);
		
		// 임의의 숫자 3개를 저장하는 배열
		int[] secretNo = new int[3];
		// 사용자가 입력한 숫자 3개를 저장하는 배열
		int[] inputNo = new int[3];
		
		// 1~9 임의의 숫자를 secretNo에 순서대로 저장하기
		for (int i = 0; i < secretNo.length; i++) {
			int randomNo = (int) (Math.random()*9 + 1);
			
			// secretNo에 중복된 숫자가 저장되지 않게 하기
			boolean isExist = false;
			for (int j = 0; j < i; j++) {
				// 새로 발생한 난수와 secretNo의 배열의 값을 순서대로 비교한다.
				if (secretNo[j] == randomNo) {
					// 동일한 숫자가 발견되면 isExist를 true로 설정하고, 숫자를 비교하는 for문을 탈출한다.
					isExist = true;
					break;
				} 
			}
			if  (!isExist) {
				// 중복이 없었으므로 난수를 배열에 저장
				secretNo[i] = randomNo;
			} else {
				// 이번에 뽑은 난수가 중복이 발생했으므로 다시 이번회차를 뽑기 위해서 i를 1감소 시킨다.
				i--;
			}
		}
		
		// 사용자가 숫자 맞추기
		int count = 0;
		while (true) {
			if (count > 10) {
				System.out.println("실패 - 시도 횟수가 10회를 넘었습니다.");
				break;
			}
			
			System.out.print("첫번째 숫자를 입력하세요");
			inputNo[0] = scanner.nextInt();
			System.out.print("두번째 숫자를 입력하세요");
			inputNo[1] = scanner.nextInt();
			System.out.print("세번째 숫자를 입력하세요");
			inputNo[2] = scanner.nextInt();
			
			int strike = 0;
			int ball = 0;
			// inputNo의 숫자를 하나씩 자여와서
			// secretNo의 0,1,2번째 숫자와 비교한다.
			for (int i = 0; i < inputNo.length; i++) {
				for (int j = 0; j < secretNo.length; j++) {
					// 동일한 숫자가 발견되면
					if (inputNo[i] == secretNo[j]) {
						// 인덱스도 동일한지 확인한다.
						if (i == j) {
							strike++;
						} else {
							ball++;
						}
					}
				}
			}
			
			System.out.println("출력값: " + strike + "S" + ball + "B");
			if (strike == 3) {
				System.out.println("정답입니다. 시도횟수는 총 " + count + "회 입니다.");
				break;
			}
			count++;
		}
	}
}
