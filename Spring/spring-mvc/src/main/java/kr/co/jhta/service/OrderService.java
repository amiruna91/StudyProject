package kr.co.jhta.service;

import kr.co.jhta.vo.Delivery;
import kr.co.jhta.vo.Item;
import kr.co.jhta.vo.Order;
import kr.co.jhta.vo.Payment;

public interface OrderService {

	void order(Order order, Item item, Payment payment, Delivery delivery);
}
