package com.withice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.withice.util.ConnectionUtil;
import com.withice.util.QueryUtil;
import com.withice.vo.Answer;

public class AnswerDao {

	public void registerAnswer(Answer answer) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("answer.registerAnswer"));
		
		pstmt.setString(1, answer.getAnswerContent());
		pstmt.setInt(2, answer.getQuestionNo());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public Answer getAnswerByNo(int questionNo) throws SQLException {
		Answer answer = null;
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("answer.getAnswerByNo"));
		pstmt.setInt(1, questionNo);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			answer = new Answer();
			answer.setAnswerContent(rs.getString("answer_content"));
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return answer;
	}
	
	public void updateAnswer(Answer answer) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("answer.updateAnswer"));
		
		pstmt.setString(1, answer.getAnswerContent());
		pstmt.setInt(2, answer.getQuestionNo());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
}
