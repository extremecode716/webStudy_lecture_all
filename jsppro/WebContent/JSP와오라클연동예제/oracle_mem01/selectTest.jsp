<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.sql.*"%>

<html>
<head><title>���̺��� ���ڵ带 ȭ�鿡 ǥ���ϴ� ����</title></head>
<body>
  <h2>member1 ���̺��� ���ڵ带 ȭ�鿡 ǥ���ϴ� ����</h2>
  
  <a href="insertTestForm.jsp">ȸ������</a>
  <TABLE width="550" border="1">
  <TR>
  	<TD width="100">���̵�</TD>
  	<TD width="100">�н�����</TD>
  	<TD width="100">�̸�</TD>
  	<TD width="250">��������</TD>
  	<TD width="100">����</TD>
  	<TD width="100">����</TD>
  </TR>

<%
  Connection conn=null;
  PreparedStatement pstmt=null;
  ResultSet rs=null;
  ResultSet rs01=null;
  int cnt=0;
  
  try{
	String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
    String dbId="scott";
    String dbPass="716";
	 
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );

	pstmt=conn.prepareStatement("select count(*) from member1");
	rs01=pstmt.executeQuery();
	if(rs01.next()){
		cnt = rs01.getInt(1);
//		cnt = rs01.getInt("count(*)");
	}	
	
	String sql= "select * from member1";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();

	while(rs.next()){
	  String id= rs.getString("id");
      String passwd= rs.getString("passwd");
      String name= rs.getString("name");
      Timestamp register=rs.getTimestamp("reg_date");

%>
     <TR>
  	   <TD width="100"><%=id%></TD>
  	   <TD width="100"><%=passwd%></TD>
  	   <TD width="100"><%=name%></TD>
  	   <TD width="250"><%=register.toString()%></TD>
  	   <TD width="100">
  	   		<a href="updateTestForm.jsp?id=<%=id%>">
  	  		 ����
  	   		</a>  	   
  	   </TD>
  	   <TD width="100">
  	   		<a href="deleteTestForm.jsp?id=<%=id %>">
  	   		 ����
  	   		</a>
  	   </TD>
    </TR>
<%  } 
  }catch(Exception e){ 
		e.printStackTrace();
  }finally{
	    if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
  }
%>
</TABLE>

�� ȸ����:<%=cnt %>��


</body>
</html>