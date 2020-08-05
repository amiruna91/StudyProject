package kr.co.jhta.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.jhta.form.OrderForm;
import kr.co.jhta.service.OrderService;
import kr.co.jhta.service.ProductService;
import kr.co.jhta.vo.Delivery;
import kr.co.jhta.vo.Item;
import kr.co.jhta.vo.Order;
import kr.co.jhta.vo.Payment;
import kr.co.jhta.vo.Product;

@Controller
@RequestMapping("/order")
@SessionAttributes("orderForm")
public class OrderController {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/step1.do")
	public String step1(@RequestParam("no") long productNo, Model model) {
		// 구매버튼을 클릭한 상품정보를 조회한다.
		Product product = productService.getProductDetail(productNo);
		
		// 구매상품정보, 구매자정보, 결재정보, 배송지정보를 저장하는 OrderForm객체를 생성한다.
		OrderForm orderForm = new OrderForm();
		// OrderForm객체에 구매상품정보를 저장한다.
		orderForm.setProductNo(product.getNo());
		orderForm.setProductName(product.getName());
		orderForm.setProductPrice(product.getPrice());
		orderForm.setProductDiscountPrice(product.getDiscountPrice());
		
		// OrderForm객체를 Model에 저장한다.
		// @SessionAttribute("orderForm") 어노테이션 설정 때문에 OrderForm은 세션에 저장된다.
		// OrderForm객체는 브라우저를 종료하거나, 로그아웃하기 전까지는 계속 유지된다.
		model.addAttribute("orderForm", orderForm);
		
		System.out.println("step1단계 화면 표시전 OrderForm : " + orderForm);
		// 구매자정보 입력화면으로 이동한다.
		return "order/step1";
	}
	// 1단계 화면(구매수량, 가격, 구매자이름, 구매자 전화번호 입력화면)
	// 구매수량, 구매자이름, 구매자 전화번호 입력 후 폼입력값을 제출했을때 실행됨
	// (요청방식:POST, 요청URL:/order/step1.do, 요청파라미터:amount, price, username, usertel)
	@PostMapping("/step1.do")
	public String step1Submit(@ModelAttribute("orderForm") OrderForm orderForm) {
		System.out.println("step1단계 완료 후 OrderForm : " + orderForm);
		
		return "redirect:step2.do";	// 2단계 화면을 요청하는 URL을 응답으로 보낸다.
	}
	
	// 1단계 완료후 2단계 화면을 요청했을 때 실행됨
	// (요청방식: GET, 요청URL:/order/step2.do, 요청파라미터:없음)
	@GetMapping("/step2.do")
	public String step2() {
		return "order/step2";
	}
	
	// 2단계 화면 (결제방법, 계좌번호 입력화면)
	// 결제방법, 계좌번호 입력 후 폼입력값을 제출했을 때 실행됨
	// (요청방식:POST, 요청URL:/order/step2.do, 요청파라미터:payType, payAccount
	@PostMapping("/step2.do")
	public String step2Submit(@ModelAttribute("orderForm") OrderForm orderForm) {
		System.out.println("step2단계 완료 후 OrderForm : " + orderForm);
		return "redirect:step3.do";
	}
	
	// 2단계 완료후 3단계 화면을 요청했을 때 실행됨
	// (요청방식:GET, 요청URL:/order/step3.do, 요청파라미터:없음)
	@GetMapping("/step3.do")
	public String step3() {
		return "order/step3";
	}
	
	// 3단계 화면(수령자 이름, 전화번호, 주소 입력화면)
	// 수령자 이름, 전화번호, 주소 입력 후 폼입력값을 제출했을 때 실행됨
	// (요청방식:POST, 요청URL:/order/step3.do, 요청파라미터: receiveryName, receiveryTel)
	@PostMapping("/step3.do")
	public String step3Submit(@ModelAttribute("orderForm") OrderForm orderForm) {
		System.out.println("step3단계 완료 후 OrderForm : " + orderForm);
		
		return "redirect:step4.do";		// 4단계 화면을 요청하는 URL을 응답으로 보낸다.
	}
	
	@GetMapping("/step4.do")
	public String step4() {
		return "order/step4";
	}
	
	// 4단계 화면(구매상품정보, 구매자정보, 결제정봐, 수령인 정보 표시화면)
	// 주문내용을 확인하고 주문버튼을 클릭했을 때 실행됨
	// (요청방식:POST, 요청URL:/order/step4.do, 요청파라미터: 없음)
	@PostMapping("/step4.do")
	public String step4Submit(@ModelAttribute("orderForm") OrderForm orderForm, SessionStatus sessionStatus) {
		System.out.println("step4단계 완료 후 OrderForm : " + orderForm);

		// OrderForm객체에서 주문정보 저장에 필요한 사용자 정보 조회하기
		Order order = new Order();
		order.setUsername(orderForm.getUsername());
		order.setTel(orderForm.getUsertel());
		
		// OrderForm객체에서 구매상품정보 저장에 필요한 정보 조회하기
		Item item = new Item();
		item.setProductNo(orderForm.getProductNo());
		item.setPrice(orderForm.getPrice());
		item.setAmount(orderForm.getAmount());

		// OrderForm객체에서 결제정보 저장에 필요한 정보 조회하기
		Payment payment = new Payment();
		payment.setType(orderForm.getPayType());
		payment.setAccount(orderForm.getPayAccount());
		
		// OrderForm객체에서 배송정보 저장에 필요한 정보 조회하기
		Delivery delivery = new Delivery();
		delivery.setUsername(orderForm.getReceiverUsername());
		delivery.setTel(orderForm.getReceiverTel());
		delivery.setAddress(orderForm.getReceiverAddress());
		
		// 주문서비스의 주문하기 기능 실행
		orderService.order(order, item, payment, delivery);
		
		// @SessionAttribute({"이름, "이름"})으로 모델에 저장된 객체 중에서
		// 해당이름의 객체가 세션에 저장된게 되는데
		// sessionStatus.setComplete()메서도를 실행하면, 세션에 저장된 객체를
		// 삭제한다.
		sessionStatus.setComplete();
		
		return "redirect:completed.do";
	}
	
	@GetMapping("/completed.do")
	public String completed() {
		return "order/completed";
	}
	@GetMapping("/cancel.do")
	public String cancel(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:/product/list.do";
	}

}
