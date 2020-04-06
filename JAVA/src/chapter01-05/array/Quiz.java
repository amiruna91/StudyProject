package array;

import java.util.Arrays;
import java.util.Scanner;

public class Quiz {

	public static void main(String[] args) {
		/*
		 * 야구게임
		 	1 ~~ 9 까지
			배열 길이 3
			각 난수 3개
			3개 숫자 입력받기
			위치화 숫자 모두 일치 strike
			숫자만 일치 ball
			while문 안에 넣기
			int strike = 0;
			int ball = 0;
			결과 3s0b이면 break; 게임 종료
			10번안에 못맞치면 아웃
		 */
		Scanner scanner = new Scanner(System.in);
		
		int[] scretNoArr = new int[3],
			  myNoArr = new int[3];
		int count = 0;
		
		scretNoArr[0] = 2;//(int) (Math.random() * 9 + 1);
		scretNoArr[1] = 7;//(int) (Math.random() * 9 + 1);
		scretNoArr[2] = 4;//(int) (Math.random() * 9 + 1);
		
		while (true) {
			int strike = 0,
				ball = 0;
			
			System.out.println("중복되지 않는 숫자 3개를 입력하세요: ");
			myNoArr[0] = scanner.nextInt();
			myNoArr[1] = scanner.nextInt();
			myNoArr[2] = scanner.nextInt();
			count++;
			System.out.println(count + "번 입력하셨습니다.");
			
			for (int j = 0; j < myNoArr.length; j++) {
				for (int i = 0; i < scretNoArr.length; i++) {
					if (myNoArr[j] == scretNoArr[i] && i == j) {
						strike++;
					} else if (myNoArr[j] == scretNoArr[i] && i != j) {
						ball++;
					}
				}
			}
			
			System.out.println("입력하신 숫자는: " + Arrays.toString(myNoArr));
			System.out.println(strike + "S" + ball + "B 입니다.");			
			
			if (strike == 3) {
				System.out.println("시크릿 번호는: " + Arrays.toString(scretNoArr));
				System.out.println("정답입니다");
				break;
			} else if (count == 10) {
				System.out.println("시크릿 번호는: " + Arrays.toString(scretNoArr));
				System.out.println("10번 초과 입력 하셨습니다. 다시 도전 해주세요.");
				break;
			}
		}
		scanner.close();
	}
}
