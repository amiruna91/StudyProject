package com.withice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.withice.dto.ProductInfo;
import com.withice.dto.ProductWithCategoryName;
import com.withice.util.ConnectionUtil;
import com.withice.util.JdbcHelper;
import com.withice.util.JdbcHelper.RowMapper;
import com.withice.util.QueryUtil;
import com.withice.vo.Product;
import com.withice.vo.ProductTag;


public class ProductDao {

	public List<Product> getNewProductByDate() throws SQLException {
		List<Product> products = new ArrayList<Product>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("product.getNewProductByDate"));
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Product product = new Product();
			product.setNo(rs.getInt("product_no"));
			product.setName(rs.getString("product_name"));
			product.setPrice(rs.getInt("product_price"));
			product.setStock(rs.getInt("product_stock"));
			product.setComment(rs.getString("product_comment"));
			product.setThumbnail(rs.getString("product_thumbnail"));
			product.setDate(rs.getDate("product_registered_date"));
			product.setCateNo(rs.getInt("cate_no"));
			
			products.add(product);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return products;
	}
	
	public Product getProductByNo(int productNo) throws SQLException {
		Product product = null;
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("product.getProductByNo"));
		pstmt.setInt(1, productNo);
		ResultSet rs = pstmt.executeQuery();

		if(rs.next()) {
			product = new Product();
			product.setNo(rs.getInt("product_no"));
			product.setName(rs.getString("product_name"));
			product.setPrice(rs.getInt("product_price"));
			product.setStock(rs.getInt("product_stock"));
			product.setComment(rs.getString("product_comment"));
			product.setThumbnail(rs.getString("product_thumbnail"));
			product.setDate(rs.getDate("product_registered_date"));
			product.setCateNo(rs.getInt("cate_no"));
		}
		rs.close();
		pstmt.close();
		connection.close();
		return product;
	}
	
	public List<Product> getBestProduct() throws SQLException {
		List<Product> products = new ArrayList<Product>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("product.getBestProduct"));
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Product product = new Product();
			product.setNo(rs.getInt("product_no"));
			product.setName(rs.getString("product_name"));
			product.setPrice(rs.getInt("product_price"));
			product.setStock(rs.getInt("product_stock"));
			product.setComment(rs.getString("product_comment"));
			product.setThumbnail(rs.getString("product_thumbnail"));
			product.setDate(rs.getDate("product_registered_date"));
			product.setCateNo(rs.getInt("cate_no"));
			
			products.add(product);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return products;
	}
	
	public List<ProductTag> getProductTagsByNo(int productNo) throws SQLException {
		List<ProductTag> tags = new ArrayList<ProductTag>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("product.getProductTagsByNo"));
		pstmt.setInt(1, productNo);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			ProductTag tag = new ProductTag();
			
			tag.setNo(rs.getInt("tag_no"));
			tag.setName(rs.getString("tag_name"));
			tag.setTagThumbnail(rs.getString("tag_thumnail"));
			
			tags.add(tag);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return tags;
	}
	
	public List<Product> getProductByMainCategory(int cateNo, int beginIndex, int endIndex) throws SQLException {
		return JdbcHelper.selectList(QueryUtil.getSQL("product.getProductByMainCategory"), new RowMapper<Product>() {
			@Override
			public Product mapRow(ResultSet rs) throws SQLException {
				Product product = new Product();
				product.setNo(rs.getInt("product_no"));
				product.setName(rs.getString("product_name"));
				product.setPrice(rs.getInt("product_price"));
				product.setStock(rs.getInt("product_stock"));
				product.setComment(rs.getString("product_comment"));
				product.setThumbnail(rs.getString("product_thumbnail"));
				product.setDate(rs.getDate("product_registered_date"));
				product.setCateNo(rs.getInt("cate_no"));
				
				return product;
			}
		}, cateNo, beginIndex, endIndex);
	}
	
	public List<Product> getProductByCategory(int cateNo, int beginIndex, int endIndex) throws SQLException {
		return JdbcHelper.selectList(QueryUtil.getSQL("product.getProductByCategory"), new RowMapper<Product>() {
			@Override
			public Product mapRow(ResultSet rs) throws SQLException {
				Product product = new Product();
				product.setNo(rs.getInt("product_no"));
				product.setName(rs.getString("product_name"));
				product.setPrice(rs.getInt("product_price"));
				product.setStock(rs.getInt("product_stock"));
				product.setComment(rs.getString("product_comment"));
				product.setThumbnail(rs.getString("product_thumbnail"));
				product.setDate(rs.getDate("product_registered_date"));
				product.setCateNo(rs.getInt("cate_no"));
				
				return product;
			}
		}, cateNo, beginIndex, endIndex);
	}
	
	public List<ProductInfo> getProductInfo(int productNo) throws SQLException {
		return JdbcHelper.selectList(QueryUtil.getSQL("product.getProductInfo"), new RowMapper<ProductInfo>() {
			@Override
			public ProductInfo mapRow(ResultSet rs) throws SQLException {
				ProductInfo productInfo = new ProductInfo();
				productInfo.setNo(rs.getInt("product_no"));
				productInfo.setImageNo(rs.getInt("image_no"));
				productInfo.setImageName(rs.getString("image_name"));
				productInfo.setImagePath(rs.getString("image_path"));
				productInfo.setDate(rs.getDate("product_info_date"));
				return productInfo;
			}
		}, productNo);
	}
	
	public int getAllProductCnt() throws SQLException {
		int AllCount = 0;
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("product.getAllProductCnt"));
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			AllCount = rs.getInt("cnt");
		}
		
		return AllCount;
		
	}
	
	public List<Product> getAllProducts(int beginIndex, int endIndex) throws SQLException {
		return JdbcHelper.selectList(QueryUtil.getSQL("product.getAllProducts"), new RowMapper<Product>() {
			@Override
			public Product mapRow(ResultSet rs) throws SQLException {
				Product product = new Product();
				product.setNo(rs.getInt("product_no"));
				product.setName(rs.getString("product_name"));
				product.setPrice(rs.getInt("product_price"));
				product.setStock(rs.getInt("product_stock"));
				product.setComment(rs.getString("product_comment"));
				product.setThumbnail(rs.getString("product_thumbnail"));
				product.setDate(rs.getDate("product_registered_date"));
				product.setCateNo(rs.getInt("cate_no"));
				
				return product;
			}
		},beginIndex, endIndex);
	}
	
	public void insertNewProduct(Product product) throws SQLException {
		JdbcHelper.insert(QueryUtil.getSQL("product.insertNewProduct"), product.getName(), product.getPrice(), product.getStock(),
				product.getComment(), product.getThumbnail(), product.getCateNo(), product.getOption());
	}
	
	public ProductWithCategoryName getProductWithCateName(int productNo) throws SQLException {
		
		return JdbcHelper.selectOne(QueryUtil.getSQL("product.getProductWithCateName"), new RowMapper<ProductWithCategoryName>() {
			@Override
			public ProductWithCategoryName mapRow(ResultSet rs) throws SQLException {
				ProductWithCategoryName pro = new ProductWithCategoryName();
				pro.setNo(rs.getInt("product_no"));
				pro.setName(rs.getString("product_name"));
				pro.setPrice(rs.getInt("product_price"));
				pro.setStock(rs.getInt("product_stock"));
				pro.setComment(rs.getString("product_comment"));
				pro.setThumbnail(rs.getString("product_thumbnail"));
				pro.setDate(rs.getDate("product_registered_date"));
				pro.setOption(rs.getString("product_option"));
				pro.setSubCateNo(rs.getInt("sub_cate_no"));
				pro.setSubCateName(rs.getString("sub_cate_name"));
				pro.setMainCateNo(rs.getInt("main_cate_no"));
				pro.setMainCateName(rs.getString("main_cate_name"));
				pro.setInfoStatus(rs.getString("info_status"));
				return pro;
			}
		}, productNo);
	}
	
	public void updateProduct(Product product) throws SQLException {
		JdbcHelper.update(QueryUtil.getSQL("product.updateProduct"), product.getName(),
				product.getPrice(), product.getStock(), product.getComment(),product.getOption(),
				product.getNo());
	}
	
	public void insertProductImage(String name, String path) throws SQLException {
		JdbcHelper.insert(QueryUtil.getSQL("product.insertImage"), name, path);
	}
	
	public int getImageNoByName(String name) throws SQLException {
		int imageNo = 0;
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("product.getImageNoByName"));
		pstmt.setString(1, name);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			imageNo = rs.getInt("image_no");
		}
		
		return imageNo;
	}
	
	public void insertProductInfo(int imageNo, int productNo) throws SQLException {
		JdbcHelper.insert(QueryUtil.getSQL("product.insertProductInfo"), imageNo, productNo);
	}
}
