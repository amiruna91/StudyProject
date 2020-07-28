package kr.co.jhta.vo;

import java.util.Date;

public class Comment {

	private int no;
	private User writer;
	private String content;
	private Blog blog;
	private Date createdDate;
	
	public Comment() {}

	public Comment(User writer, String content, Blog blog) {
		super();
		this.writer = writer;
		this.content = content;
		this.blog = blog;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public User getWriter() {
		return writer;
	}

	public void setWriter(User writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Blog getBlog() {
		return blog;
	}

	public void setBlog(Blog blog) {
		this.blog = blog;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	
	
}
