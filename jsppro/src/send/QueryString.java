package send;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class QueryString
 */
@WebServlet(description = "값전달 연습", urlPatterns = { "/QueryString" })
public class QueryString extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setContentType("text/html;charset=utf-8");

		PrintWriter out = response.getWriter();
		String id = "", name = "", vclass = "", phone1 = "", phone2 = "", phone3 = "";
		id = request.getParameter("id");
		name = request.getParameter("name");
		vclass = request.getParameter("class");
		phone1 = request.getParameter("phone1");
		phone2 = request.getParameter("phone2");
		phone3 = request.getParameter("phone3");
		
		out.println("<html><head></head><body>");
		out.println("당신이 입력한 정보(get방식)입니다.<br> 아 이 디 : <b>");
		out.println(id);
		out.println("</b><br> 이름 : <b>");
		out.println(name);
		out.println("</b><br> 구분 : <b>");
		out.println(vclass);
		out.println("</b><br> 전화번호 : <b>");
		out.println(phone1);
		out.println("-");
		out.println(phone2);
		out.println("-");
		out.println(phone3);
		out.println("</b><br><a href='javascript:history.go(-1)'>다시</a>");
		out.println("</body></html>");
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.setContentType("text/html;charset=utf-8");

		request.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		String id = "", pw="", name = "", vclass = "", phone1 = "", phone2 = "", phone3 = "";
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		name = request.getParameter("name");
		vclass = request.getParameter("class");
		phone1 = request.getParameter("phone1");
		phone2 = request.getParameter("phone2");
		phone3 = request.getParameter("phone3");
		
		out.println("<html><head></head><body>");
		out.println("당신이 입력한 정보(post방식)입니다.<br> 아 이 디 : <b>");
		out.println(id);
		out.println("</b><br> 이름 : <b>");
		out.println(name);
		out.println("</b><br> 구분 : <b>");
		out.println(vclass);
		out.println("</b><br> 전화번호 : <b>");
		out.println(phone1);
		out.println("-");
		out.println(phone2);
		out.println("-");
		out.println(phone3);
		out.println("</b><br><a href='javascript:history.go(-1)'>다시</a>");
		out.println("</body></html>");
		
		QueryDTO member = new QueryDTO();
		member.setId(id);
		member.setPw(pw);
		member.setName(name);
		member.setVclass(vclass);
		member.setPhone(phone1+"-"+phone2+"-"+phone3);
		
		QueryDAO dao = QueryDAO.getInstance();
		int result = dao.insert(member);
		
		if(result == 1) {
			out.println("회원가입 성공");
		}
		
		out.close();
	}

}
