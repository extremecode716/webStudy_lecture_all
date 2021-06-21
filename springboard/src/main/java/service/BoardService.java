package service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardBean;

public interface BoardService {

	public void insert(BoardBean b) throws Exception;
	
	public void hit(int board_num) throws Exception;

	public BoardBean board_cont(int board_num) throws Exception;

	public void edit(BoardBean b) throws Exception;

	public void del_ok(int board_num) throws Exception;

	public void reply_ok(BoardBean b) throws Exception;
	
	public int getListCount() throws Exception;
	
	public List getBoardList(int page) throws Exception;

}
