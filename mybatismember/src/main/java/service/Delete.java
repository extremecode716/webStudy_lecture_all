package service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import model.MemberDTO;

public class Delete implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Delete");
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		MemberDAO dao = MemberDAO.getInstance();
		MemberDTO old = dao.getMember(id);
		
		// 비번 비교
		if(old.getPasswd().equals(passwd)) {	// 비번 일치시
			int result = dao.delete(id);
			if(result == 1) System.out.println("회원삭제 성공");
			
			session.invalidate();               // 세션 삭제
			
		}else {									// 비번 불일치시
			out.println("<script>");	
			out.println("alert('비번이 일치하지 않습니다.');");	
			out.println("history.go(-1);");	
			out.println("</script>");	
			out.close();
			
			return null;			
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/LoginForm.do");
		
		return forward;
	}

}
