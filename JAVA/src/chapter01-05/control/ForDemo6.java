package control;

public class ForDemo6 {

	public static void main(String[] args) {
		// 1 + (1+2) + (1+2+3) + .... + (1+2+3+....10)의 총합을 구하라.
		
		int sum = 0;
		
		for (int i = 1; i <= 10; i++) {
			for (int j = 1; j <=i; j++) {
				sum += j;
			}
			System.out.println("sum1: " + sum);
		}
		System.out.println("sum2: " + sum);
	}
}
