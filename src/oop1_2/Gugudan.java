package oop1_2;

/**
 * 여러가지 구구단 출력을 제공하는 클래스다.
 * @author 홍길동
 *
 */
public class Gugudan {
	
	/**
	 * 2~9단까지 모두 화면에 출력하는 기능
	 */
	void print99dan() {
		print99danByRange(2, 9);
	}
	
	/**
	 * 지정된 단에 해당하는 구구단을 출력한다.
	 * @param dan  출력할 단의 숫자.
	 */
	//출력할 단을 전달받아서 해당 단을 화면에 출력하는 기능
	void parint99daNum(int dan) {
		print99danByRange(dan, dan);
	}
	
	/**
	 *  지정된 시작번호부터 끝번호까지의 구구단을 출력합니다.
	 * @param begin	출력할 시잔 단의 숫자
	 * @param end 출력할 끝 단의 숫자
	 */
	//정수 2개를 입력받아서 첫번째 정수부터 2번째 정수까지의 단을 화면에 출력하는 기능
	void print99danByRange(int begin, int end) {
		System.out.println("----------------------- 구구단("+ begin + " ~ " + end 
				+ ") 출력 -------------------------");
		for (int i = 1; i <= 9; i++) {
			for (int j = begin; j <= end; j++) {
				System.out.print(j + " * " + i + " = " + j*i + "\t");
			}
			System.out.println();
		}
	}
	
}
