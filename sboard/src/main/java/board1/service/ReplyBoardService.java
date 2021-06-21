package board1.service;

import java.util.List;
import board1.model.ReplyBoard;

public interface ReplyBoardService {
	List<ReplyBoard> list(int num);

	void insert(ReplyBoard rb);

	void delete(int rno);

	void update(ReplyBoard rb);
}