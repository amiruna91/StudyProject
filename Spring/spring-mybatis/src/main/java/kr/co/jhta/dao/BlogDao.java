package kr.co.jhta.dao;

import java.util.List;

import kr.co.jhta.vo.Blog;

public interface BlogDao {

	void insertBlog(Blog blog);
	Blog getBlogByNo(int blogNo);
	List<Blog> getBlogs();
	List<Blog> getBlogsByWriter(String writer);
	void updateBlog(Blog blog);
	void deleteBlog(int no);
}
