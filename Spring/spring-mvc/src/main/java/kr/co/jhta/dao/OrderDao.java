package kr.co.jhta.dao;

import kr.co.jhta.vo.Delivery;
import kr.co.jhta.vo.Item;
import kr.co.jhta.vo.Order;
import kr.co.jhta.vo.Payment;

public interface OrderDao {

	void insertOrder(Order order);
	void insertOrderItem(Item item);
	void insertOrderPayment(Payment payment);
	void insertOrderDelivery(Delivery delivery);
}
