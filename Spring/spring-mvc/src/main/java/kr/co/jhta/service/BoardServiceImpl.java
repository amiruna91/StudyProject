package kr.co.jhta.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.jhta.dao.BoardDao;
import kr.co.jhta.vo.Board;

@Service
@Transactional
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDao boardDao;
	
	@Override
	public List<Board> getAllBoards() {
		return boardDao.selectBoards();
	}

	@Override
	public void addNewBoard(Board board) {
		boardDao.insertBoard(board);
	}

	@Override
	public Board getBoardDetail(long boardNo) {
		return boardDao.selectBoard(boardNo);
	}

	@Override
	public void increaseBoardLikes(long boardNo) {
		Board savedBoard = boardDao.selectBoard(boardNo);
		savedBoard.setLikes(savedBoard.getLikes() + 1);
		savedBoard.setUpdatedDate(new Date());
		
		boardDao.updateBoard(savedBoard);
	}

	@Override
	public void modifyBoardDetail(Board board) {
		Board savedBoard = boardDao.selectBoard(board.getNo());
		
		if (savedBoard == null) {
			throw new RuntimeException("["+board.getNo()+"]번 게시글이 없습니다.");
		}
		if (!savedBoard.getPassword().equals(board.getPassword())) {
			throw new RuntimeException("비밀번호가 일치하지 않습니다.");
		}
		
		savedBoard.setTitle(board.getTitle());
		savedBoard.setContent(board.getContent());
		savedBoard.setFilename(board.getFilename());
		savedBoard.setUpdatedDate(new Date());
		
		boardDao.updateBoard(savedBoard);
	}

	@Override
	public void deleteBoard(long boardNo, String password) {
		Board savedBoard = boardDao.selectBoard(boardNo);
		
		if (savedBoard == null) {
			throw new RuntimeException("["+boardNo+"]번 게시글이 없습니다.");
		}
		if (!savedBoard.getPassword().equals(password)) {
			throw new RuntimeException("비밀번호가 일치하지 않습니다.");
		}
		
		savedBoard.setDeleted("Y");
		boardDao.updateBoard(savedBoard);
	}

}
