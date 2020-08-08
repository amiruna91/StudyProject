package kr.co.jhta.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.jhta.service.ProductService;
import kr.co.jhta.vo.Product;

@RestController
@RequestMapping("/rest")
public class RestProductController {

	@Autowired
	private ProductService productService;
	
	@GetMapping("/products/")
	public List<Product> products() {
		List<Product> products = productService.getAllProducts();
		return products;
	}
	
	@GetMapping("/products/{no}")
	public Product product(@PathVariable("no") int productNo) {
		Product product = productService.getProductDetail(productNo);
		return product;
	}
	
}
