package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;

public class BoardListAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("BoardListAction");
		
		int page=1;
		int limit=10;
		
		if(request.getParameter("page")!=null) {
			page = Integer.parseInt(request.getParameter("page"));					
		}
		
		int startRow = (page-1) * limit + 1;
		int endRow = page * limit;
		
		List boardlist = null;
		BoardDAO dao = BoardDAO.getInstance();		
		int listcount = dao.getCount();
//		boardlist = dao.getList(startRow, endRow);
//		boardlist = dao.getList(page);

//      Map 처리	----------------------------------	
		Map map = new HashMap();
		map.put("start", startRow);
		map.put("end", endRow);
		
		boardlist = dao.getList(page);		
//-------------------------------------------------		
		System.out.println("listcount:"+listcount);
		System.out.println("boardlist:"+boardlist);		
		
		int pageCount = listcount/limit + ((listcount%limit==0) ? 0:1);
		
		int startPage = ((page-1)/10) * limit + 1;
		int endPage = startPage + 10 - 1;
		
		if(endPage > pageCount) endPage = pageCount;
		
		request.setAttribute("page", page);
		request.setAttribute("listcount", listcount);
		request.setAttribute("boardlist", boardlist);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/board/qna_board_list.jsp");
		
		return forward;
	}

}
