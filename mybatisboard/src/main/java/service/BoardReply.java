package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import model.BoardBean;

public class BoardReply implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("BoardReply");
		
		request.setCharacterEncoding("utf-8");
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int board_re_ref = Integer.parseInt(request.getParameter("board_re_ref"));
		int board_re_lev = Integer.parseInt(request.getParameter("board_re_lev"));
		int board_re_seq = Integer.parseInt(request.getParameter("board_re_seq"));
		String page = request.getParameter("page");
		
		BoardBean board = new BoardBean();
		board.setBoard_re_ref(board_re_ref);
		board.setBoard_re_seq(board_re_seq);
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.updateSeq(board); 	// board_re_seq값 증가 		
		
		board.setBoard_re_seq(board_re_seq+1);
		board.setBoard_re_lev(board_re_lev+1);		
		board.setBoard_name(request.getParameter("board_name"));
		board.setBoard_pass(request.getParameter("board_pass"));
		board.setBoard_subject(request.getParameter("board_subject"));
		board.setBoard_content(request.getParameter("board_content"));
					
		dao.boardReply(board);		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/BoardDetailAction.do?board_num="+board_num+"&page="+page);
		
		return forward;
	}

}
