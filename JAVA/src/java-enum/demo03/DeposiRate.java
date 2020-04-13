package demo03;

public enum DeposiRate {

	BRONZE(0.01), SILVER(0.03), GOLD(0.05), VIP(0.1);
	
	// 열거형의 변수는 반드시 final로 정의해야 한다.
	private final double value;
	
	// 열거형의 생성자는 멤버변수를 초기화해야한다.
	// 열거형의 생성자는 오직 private만 가능하다.
	// 열거형의 생성자는 열거형 내부적으로 사용된다.
	private DeposiRate(double value) {
		this.value = value;
	}
	
	public double getValue() {
		return value;
	}

}
