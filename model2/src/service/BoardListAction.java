package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import model.BoardBean;

public class BoardListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("BoardListAction");
		
		int page = 1; 		// 현재 페이지 번호
		int limit = 10;     // 한 화면에 출력할 데이터 갯수
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		// page =1  startRow=1, endRow=10
		// page =2  startRow=11, endRow=20
		int startRow = (page-1) * limit + 1;	
		int endRow = page * limit;
		
		BoardDAO dao = BoardDAO.getInstance();
		int listcount = dao.getCount();		// 총 데이터 갯수
		System.out.println("listcount:"+ listcount);
		
		List<BoardBean> boardlist = dao.getList(startRow, endRow);
		System.out.println("boardlist:" + boardlist);
		
		// 총 페이지
		int pageCount=listcount/limit+((listcount%limit==0) ? 0:1); 
		
		int startPage = ((page - 1)/10) * limit + 1; // 1,  11, 21..
		int endPage = startPage + 10 - 1;            // 10, 20, 30..
		
		if(endPage > pageCount)   endPage = pageCount;
		
		request.setAttribute("page", page);
		request.setAttribute("listcount", listcount);
		request.setAttribute("boardlist", boardlist);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		ActionForward forward = new ActionForward();
		
		// dispatcher 방식으로 포워딩이 되어야, view 페이지에서 공유한 값에 
		// 접근할수 있다.
		forward.setRedirect(false);  // dispatcher 방식으로 포워딩
		forward.setPath("./board/qna_board_list.jsp");
		
		return forward;
	}

}
