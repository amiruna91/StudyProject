package opp2;

public class HealthDemo {

	public static void main(String[] args) {
		
		Health h = new Health();
		
		double result1 = h.bmi(138, 1.85);
		System.out.println("bmi지수: " + result1);
		
		String result2 = h.bmiText(138, 1.85);
		System.out.println("bmi등급: " + result2);
	}
}
