package control;

import java.util.Scanner;

public class IfDemo4 {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		/*
		 * 고객의 등급(일반, 로얄, 플래티넘 중 하나)과 총 구매금액을 입력받는다.
		 * 고객의 등급이 플래티넘인 경우 구매금액의 10%를 할인한다.
		 * 			  로얄인 경우 구매금액의 3%를 할인한다.
		 * 			  일반인 경우 구매금액의 1%를 할인한다.
		 * 결재금액은 총 구매금액에서 할인된 금액만큼을 차감한 금액이다.
		 * 적립포인트는 결재금액의 3%를 적립한다.
		 * 
		 *  출력내용은
		 *  	총구매금액, 고객등급, 할인된 금액, 결재할 금액, 적립된 포인트
		 */
		
		System.out.print("고객의 등급을 입력하세요:");
		String grade = scanner.next();
		System.out.print("총 구매금액을 입력하세요:");
		int totalPrice = scanner.nextInt();
		
		double discount = 0;
		
		if (grade.equals("플래티넘")) {
			discount = 0.1;
		} else if (grade.equals("로얄")) {
			discount = 0.03; 
		} else if (grade.equals("일반")) {
			discount = 0.01;
		}
		
		int discountedPrice = (int) (totalPrice * discount);
		int isPay = totalPrice - discountedPrice;
		int point = (int) (isPay * 0.03);
		
		System.out.println("총구매금액: " + totalPrice);
		System.out.println("고객  등급: " + grade);
		System.out.println("힐인  금액: " + discountedPrice);
		System.out.println("결재할금액: " + isPay);
		System.out.println("적립포인트: " + point);
		
	}
}
