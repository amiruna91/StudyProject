package kr.co.jhta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.jhta.dao.CategoryDao;
import kr.co.jhta.dao.ProductDao;
import kr.co.jhta.vo.Category;
import kr.co.jhta.vo.Product;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private CategoryDao categoryDao;
	
	@Autowired
	private ProductDao productDao;

	@Override
	public List<Category> getAllCategories() {
		return categoryDao.getAllCategories();
	}

	@Override
	public List<Product> getAllProducts() {
		return productDao.getAllProducts();
	}

	@Override
	public void addNewProduct(Product product) {
		productDao.insertProduct(product);
	}

	@Override
	public Product getProductDetail(long productNo) {
		return productDao.getProductByNo(productNo);
	}
	
}
