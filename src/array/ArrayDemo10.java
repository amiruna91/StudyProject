package array;

import java.util.Scanner;

public class ArrayDemo10 {

	public static void main(String[] args) {
		// 숫자를 10개를 입력받아서 그중 인접한 숫자들간의 차이를 계산해서 가장 차이가 
		// 큰 숫자와 그 차이를 구하기
		Scanner scanner = new Scanner(System.in);
		
		// 배열 생성하기
		int[] arr = new int[10];
		
		// 숫자 10개를 입력받아서 배열에 담기
		for (int i = 0; i < arr.length; i++) {
			System.out.print("숫자를 입력하세요: ");
			arr[i] = scanner.nextInt();
			 
		}
		
		// 출력할 값을 담는 변수 만들기
		int prev = 0;
		int next = 0;
		int gap = 0;
		// 인접한 숫자들간의 차이를 계산해서 가장 차이가 큰 숫자와 그 차이를 구하기
		for (int i = 0; i < arr.length - 1; i++) {
			int currentGap = Math.abs(arr[i] - arr[i+1]);

			if (currentGap > gap) {
				gap = currentGap;
				prev = arr[i];
				next = arr[i+1];
			}
		}
		// 결과 출력하기
		System.out.println("숫자1: " + prev + " 숫자2: " + next + " 갭: " + gap);
	}
}
