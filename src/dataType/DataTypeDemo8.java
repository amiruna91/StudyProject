package dataType;

public class DataTypeDemo8 {
	
	public static void main(String[] args) {
		// 반지름의 길이가 5, 10, 20인 원들이 있다.
		// 각 원들의 넓이와 원의 둘레길이를 계산해서 출력하기
		// 넓이는 3.14*반지름*반지름 둘레길이는 2*3.14*반지름
		
		int radius1 = 5;
		int radius2 = 10;
		int radius3 = 20;
		
		double extent1 = Math.PI * radius1 * radius1;
		double extent2 = Math.PI * radius2 * radius2;
		double extent3 = Math.PI * radius3 * radius3;
		
		double length1 = 2 * Math.PI * radius1;
		double length2 = 2 * Math.PI * radius2;
		double length3 = 2 * Math.PI * radius3;
		
		System.out.println("반지름 5인 원의 넓이: " + extent1 + "둘레길이: " + length1);
		System.out.println("반지름 10인 원의 넓이: " + extent2 + "둘레길이: " + length2);
		System.out.println("반지름 20인 원의 넓이: " + extent3 + "둘레길이: " + length3);
		
	}
}
