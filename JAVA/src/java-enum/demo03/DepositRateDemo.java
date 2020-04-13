package demo03;

public class DepositRateDemo {

	public static void main(String[] args) {
		
		User user1 = new User("홍길동", DeposiRate.BRONZE, 1200000);
		User user2 = new User("강감찬", DeposiRate.GOLD, 500000);
		User user3 = new User("김유신", DeposiRate.VIP,450000);
		
		int point1 = (int) (user1.getOrderPrice() * user1.getDeposiRate().getValue());
		int point2 = (int) (user2.getOrderPrice() * user2.getDeposiRate().getValue());
		int point3 = (int) (user3.getOrderPrice() * user3.getDeposiRate().getValue());
		
		System.out.println("홍길동의 직립률: " + user1.getDeposiRate().getValue());
		System.out.println("강감찬의 직립률: " + user2.getDeposiRate().getValue());
		System.out.println("김유신의 직립률: " + user3.getDeposiRate().getValue());
		
		System.out.println(point1);
		System.out.println(point2);
		System.out.println(point3);
		
		
	}
}
