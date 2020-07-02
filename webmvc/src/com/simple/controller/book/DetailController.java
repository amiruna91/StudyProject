package com.simple.controller.book;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.simple.controller.Controller;
import com.simple.dao.BookDao;
import com.simple.dao.ReviewDao;
import com.simple.util.NumberUtil;
import com.simple.vo.Book;
import com.simple.vo.Review;

public class DetailController implements Controller {
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("DetailController.process(req, res) 실행됨...");
		
		int bookNo = NumberUtil.stringToInt(req.getParameter("bookno"));
		BookDao bookDao = new BookDao();
		Book book = bookDao.getBookByNo(bookNo);
		
		// 책번호에 해당하는 책의 리뷰 정보를 획득하기
		ReviewDao reviewDao = new ReviewDao();
		List<Review> reviews = reviewDao.getReviewByBookNo(bookNo);
		
		req.setAttribute("book", book);
		req.setAttribute("reviews", reviews);
		return "book/detail.jsp";	// 내부이동할 뷰페이지 이름
	}

}
