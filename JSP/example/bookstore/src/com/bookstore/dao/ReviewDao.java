package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bookstore.dto.ReviewDto;
import com.bookstore.util.ConnectionUtil;
import com.bookstore.util.QueryUtil;

public class ReviewDao {

	public List<ReviewDto> getReviewByBookNo(int bookNo) throws Exception {
		List<ReviewDto> reviews = new ArrayList<ReviewDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQl("review.getReviewByBookNo"));
		pstmt.setInt(1, bookNo);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			ReviewDto review = new ReviewDto();
			
			review.setNo(rs.getInt("review_no"));
			review.setUserName(rs.getString("user_name"));
			review.setPoint(rs.getInt("review_point"));
			review.setContent(rs.getString("review_content"));
			review.setRegisteredDate(rs.getDate("review_registered_date"));
			
			reviews.add(review);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return reviews;
	}
}
