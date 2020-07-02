package com.simple.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.simple.dao.BookDao;
import com.simple.dao.ReviewDao;
import com.simple.util.NumberUtil;
import com.simple.vo.Book;
import com.simple.vo.Review;

import kr.co.jhta.mvc.annotation.Controller;
import kr.co.jhta.mvc.annotation.RequestMapping;
import kr.co.jhta.mvc.servlet.ModelAndView;

@Controller
public class BookController {

	@RequestMapping("/book/list.hta")
	public ModelAndView list(HttpServletRequest req, HttpServletResponse res) throws SQLException {
		ModelAndView mav = new ModelAndView();
		
		BookDao bookDao = new BookDao();
		List<Book> books = bookDao.getAllBooks();
		
		mav.addAttribute("books", books);
		mav.setViewName("book/list.jsp");
		
		return mav;
	}
	
	@RequestMapping("/book/detail.hta")
	public ModelAndView detail(HttpServletRequest req, HttpServletResponse res) throws SQLException {
		ModelAndView mav = new ModelAndView();
		
		int bookNo = NumberUtil.stringToInt(req.getParameter("bookno"));
		
		BookDao bookDao = new BookDao();
		ReviewDao reviewDao = new ReviewDao();
		
		Book book = bookDao.getBookByNo(bookNo);
		List<Review> reviews = reviewDao.getReviewsByBookNo(bookNo);
		
		mav.addAttribute("reviews", reviews);
		mav.addAttribute("book", book);
		mav.setViewName("book/detail.jsp");
		return mav;
	}
}
