package kr.co.jhta.dao;

import java.util.List;

import kr.co.jhta.vo.Product;

public interface ProductDao {

	void insertProduct(Product product);
	List<Product> getAllProducts();
	List<Product> getProductByCategoryId(String categoryId);
	Product getProductByNo(long productNo);
	void updateProduct(Product product);
}
