package com.withice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.withice.dto.ReviewListDto;
import com.withice.util.ConnectionUtil;
import com.withice.util.JdbcHelper;
import com.withice.util.QueryUtil;
import com.withice.util.JdbcHelper.RowMapper;
import com.withice.vo.Review;

public class ReviewDao {
	
	public List<Review> getAllReview() throws SQLException {
		List<Review> reviews = new ArrayList<Review>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("review.getAllReview"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Review review = new Review();
			
			review.setReviewNo(rs.getInt("review_no"));
			review.setTitle(rs.getString("review_title"));
			review.setRegisteredDate(rs.getDate("review_registered_date"));
			review.setViewCount(rs.getInt("review_view_count"));
			review.setContent(rs.getString("review_content"));
			review.setImage(rs.getString("review_image"));
			review.setUserId(rs.getString("user_id"));
			review.setOrderDetailNo(rs.getInt("order_detail_no"));
			review.setDelYn(rs.getString("review_del_yn"));
			review.setReplyCnt(rs.getInt("review_reply_cnt"));
			
			reviews.add(review);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return reviews;
		
		
	}
	
	public int getTotalCount() throws SQLException {
		
		return JdbcHelper.selectOne(QueryUtil.getSQL("review.getTotalCount").toString(), new RowMapper<Integer>() {
			@Override
			public Integer mapRow(ResultSet rs) throws SQLException {
				return rs.getInt("cnt");
			}
		});
	}
	
	public List<Review> getReviewByProductNo(int productNo) throws SQLException {
		List<Review> reviews = new ArrayList<Review>();
		
		Connection connection = ConnectionUtil.getConnection();
		
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("review.getReviewByProductNo"));
		pstmt.setInt(1, productNo);
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			Review review = new Review();
			review.setReviewNo(rs.getInt("REVIEW_NO"));
			review.setTitle(rs.getString("REVIEW_TITLE"));
			review.setRegisteredDate(rs.getDate("REVIEW_REGISTERED_DATE"));
			review.setViewCount(rs.getInt("REVIEW_VIEW_COUNT"));
			review.setContent(rs.getString("REVIEW_CONTENT"));
			review.setImage(rs.getString("REVIEW_IMAGE"));
			review.setUserId(rs.getString("USER_ID"));
			review.setOrderDetailNo(rs.getInt("ORDER_DETAIL_NO"));
			review.setDelYn(rs.getString("REVIEW_DEL_YN"));
			review.setReplyCnt(rs.getInt("REVIEW_REPLY_CNT"));
			
			reviews.add(review);
		}
		rs.close();
		pstmt.close();
		connection.close();

		return reviews;
	}
	
	public List<ReviewListDto> getReviews(int begin, int end) throws SQLException {
		List<ReviewListDto> reviews = new ArrayList<ReviewListDto>();
	
		Connection connection = ConnectionUtil.getConnection();
		
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("review.getReviews").toString());
		pstmt.setInt(1, begin);
		pstmt.setInt(2, end);
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			ReviewListDto review = new ReviewListDto();
			review.setNo(rs.getInt("REVIEW_NO"));
			review.setTitle(rs.getString("REVIEW_TITLE"));
			review.setRegisterDate(rs.getDate("REVIEW_REGISTERED_DATE"));
			review.setViewCnt(rs.getInt("REVIEW_VIEW_COUNT"));
			review.setUserId(rs.getString("USER_ID"));
			review.setReplyCnt(rs.getInt("REVIEW_REPLY_CNT"));
			review.setCateNo(rs.getInt("cate_no"));
			review.setProductNo(rs.getInt("product_no"));
			review.setProductThum(rs.getString("product_thumbnail"));
			review.setProductName(rs.getString("product_name"));
			
			reviews.add(review);
		}
		rs.close();
		pstmt.close();
		connection.close();

		return reviews;
	}
	
	public void insertReview(Review review) throws Exception {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("review.insertReview"));
		pstmt.setString(1, review.getTitle());
		pstmt.setString(2, review.getContent());
		pstmt.setString(3, review.getImage());
		pstmt.setString(4, review.getUserId());
		pstmt.setInt(5, review.getOrderDetailNo());


		pstmt.executeUpdate();

		pstmt.close();
		connection.close();
	}
	public void deleteReview(Review review) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("review.deleteReview"));
		pstmt.setInt(1, review.getReviewNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void updateReview(Review review) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("review.updateReview"));
		pstmt.setString(1, review.getTitle());
		pstmt.setString(2, review.getContent());
		pstmt.setString(3, review.getImage());
		pstmt.setInt(4, review.getReplyCnt());
		pstmt.setInt(5, review.getReviewNo());

		pstmt.executeUpdate();

		pstmt.close();
		connection.close();
	}
	
	public Review getReviewByNo(int reviewNo) throws Exception {
		Review review = null;

		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("review.getReviewByNo"));
		pstmt.setInt(1, reviewNo);
		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {
			review = new Review();
			review.setReviewNo(rs.getInt("REVIEW_NO"));
			review.setTitle(rs.getString("REVIEW_TITLE"));
			review.setRegisteredDate(rs.getDate("REVIEW_REGISTERED_DATE"));
			review.setViewCount(rs.getInt("REVIEW_VIEW_COUNT"));
			review.setContent(rs.getString("REVIEW_CONTENT"));
			review.setImage(rs.getString("REVIEW_IMAGE"));
			review.setUserId(rs.getString("USER_ID"));
			review.setOrderDetailNo(rs.getInt("ORDER_DETAIL_NO"));
			review.setDelYn(rs.getString("REVIEW_DEL_YN"));
			review.setReplyCnt(rs.getInt("REVIEW_REPLY_CNT"));
			review.setProductNo(rs.getInt("product_no"));
			

		}
		rs.close();
		pstmt.close();
		connection.close();

		return review;

	}

	
	public Review preView (int reviewNo) throws SQLException {
		return JdbcHelper.selectOne(QueryUtil.getSQL("review.preView"), new RowMapper<Review>() {
			@Override
			public Review mapRow(ResultSet rs) throws SQLException {
				Review review = new Review();
				review.setReviewNo(rs.getInt("REVIEW_NO"));
				review.setTitle(rs.getString("REVIEW_TITLE"));
				review.setRegisteredDate(rs.getDate("REVIEW_REGISTERED_DATE"));
				review.setViewCount(rs.getInt("REVIEW_VIEW_COUNT"));
				review.setContent(rs.getString("REVIEW_CONTENT"));
				review.setImage(rs.getString("REVIEW_IMAGE"));
				review.setUserId(rs.getString("USER_ID"));
				review.setOrderDetailNo(rs.getInt("ORDER_DETAIL_NO"));
				review.setDelYn(rs.getString("REVIEW_DEL_YN"));
				review.setReplyCnt(rs.getInt("REVIEW_REPLY_CNT"));
				
				return review;
			}
		}, reviewNo);
	}
	public Review afterView (int reviewNo) throws SQLException {
		return JdbcHelper.selectOne(QueryUtil.getSQL("review.afterView"), new RowMapper<Review>() {
			@Override
			public Review mapRow(ResultSet rs) throws SQLException {
				Review review = new Review();
				review.setReviewNo(rs.getInt("REVIEW_NO"));
				review.setTitle(rs.getString("REVIEW_TITLE"));
				review.setRegisteredDate(rs.getDate("REVIEW_REGISTERED_DATE"));
				review.setViewCount(rs.getInt("REVIEW_VIEW_COUNT"));
				review.setContent(rs.getString("REVIEW_CONTENT"));
				review.setImage(rs.getString("REVIEW_IMAGE"));
				review.setUserId(rs.getString("USER_ID"));
				review.setOrderDetailNo(rs.getInt("ORDER_DETAIL_NO"));
				review.setDelYn(rs.getString("REVIEW_DEL_YN"));
				review.setReplyCnt(rs.getInt("REVIEW_REPLY_CNT"));
				
				return review;
			}
		}, reviewNo);
	}
	
	public void updateViewCount(int reviewNo) {
		JdbcHelper.update(QueryUtil.getSQL("review.updateViewCount"), reviewNo);
	}
	
	public void updateReplyCnt(int reviewNo) {
		System.out.println(reviewNo);
		JdbcHelper.update(QueryUtil.getSQL("review.updateReplyCnt"), reviewNo);
	}
}















