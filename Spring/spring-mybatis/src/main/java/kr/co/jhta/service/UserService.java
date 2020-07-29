package kr.co.jhta.service;

import java.util.List;

import kr.co.jhta.vo.Blog;
import kr.co.jhta.vo.Comment;
import kr.co.jhta.vo.User;

/**
 * 신규가입, 로그인, 내가 작성한 게시글 조회, 내가 작성한 댓글 조회,
 * 내 정보 변경, 계정 삭제 서비스를 정의한다.
 * @author USER
 *
 */
public interface UserService {

	/**
	 * 회원가입 서비스를 제공한다.<br/>
	 * 동일한 아이디를 가진 사용자는 등록될 수 없다.<br/>
	 * @param user 회원가입 정보가 포함된 User객체
	 */
	void addNewUser(User user);
	
	/**
	 * 아이디와 비밀번호를 검증해서 인증된 사용자인 경우, 
	 * 사용자 정보를 제공한다.
	 * @param id 
	 * @param password
	 * @return 인증된 사용자 정보가 포함된 User객체, null이 반홤될 수 있음
	 */
	User login(String id, String password);
	List<Blog> getMyBlogs(String userId);
	List<Comment> getMyComments(String userId);
	void updateUserInfo(User user);
	void deleteMyAccount(String userId);
	
}
