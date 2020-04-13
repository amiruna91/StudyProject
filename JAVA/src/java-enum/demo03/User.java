package demo03;

public class User {

	private String name;
	private DeposiRate deposiRate;
	private int orderPrice;
	
	public User(String name, DeposiRate deposiRate, int orderPrice) {
		this.name = name;
		this.deposiRate = deposiRate;
		this.orderPrice = orderPrice;
	}
	
	public String getName() {
		return name;
	}
	
	public DeposiRate getDeposiRate() {
		return deposiRate;
	}
	
	public int getOrderPrice() {
		return orderPrice;
	}
	
}
