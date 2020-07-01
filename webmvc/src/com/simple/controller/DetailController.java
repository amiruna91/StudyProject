package com.simple.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.simple.dao.BookDao;
import com.simple.util.NumberUtil;
import com.simple.vo.Book;

public class DetailController implements Controller {
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("DetailController.process(req, res) 실행됨...");
		
		int bookNo = NumberUtil.stringToInt(req.getParameter("bookno"));
		BookDao bookDao = new BookDao();
		Book book = bookDao.getBookByNo(bookNo);
		
		req.setAttribute("book", book);
		return "detail.jsp";	// 내부이동할 뷰페이지 이름
	}

}
