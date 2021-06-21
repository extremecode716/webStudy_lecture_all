package board1.dao;

import java.util.List;
import board1.model.ReplyBoard;

public interface ReplyBoardDao {
	List<ReplyBoard> list(int num);

	void insert(ReplyBoard rb);

	void delete(int rno);

	void update(ReplyBoard rb);
}