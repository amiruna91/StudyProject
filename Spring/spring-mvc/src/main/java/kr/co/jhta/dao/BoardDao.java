package kr.co.jhta.dao;

import java.util.List;

import kr.co.jhta.vo.Board;

public interface BoardDao {

	void insertBoard(Board board);
	void updateBoard(Board board);
	List<Board> selectBoards();
	Board selectBoard(long boardNo);
}
