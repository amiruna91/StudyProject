package demo02;

public class CustomerDemo {

	public static void main(String[] args) {
		
		// enum타입의 상수값을 사용하는 Customer 생성하기
		Customer customer1 = new Customer("홍길동", Grade.VIP);
		Customer customer2 = new Customer("홍길동", Grade.GOLD);
		Customer customer3 = new Customer("홍길동", Grade.SILVER);
		
		// enum타입에서 정의한 상수값 외의 값은 대입될 수 없고,
		// 컴파일시에 에러가 발생한다.
//		Customer customer4 = new Customer("홍길동", Grade."골드");
//		Customer customer4 = new Customer("홍길동", Grade.0);
//		Customer customer4 = new Customer("홍길동", Grade.VVIP);
		
		System.out.println(getPoint(customer1, 1200000));
		System.out.println(getPoint(customer2, 1200000));
		System.out.println(getPoint(customer3, 1200000));
	}
	
	public static int getPoint(Customer customer, int orderPrice) {
		int point = 0;
		if (customer.getGrade() == Grade.VIP) {
			point = (int) (orderPrice * 0.07);
		} else if (customer.getGrade() == Grade.GOLD) {
			point = (int) (orderPrice * 0.05);
		} else if (customer.getGrade() == Grade.SILVER) {
			point = (int) (orderPrice * 0.03);
		} else if (customer.getGrade() == Grade.BRONZE) {
			point = (int) (orderPrice * 0.01);
		} 
		return point;
	}
}
