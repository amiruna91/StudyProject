package control;

import java.util.Scanner;

public class WhileDemo2 {

	public static void main(String[] args) {
		
		// 1부터 숫자를 하나씩 더해갈 때
		// 합계가 최초로  사용자가 입력한 값 이상이 되는 숫자는 무엇인가?
		
		Scanner scanner = new Scanner(System.in);
		System.out.print("합계를 입력 하세요:");
		
		int max = scanner.nextInt(),
			sum = 0,
			num = 1;
		
		while (true) {
			sum += num;
			//System.out.println("[" + num + "] -----> " + sum );
			if (sum >= max) {
				break;
			}
			num++;
		}
		System.out.println("합계: " + sum + ", 숫자: " + num);
	}
}
