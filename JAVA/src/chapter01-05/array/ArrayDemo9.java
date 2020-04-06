package array;

import java.util.Scanner;

public class ArrayDemo9 {

	public static void main(String[] args) {
		/*
		 *  숫자를 10개 입력받아서 그 중에 짝수들의 합계만 구해서 출력하기
		 */
		
		Scanner scanner = new Scanner(System.in);
		int[] arr = new int[10];
		int total = 0;
		
		for (int i = 0; i < 10; i++) {
			System.out.print("숫자를 입력하세요:");
			arr[i] = scanner.nextInt();
			
		}
		
		for (int num : arr) {
			if (num%2 == 0) total += num;
		}
		System.out.println("짝수들의 총합: " + total);
	}
}
