package com.simple.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.simple.util.JdbcHelper;
import com.simple.util.JdbcHelper.RowMapper;
import com.simple.util.QueryUtil;
import com.simple.vo.Review;

public class ReviewDao {

	public List<Review> getReviewByBookNo(int bookNo) throws SQLException {
		return JdbcHelper.selectList(QueryUtil.getSQl("review.getReviewByBookNo"), new RowMapper<Review>() {
			@Override
			public Review mapRow(ResultSet rs) throws SQLException {
				Review review = new Review();
				review.setNo(rs.getInt("review_no"));
				review.setContent(rs.getString("review_content"));
				review.setPoint(rs.getInt("review_point"));
				review.setBookNo(rs.getInt("book_no"));
				review.setUserId(rs.getString("user_id"));
				review.setRegisteredDate(rs.getDate("review_registered_date"));
				return review;
			}
		}, bookNo);
	}
	
	public void insertReview(Review review) throws SQLException {
		JdbcHelper.insert(QueryUtil.getSQl("review.insertReview"), review.getContent(), review.getPoint(),
				review.getBookNo(), review.getUserId());
	}
	
	public void deleteReview(int reviewNo) throws SQLException {
		JdbcHelper.delete(QueryUtil.getSQl("review.deleteReview"), reviewNo);
	}
	
	public Review getReviewByNo(int reviewNo) throws SQLException {
		return JdbcHelper.selectOne(QueryUtil.getSQl("review.getReviewByNo"), new RowMapper<Review>() {
			@Override
			public Review mapRow(ResultSet rs) throws SQLException {
				Review review = new Review();
				review.setNo(rs.getInt("review_no"));
				review.setContent(rs.getString("review_content"));
				review.setPoint(rs.getInt("review_point"));
				review.setBookNo(rs.getInt("book_no"));
				review.setUserId(rs.getString("user_id"));
				review.setRegisteredDate(rs.getDate("review_registered_date"));
				return review;
			}
		}, reviewNo);
	}
}
