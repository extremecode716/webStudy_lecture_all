<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
 	Connection conn = null; 
	
	try {
  		Context init = new InitialContext();
  		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/orcl");
  		conn = ds.getConnection();
  		
  		out.println("<h3>����Ǿ����ϴ�.</h3>");
	}catch(Exception e){
		out.println("<h3>���ῡ �����Ͽ����ϴ�.</h3>");
		e.printStackTrace();
 	}
%>
