package com.withice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.withice.util.ConnectionUtil;
import com.withice.util.JdbcHelper;
import com.withice.util.JdbcHelper.RowMapper;
import com.withice.util.QueryUtil;
import com.withice.vo.Condition;
import com.withice.vo.Question;
import com.withice.vo.QuestionCategory;


public class QuestionDao {

	public List<QuestionCategory> getCategories() throws SQLException {
		List<QuestionCategory> categories = new ArrayList<QuestionCategory>();

		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("question.getCategories"));
		ResultSet rs = pstmt.executeQuery();

		while(rs.next()) {
			QuestionCategory  category = new QuestionCategory();

			category.setNo(rs.getInt("question_cate_no"));
			category.setTitle(rs.getString("question_cate_name"));
			category.setType(rs.getString("question_cate_type"));

			categories.add(category);

		}

		rs.close();
		pstmt.close();
		connection.close();

		return categories;


	}

	public List<QuestionCategory> getCategoryTitle() throws SQLException {
		List<QuestionCategory> categories = new ArrayList<QuestionCategory>();

		Connection connection =ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("question.getCategoryTitles"));
		ResultSet rs = pstmt.executeQuery();

		while(rs.next()) {
			QuestionCategory  category = new QuestionCategory();

			category.setNo(rs.getInt("question_cate_no"));
			category.setTitle(rs.getString("question_cate_name"));
			category.setType(rs.getString("question_cate_type"));

			categories.add(category);

		}

		rs.close();
		pstmt.close();
		connection.close();

		return categories;
	}
	
	public int getQuestionsCount(Condition condition) throws SQLException {
		StringBuilder sql = new StringBuilder();
	
		sql.append(" select count(*) cnt ");
		sql.append(" from withice_questions A");
		sql.append(" where 1 = 1 ");
		if (condition.getCategoryNo() != 0) {
			sql.append("   and QUESTION_CATE_NO = " + condition.getCategoryNo());
		}
		if (condition.getCompleted() != -1) {
			sql.append("   and QUESTION_STATUS = " + condition.getCompleted());
		}
		
		return JdbcHelper.selectOne(sql.toString(), new RowMapper<Integer>() {
			@Override
			public Integer mapRow(ResultSet rs) throws SQLException {
				return rs.getInt("cnt");
			}
		});
		
	}

	public List<Question> getSearchQuestions(Condition condition) throws SQLException {
		
		StringBuilder sql = new StringBuilder();
		sql.append(" select * ");
		sql.append(" from (");
		sql.append("       select A.*, row_number() over (order by question_no desc) rn ");
		sql.append("       from withice_questions A");
		sql.append("       where 1 = 1 ");
		if (condition.getCategoryNo() != 0) {
			sql.append("   and QUESTION_CATE_NO = " + condition.getCategoryNo());
		}
		if (condition.getCompleted() != -1) {
			sql.append("   and QUESTION_STATUS = " + condition.getCompleted());
		}
		sql.append(")");
		sql.append(" where rn >= ? and rn <= ?");
		
		
		List<Question> questions = new ArrayList<Question>();
		Connection connection = ConnectionUtil.getConnection();
		
		PreparedStatement pstmt = connection.prepareStatement(sql.toString());
		pstmt.setInt(1, condition.getBeginIndex());
		pstmt.setInt(2, condition.getEndIndex());
		ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			Question question = new Question();

			question.setQuestionNo(rs.getInt("question_no"));
			question.setTitle(rs.getString("question_title"));
			question.setResisteredDate(rs.getDate("question_registered_date"));
			question.setContent(rs.getString("question_content"));
			question.setSubject(rs.getString("question_subject"));
			question.setViewCount(rs.getInt("question_view_count"));
			question.setStatus(rs.getInt("question_status"));
			question.setImage(rs.getString("question_image"));
			question.setUserId(rs.getString("user_id"));
			question.setProductNo(rs.getInt("product_no"));
			question.setCateNo(rs.getInt("question_cate_no"));
			question.setDelYN(rs.getString("question_del_yn"));

			questions.add(question);

		}
		rs.close();
		pstmt.close();
		connection.close();

		return questions;

	}

	public void insertQuestion(Question question) throws Exception {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("question.insertQuestion"));
		pstmt.setString(1, question.getTitle());
		pstmt.setString(2, question.getContent());
		pstmt.setString(3, question.getImage());
		pstmt.setString(4, question.getUserId());
		pstmt.setInt(5, question.getProductNo());
		pstmt.setInt(6, question.getCateNo());		
		pstmt.setString(7, question.getSubject());

		pstmt.executeUpdate();

		pstmt.close();
		connection.close();
	}

	public Question getQuestionByNo(int questionNo) throws Exception {
		Question question = null;

		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("question.getQuestionByNo"));
		pstmt.setInt(1, questionNo);
		ResultSet rs = pstmt.executeQuery();

		if (rs.next()) {
			question = new Question();
			question.setQuestionNo(rs.getInt("question_no"));
			question.setTitle(rs.getString("question_title"));
			question.setResisteredDate(rs.getDate("question_registered_date"));
			question.setContent(rs.getString("question_content"));
			question.setSubject(rs.getString("question_subject"));
			question.setViewCount(rs.getInt("question_view_count"));
			question.setStatus(rs.getInt("question_status"));
			question.setImage(rs.getString("question_image"));
			question.setUserId(rs.getString("user_id"));
			question.setProductNo(rs.getInt("product_no"));
			question.setCateNo(rs.getInt("question_cate_no"));
			question.setSubject(rs.getString("question_subject"));
			question.setDelYN(rs.getString("question_del_yn"));


		}

		rs.close();
		pstmt.close();
		connection.close();

		return question;

	}

	public QuestionCategory getCategoryByNo(int cateNo) throws SQLException {
		QuestionCategory category = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("question.getCategoryByNo"));
		pstmt.setInt(1, cateNo);
		
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			category = new QuestionCategory();

			category.setNo(rs.getInt("question_cate_no"));
			category.setTitle(rs.getString("question_cate_name"));
			category.setType(rs.getString("question_cate_type"));

		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return category;
	}
	public void deleteQuestion(Question question) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("question.deleteQuestion"));
		pstmt.setInt(1, question.getQuestionNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void updateQuestion(Question question) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("question.updateQuestion"));
		pstmt.setInt(1, question.getCateNo());
		pstmt.setString(2, question.getTitle());
		pstmt.setString(3, question.getSubject());
		pstmt.setString(4, question.getContent());
		pstmt.setInt(5, question.getStatus());
		pstmt.setString(6, question.getImage());
		pstmt.setInt(7, question.getQuestionNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void updateViewCount(int questionNo) {
		JdbcHelper.update(QueryUtil.getSQL("question.updateViewCount"), questionNo);
	}
	
	public Question preView (int questionNo) throws SQLException {
		return JdbcHelper.selectOne(QueryUtil.getSQL("question.preView"), new RowMapper<Question>() {
			@Override
			public Question mapRow(ResultSet rs) throws SQLException {
				Question question = new Question();
				question.setQuestionNo(rs.getInt("question_no"));
				question.setTitle(rs.getString("question_title"));
				question.setResisteredDate(rs.getDate("question_registered_date"));
				question.setContent(rs.getString("question_content"));
				question.setSubject(rs.getString("question_subject"));
				question.setViewCount(rs.getInt("question_view_count"));
				question.setStatus(rs.getInt("question_status"));
				question.setImage(rs.getString("question_image"));
				question.setUserId(rs.getString("user_id"));
				question.setProductNo(rs.getInt("product_no"));
				question.setCateNo(rs.getInt("question_cate_no"));
				question.setSubject(rs.getString("question_subject"));
				question.setDelYN(rs.getString("question_del_yn"));
				
				return question;
			}
		}, questionNo);
	}
	public Question afterView (int questionNo) throws SQLException {
		return JdbcHelper.selectOne(QueryUtil.getSQL("question.afterView"), new RowMapper<Question>() {
			@Override
			public Question mapRow(ResultSet rs) throws SQLException {
				Question question = new Question();
				question.setQuestionNo(rs.getInt("question_no"));
				question.setTitle(rs.getString("question_title"));
				question.setResisteredDate(rs.getDate("question_registered_date"));
				question.setContent(rs.getString("question_content"));
				question.setSubject(rs.getString("question_subject"));
				question.setViewCount(rs.getInt("question_view_count"));
				question.setStatus(rs.getInt("question_status"));
				question.setImage(rs.getString("question_image"));
				question.setUserId(rs.getString("user_id"));
				question.setProductNo(rs.getInt("product_no"));
				question.setCateNo(rs.getInt("question_cate_no"));
				question.setSubject(rs.getString("question_subject"));
				question.setDelYN(rs.getString("question_del_yn"));
				
				return question;
			}
		}, questionNo);
	}
	
	public List<Question> getQuestionsById(String id) throws SQLException {
		List<Question> questions = new ArrayList<Question>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("question.getQuestionById"));
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Question question = new Question();
			question.setQuestionNo(rs.getInt("question_no"));
			question.setTitle(rs.getString("question_title"));
			question.setResisteredDate(rs.getDate("question_registered_date"));
			question.setContent(rs.getString("question_content"));
			question.setSubject(rs.getString("question_subject"));
			question.setViewCount(rs.getInt("question_view_count"));
			question.setStatus(rs.getInt("question_status"));
			question.setImage(rs.getString("question_image"));
			question.setUserId(rs.getString("user_id"));
			question.setProductNo(rs.getInt("product_no"));
			question.setCateNo(rs.getInt("question_cate_no"));
			question.setSubject(rs.getString("question_subject"));
			question.setDelYN(rs.getString("question_del_yn"));
			
			questions.add(question);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return questions;
	}
	
	public List<Question> getQuestionsByIdMax(String id) throws SQLException {
		List<Question> questions = new ArrayList<Question>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("question.getQuestionByIdMax"));
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Question question = new Question();
			question.setQuestionNo(rs.getInt("question_no"));
			question.setTitle(rs.getString("question_title"));
			question.setResisteredDate(rs.getDate("question_registered_date"));
			question.setContent(rs.getString("question_content"));
			question.setViewCount(rs.getInt("question_view_count"));
			question.setStatus(rs.getInt("question_status"));
			question.setImage(rs.getString("question_image"));
			question.setUserId(rs.getString("user_id"));
			question.setProductNo(rs.getInt("product_no"));
			question.setCateNo(rs.getInt("question_cate_no"));
			question.setSubject(rs.getString("question_subject"));
			question.setDelYN(rs.getString("question_del_yn"));
			
			questions.add(question);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return questions;
	}
	
	public List<Question> getQuestionByStatus() throws SQLException {
		List<Question> questions = new ArrayList<Question>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("question.getQuestionByStatus"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Question question = new Question();
			question.setQuestionNo(rs.getInt("question_no"));
			question.setTitle(rs.getString("question_title"));
			question.setUserId(rs.getString("user_id"));
			
			questions.add(question);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return questions;
	}
}
