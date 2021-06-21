package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import model.BoardBean;

public class BoardDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("BoardDetailAction");
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.readcountUpdate(board_num);			   // 조회수 증가
		BoardBean board = dao.getDetail(board_num);// 상세정보 구하기
		
		// 글내용에서 줄바꿈
String board_content=board.getBoard_content().replace("\n","<br>");
		
		// 공유 설정
		request.setAttribute("board_content", board_content);
		request.setAttribute("board", board);
		request.setAttribute("page", page);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);  // dispatcher 방식으로 포워딩
		forward.setPath("./board/qna_board_view.jsp");
		
		return forward;
	}

}
