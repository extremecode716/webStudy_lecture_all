package send;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myUtil.HanConv;

public class QueryString02 extends HttpServlet {
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    resp.setContentType("text/html;charset=euc-kr");
    PrintWriter out = resp.getWriter();
    String id="",name="", vclass="",
    phone1="", phone2="", phone3="";
    id=req.getParameter("id");
    name=req.getParameter("name");
    vclass=req.getParameter("class");
    phone1=req.getParameter("phone1");
    phone2=req.getParameter("phone2");
    phone3=req.getParameter("phone3");    
    out.println("<html><head></head><body>");
    out.println("당신이 입력한 정보입니다.<br> 아 이 디 : <b>");    
    out.println(id);
    out.println("</b><br> 이름 : <b>");  out.println(HanConv.toKor(name));  
    out.println("</b><br> 구분 : <b>");  out.println(HanConv.toKor(vclass));  
    out.println("</b><br> 전화번호 : <b>");  out.println(phone1); 
    out.println("-"); 	out.println(phone2); 
    out.println("-"); 	out.println(phone3);   
    out.println("</b><br><a href='javascript:history.go(-1)'>다시</a>");
    out.println("</body></html>");
    out.close();
  }
}
