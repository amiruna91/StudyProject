package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookstore.dto.BookDetailDto;
import com.bookstore.util.ConnectionUtil;
import com.bookstore.util.QueryUtil;
import com.bookstore.vo.Book;

public class BookDao {
	
	public void insertBook(Book book) throws Exception {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQl("book.insertBook"));
		pstmt.setString(1, book.getTitle());
		pstmt.setString(2, book.getWriter());
		pstmt.setString(3, book.getGenre());
		pstmt.setString(4, book.getPublisher());
		pstmt.setInt(5, book.getPrice());
		pstmt.setInt(6, book.getDiscountPrice());
		pstmt.setInt(7, book.getStock());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}

	public List<Book> getNewBooks() throws Exception {
		List<Book> books = new ArrayList<Book>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQl("book.getNewBooks"));
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Book book = new Book();
			
			book.setNo(rs.getInt("book_no"));
			book.setTitle(rs.getString("book_title"));
			book.setWriter(rs.getString("book_writer"));
			book.setPrice(rs.getInt("book_price"));
			
			books.add(book);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return books;
	}
	
	public BookDetailDto getBookByNo(int bookNo) throws Exception {
		BookDetailDto book = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQl("book.getBookByNo"));
		pstmt.setInt(1, bookNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			book = new BookDetailDto();
			
			book.setNo(rs.getInt("book_no"));
			book.setTitle(rs.getString("book_title"));
			book.setWriter(rs.getString("book_writer"));
			book.setPublisher(rs.getString("book_publisher"));
			book.setPoint(rs.getDouble("book_point"));
			book.setReviewCnt(rs.getInt("review_cnt"));
			book.setPrice(rs.getInt("book_price"));
			book.setDiscountPrice(rs.getInt("book_discount_price"));
			book.setLikes(rs.getInt("book_likes"));
			book.setStock(rs.getInt("book_stock"));
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return book;
	}
	
	public List<Book> getAllBooks() throws Exception {
		List<Book> books = new ArrayList<Book>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQl("book.getAllBooks"));
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Book book = new Book();
			
			book.setNo(rs.getInt("book_no"));
			book.setTitle(rs.getString("book_title"));
			book.setWriter(rs.getString("book_writer"));
			book.setGenre(rs.getString("book_genre"));
			book.setPublisher(rs.getString("book_publisher"));
			book.setPrice(rs.getInt("book_price"));
			book.setDiscountPrice(rs.getInt("book_discount_price"));
			book.setRegisteredDate(rs.getDate("book_registered_date"));
			book.setStock(rs.getInt("book_stock"));
			book.setPoint(rs.getDouble("book_point"));
			book.setLikes(rs.getInt("book_likes"));
			
			books.add(book);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return books;
	}
}
