import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

@WebServlet(description = "처음작성하는 서블릿클래스", urlPatterns = { "/HelloWorld" })
public class HelloWorld extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException
    {
        response.setContentType("text/html;charset=euc-kr");
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Hello World!</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h1>안녕 하세요!!</h1>");
        out.println("</body>");
        out.println("</html>");
    }
}
