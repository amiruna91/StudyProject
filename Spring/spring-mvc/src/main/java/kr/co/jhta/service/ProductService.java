package kr.co.jhta.service;

import java.util.List;

import kr.co.jhta.vo.Category;
import kr.co.jhta.vo.Product;

public interface ProductService {

	List<Category> getAllCategories();
	List<Product> getAllProducts();
	void addNewProduct(Product product);
	Product getProductDetail(long productNo);
}
