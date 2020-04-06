package array;

import java.util.Scanner;

public class ArrayDemo12 {

	public static void main(String[] args) {
		/*
		 *  상품명, 가격, 구매수량을 입력받아서 총 구매가격을 출력하는 프로그램
		 */
		
		Scanner scanner = new Scanner(System.in);
		
		String[] names = new String[3];
		int[] prices = new int[3];
		int[] amounts = new int[3];
		int totalPrice = 0;
		
		// 상품명, 가격, 구매수량을 입력 받는다.
		for (int i = 0; i < names.length; i++) {
			System.out.print("상품명을 입력하세요:");
			names[i] = scanner.next();
			System.out.print("가격을 입력하세요:");
			prices[i] = scanner.nextInt();
			System.out.print("구매수량을 입력하세요:");
			amounts[i] = scanner.nextInt();
		}
		
		// 구매정보 출력하기
		System.out.println("순번\t상품명\t가격\t수량\t구매가격");
		System.out.println("=========================================");
		for (int i = 0; i < names.length; i++) {
			System.out.print(i + 1 + "\t");
			System.out.print(names[i] + "\t");
			System.out.print(prices[i] + "\t");
			System.out.print(amounts[i] + "\t");
			System.out.println(prices[i] * amounts[i]);
			
			totalPrice += prices[i] * amounts[i];
		}
		System.out.println("=========================================");
		System.out.println("총 구매가격: " + totalPrice);
	}
}
