package kr.co.jhta.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jhta.service.ProductService;
import kr.co.jhta.vo.Product;

@Controller
@RequestMapping("/json")
public class JSONController {


/*
 * @ResponseBody
 *		- 요청핸들러 메소드가 반환하는 값(객체, Map, 콜렉션)을 특정 타입의 컨텐츠로
 *           변환해서 응답메세지의 body에 담아보낼 때 싸용하는 어노테이션이다.
 *		- 요청 핸들러 메서드 혹은 반환타입에 부착할 수 있다.
 *		- 응답컨텐츠의 타입은 보통 JSON형식의 데이터를 제공한다.
 *		- JSON 형식의 데이터를 제공하기 위해서는 jackson-databind 라이브러리가 필요하다.
 */

	@Autowired
	private ProductService productService;
	
	@GetMapping("/home.do")
	public String home() {
		return "json/home";
	}
	
	// 모든 상품정보를 json형식의 텍스트로 제공하는 요청핸들러 메서드
	@GetMapping("/products.do")
	@ResponseBody
	public List<Product> getAllProducts() {
		List<Product> products = productService.getAllProducts();
		
		return products;
	}
	
	// 상품번호에 해당하는 상품정보를 json 형식의 텍트르로 제공하는 요청핸들러 메서드
	@GetMapping("/product.do")
	public @ResponseBody Product getProduct(@RequestParam("no") int productNo) {
	      Product product = productService.getProductDetail(productNo);
	      return product;
	   }
	
	/*
	 * ResponseEntity<T>로 JSON 응답보내기
	 * 		- ResponseEntity<T>는 응답메세지를 보낼 때 사용하는 객체다.
	 * 		- ResponseEntity<T>의 T는 응답으로 보낼 객체의 타입이다.
	 * 		- new ResponseEntity<>(T body, HttpStatus status) 생성자로
	 * 	      body부분에는 응답으로 보낼 데이터를 담고 있는 객체를
	 *  	  status부분에는 HTTP 응답코드를 설정한다.
	 *  @GetMapping의 produces는 생성가능한 응답컨텐츠의 타입을 설정한다.
	 */
	@GetMapping(path="/products2.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<Product>> getAllProducts2() {
		List<Product> products = productService.getAllProducts();
		
		ResponseEntity<List<Product>> entity 
		= new ResponseEntity<List<Product>>(products, HttpStatus.OK);
		return entity;
	}

	@GetMapping(path="/product2.do", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Product> getProduct2(@RequestParam("no") int productNo) {
		Product product = productService.getProductDetail(productNo);
		ResponseEntity<Product> entity 
			= new ResponseEntity<Product>(product, HttpStatus.OK);
		return entity;
	}
	
	   
}
