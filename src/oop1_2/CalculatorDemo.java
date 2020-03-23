package oop1_2;

public class CalculatorDemo {

	public static void main(String[] args) {
		
		Calculator calculator = new Calculator();
		
		int result1 = calculator.plus(6, 9);
		double result2 = calculator.plus(6.9, 29.1);
		long result3 = calculator.plus(69129L, 9293L);
		int result4 = calculator.plus(6, 9, 12);
		
	}
}
