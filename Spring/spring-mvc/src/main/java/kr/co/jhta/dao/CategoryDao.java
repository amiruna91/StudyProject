package kr.co.jhta.dao;

import java.util.List;

import kr.co.jhta.vo.Category;

public interface CategoryDao {

	Category getCategoryById(String categoryId);
	List<Category> getAllCategories();
}
