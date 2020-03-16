package array;

import java.util.Arrays;
import java.util.Scanner;

public class ArrayDemo11 {

	public static void main(String[] args) {
		/*
		 *  숫자 5개를 입력 받아서 배열에 저장한다.
		 *  배열의 n번째 까지의 합계를 새로운 배열에 저장하고. 새 배열의 값을 전부 출력한다.
		 *  예) [3, 5, 11, 7, 4] ---> [3, 8, 19, 26, 30]
		 */
		
		Scanner scanner = new Scanner(System.in);
		
		int[] arr1 = new int[5];
		int[] arr2 = new int[5];
		int total = 0;
		
		for (int i = 0; i < 5; i++) {
			System.out.print("숫자를 입력하세요:");
			arr1[i] = scanner.nextInt();
		}
	
		for (int i = 0; i < 5; i++) {
			total += arr1[i];
			arr2[i] = total;
		}
		
		System.out.println("결과 출력하기: " + Arrays.toString(arr2));
	}
}
