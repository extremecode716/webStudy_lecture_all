package board1.service;

import java.util.List;

import board1.model.Board;

public interface BoardService {
	// List<Board> list(int startRow, int endRow);
	List<Board> list(Board board);

	int getTotal(Board board);

	int insert(Board board);

	Board select(int num);

	void selectUpdate(int num);

	int update(Board board);

	int delete(int num);

	int getMaxNum();

	void updateRe(Board board);
}