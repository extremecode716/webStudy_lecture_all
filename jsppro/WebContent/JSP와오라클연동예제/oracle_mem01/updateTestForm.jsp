<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.sql.*"%>

<%
  String uid=request.getParameter("id");

  Connection conn=null;
  PreparedStatement pstmt=null;
  ResultSet rs=null; 
  
  try{
	String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
    String dbId="scott";
    String dbPass="tiger";
	 
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
	
	String sql= "select * from member1 where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, uid);
	rs=pstmt.executeQuery();

	if(rs.next()){
	  String id= rs.getString("id");
      String passwd= rs.getString("passwd");
      String name= rs.getString("name");
      Timestamp register=rs.getTimestamp("reg_date");

%>
<html>
<head><title>���ڵ� ��������</title></head>

<body>
  <h2>member1 ���̺��� ���ڵ� ��������</h2>

  <FORM METHOD="post" ACTION="updateTest.jsp">
  <input type=hidden name="id" value="<%=id %>">
    ���̵� : <%=id %><p>
    �н����� : <INPUT TYPE="password" NAME="passwd"><p>
    ������ �̸�:<INPUT TYPE="text" NAME="name" value="<%=name%>"><p>
    <INPUT TYPE="submit" VALUE="������">
  </FORM>

</body>
</html>

<%  } // if end
  }catch(Exception e){ 
		e.printStackTrace();
  }finally{
	    if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
  }
%>




