package service;

import java.io.File;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import model.BoardBean;

public class BoardDelete implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("BoardDelete");
		
		response.setContentType("text/html; charset=utf-8"); 
		request.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		String path = request.getRealPath("boardupload");
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		String board_pass  = request.getParameter("board_pass");
				
		BoardDAO dao = BoardDAO.getInstance();
		BoardBean old = dao.getContent(board_num);
		
		if(old.getBoard_pass().equals(board_pass)) { //비번 일치시
			dao.delete(board_num);
			
			if(old.getBoard_file() != null) {
				
				File file = new File(path);
				file.mkdirs();
				
				File[] f = file.listFiles();
				for(int i=0; i<f.length; i++) {
					if(f[i].getName().equals(old.getBoard_file())) {
						f[i].delete();
					}
				}				
			}
			
		}else {	// 비번 불일치시
	
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();

			return null;			
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/BoardListAction.do?page="+page);
		
		return forward;
	}

}
