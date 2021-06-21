package send;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class multiPara
 */
@WebServlet(description = "값전달 연습", urlPatterns = { "/multiPara" })
public class multiPara extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String[] item;

		item = request.getParameterValues("item");
		out.println("선택된 항목이");
		
		try {
			for (int i = 0; i < item.length; i++)
				out.println(" : " + item[i]);
//				out.println(" : " + HanConv.toKor(item[i]));
			out.println("입니다.");
		} catch (Exception e) {
			out.println(" 없습니다.");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		
		request.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		String[] item;

		item = request.getParameterValues("item");
		out.println("선택된 항목이");
		
		try {
			for (int i = 0; i < item.length; i++)
				out.println(" : " + item[i]);
//				out.println(" : " + HanConv.toKor(item[i]));
			out.println("입니다.");
		} catch (Exception e) {
			out.println(" 없습니다.");
		}
	}

}
