package kr.co.jhta.dto;

import java.util.List;

import kr.co.jhta.vo.Blog;
import kr.co.jhta.vo.Comment;

public class BlogDetailDto {

	private Blog blog;
	private List<Comment> comments;
	
	public BlogDetailDto() {}

	public BlogDetailDto(Blog blog, List<Comment> comments) {
		super();
		this.blog = blog;
		this.comments = comments;
	}

	public Blog getBlog() {
		return blog;
	}

	public void setBlog(Blog blog) {
		this.blog = blog;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	
	
}
