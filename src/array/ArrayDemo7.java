package array;

import java.util.Scanner;

public class ArrayDemo7 {

	public static void main(String[] args) {
		// 숫자를 입력받아서 입력받은 숫자의 총합을 계산하기
		
		// 키보드 입력받기
		Scanner scanner = new Scanner(System.in);
		
		// 숫자를 5개 입력받는 배열 생성하기
		int[] array = new int[5];
		
		// 숫자를 5번 입력 받기
		for (int i = 0; i < 5; i++) {
			System.out.print("숫자를 입력하세요:");
			// 입력 받은 숫자를 변수에 저장하기
			int num = scanner.nextInt();
			//변수에 저장된 값을 배열에 담기
			array[i] = num;
		}
		
		// 입력 받은 숫자들의 총합 계산하기
		int total = 0;
		for (int a : array) {		// enhanced-for문 사용하기
			// total에 숫자 누적 시키기
			total += a;
		}
		
		System.out.println("총합: " + total);
	}
}
