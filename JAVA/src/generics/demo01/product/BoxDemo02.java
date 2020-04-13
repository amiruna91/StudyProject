package demo01.product;

public class BoxDemo02 {

	public static void main(String[] args) {
		
		// Tv가 타입파라미터로 지정된 Box객체
		// Tv객체만 다룰 수 있다.
		Box<Tv> box1 = new Box<Tv>();
		box1.add(new Tv("초대형 테레비전", 5000000, 100.5));
		//box1.add(new SmartPhone("아이폰", 1500000, "010-1111-1111", "192.159.2.42"));
		
		// SmartPhone이 타입파라미터로 지정된 Box객체
		// SmartPhone객체만 다룰 수 있다.
		Box<SmartPhone> box2 = new Box<SmartPhone>();
		//box2.add(new Tv("초대형 테레비전", 5000000, 100.5));
		box2.add(new SmartPhone("아이폰", 1500000, "010-1111-1111", "192.159.2.42"));
		
		// Product가 타입파라미터로 지정된 Box객체
		// Product, Product의 자손인 TV, Product의 자손인 SmartPhone객체도 다룰 수 ㅇㅆ다.
		Box<Product> box3 = new Box<Product>();		
		box3.add(new Product("노트북", 5000000));
		box3.add(new Tv("초대형 테레비전", 5000000, 100.5));
		box3.add(new SmartPhone("아이폰", 1500000, "010-1111-1111", "192.159.2.42"));
	}
}
