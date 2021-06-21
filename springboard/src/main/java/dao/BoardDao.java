package dao;

import java.util.List;

import model.BoardBean;

public interface BoardDao {

	public void insertBoard(BoardBean b) throws Exception;

	public List<BoardBean> getBoardList(int page) throws Exception;

	public int getListCount() throws Exception;

	public BoardBean getBoardCont(int board_num) throws Exception;

	public void boardHit(int board_num) throws Exception;

	public void boardEdit(BoardBean b) throws Exception;

	public void boardDelete(int board_num) throws Exception;

	public void refEdit(BoardBean b) throws Exception;

	public void boardReplyOk(BoardBean b) throws Exception;
}
