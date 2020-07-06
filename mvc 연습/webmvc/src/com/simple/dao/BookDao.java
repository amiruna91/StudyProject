package com.simple.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.simple.util.JdbcHelper;
import com.simple.util.JdbcHelper.RowMapper;
import com.simple.util.QueryUtil;
import com.simple.vo.Book;

public class BookDao {

	public List<Book> getAllBooks() throws SQLException {
		return JdbcHelper.selectList(QueryUtil.getSQl("book.getAllBooks"), new RowMapper<Book>() {
			@Override
			public Book mapRow(ResultSet rs) throws SQLException {
				Book book = new Book();
				book.setNo(rs.getInt("book_no"));
				book.setTitle(rs.getString("book_title"));
				book.setWriter(rs.getString("book_writer"));
				book.setGenre(rs.getString("book_genre"));
				book.setPublisher(rs.getString("book_publisher"));
				book.setPrice(rs.getInt("book_price"));
				book.setDiscountPrice(rs.getInt("book_discount_price"));
				book.setStock(rs.getInt("book_stock"));
				book.setPoint(rs.getDouble("book_point"));
				book.setLikes(rs.getInt("book_likes"));
				book.setRegisteredDate(rs.getDate("book_registered_date"));
				return book;
			}
		});
	}
	
	public Book getBookByNo(int bookNo) throws SQLException {
		return JdbcHelper.selectOne(QueryUtil.getSQl("book.getBookByNo"), new RowMapper<Book>() {
			@Override
			public Book mapRow(ResultSet rs) throws SQLException {
				Book book = new Book();
				book.setNo(rs.getInt("book_no"));
				book.setTitle(rs.getString("book_title"));
				book.setWriter(rs.getString("book_writer"));
				book.setGenre(rs.getString("book_genre"));
				book.setPublisher(rs.getString("book_publisher"));
				book.setPrice(rs.getInt("book_price"));
				book.setDiscountPrice(rs.getInt("book_discount_price"));
				book.setStock(rs.getInt("book_stock"));
				book.setPoint(rs.getDouble("book_point"));
				book.setLikes(rs.getInt("book_likes"));
				book.setRegisteredDate(rs.getDate("book_registered_date"));
				return book;
			}
		}, bookNo);
	}
	
	public List<Book> getRecentBooks() throws SQLException {
		return JdbcHelper.selectList(QueryUtil.getSQl("book.getRecentBooks"), new RowMapper<Book>() {
			@Override
			public Book mapRow(ResultSet rs) throws SQLException {
				Book book = new Book();
				book.setNo(rs.getInt("book_no"));
				book.setTitle(rs.getString("book_title"));
				book.setWriter(rs.getString("book_writer"));
				book.setGenre(rs.getString("book_genre"));
				book.setPublisher(rs.getString("book_publisher"));
				book.setPrice(rs.getInt("book_price"));
				book.setDiscountPrice(rs.getInt("book_discount_price"));
				book.setStock(rs.getInt("book_stock"));
				book.setPoint(rs.getDouble("book_point"));
				book.setLikes(rs.getInt("book_likes"));
				book.setRegisteredDate(rs.getDate("book_registered_date"));
				return book;
			}
		});
	}
	
	public void insertBook(Book book) throws SQLException {
		JdbcHelper.insert(QueryUtil.getSQl("book.insertBook"), book.getTitle(), book.getWriter(), book.getGenre(),
				book.getPublisher(), book.getPrice(), book.getDiscountPrice());
	}
}
