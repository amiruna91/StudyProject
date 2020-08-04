package kr.co.jhta.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.dao.OrderDao;
import kr.co.jhta.dao.ProductDao;
import kr.co.jhta.vo.Delivery;
import kr.co.jhta.vo.Item;
import kr.co.jhta.vo.Order;
import kr.co.jhta.vo.Payment;
import kr.co.jhta.vo.Product;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private ProductDao productDao;

	@Override
	public void order(Order order, Item item, Payment payment, Delivery delivery) {
		// 1. 주문정보 저장하기
		System.out.println("주문정보 저장 전: " + order);
		orderDao.insertOrder(order);
		System.out.println("주문정보 저장 후: " + order);
		
		// 2. 주문상품정보 저장하기
		item.setOrderNo(order.getNo());
		orderDao.insertOrderItem(item);
		
		// 3. 결재정보 저장하기
		payment.setOrderNo(order.getNo());
		orderDao.insertOrderPayment(payment);
		
		// 4. 배송정보 저장하기
		delivery.setOrderNo(order.getNo());
		orderDao.insertOrderDelivery(delivery);
		
		// 5. 물품재고 변경
		Product savedProduct = productDao.getProductByNo(item.getProductNo());
		savedProduct.setStock(savedProduct.getStock() - item.getAmount());
		productDao.updateProduct(savedProduct);
	}
	
}
