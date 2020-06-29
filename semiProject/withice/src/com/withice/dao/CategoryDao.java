package com.withice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.tree.RowMapper;
import javax.swing.tree.TreePath;

import com.withice.dto.CategoryAndCnt;
import com.withice.util.ConnectionUtil;
import com.withice.util.JdbcHelper;
import com.withice.util.QueryUtil;
import com.withice.vo.Category;

public class CategoryDao {
	
	public List<Category> getMainCategorys() throws SQLException {
		List<Category> categories = new ArrayList<Category>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("category.getMainCategorys"));
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Category category = new Category();
			
			category.setNo(rs.getInt("cate_no"));
			category.setName(rs.getString("cate_name"));
			
			categories.add(category);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return categories;
	}
	
	public List<Category> getCategoryByNo(int cateNo) throws SQLException {
		List<Category> categories = new ArrayList<Category>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("category.getCategoryByNo"));
		pstmt.setInt(1, cateNo);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Category category = new Category();
			
			category.setNo(rs.getInt("cate_no"));
			category.setName(rs.getString("cate_name"));
			category.setMainCateNo(rs.getInt("main_cate_no"));
			
			categories.add(category);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return categories;
	}
	
	public Category getCategoryWithMain(int cateNo) throws SQLException {
		Category category = null;
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("category.getCategoryWithMain"));
		pstmt.setInt(1, cateNo);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			category = new Category();
			
			category.setNo(rs.getInt("cate_no"));
			category.setName(rs.getString("cate_name"));
			category.setMainCateNo(rs.getInt("mainno"));
			category.setMainCateName(rs.getString("mainname"));
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return category;
	}
	
	public List<CategoryAndCnt> getCategoryAndCntByNo(int cateNo) throws SQLException {
		List<CategoryAndCnt> categories = new ArrayList<CategoryAndCnt>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("category.getCategoryAndCntByNo"));
		pstmt.setInt(1, cateNo);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			CategoryAndCnt category = new CategoryAndCnt();
			
			category.setNo(rs.getInt("cate_no"));
			category.setName(rs.getString("cate_name"));
			category.setMainCateNo(rs.getInt("main_cate_no"));
			category.setCount(rs.getInt("cnt"));
			
			categories.add(category);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return categories;
	}
}
