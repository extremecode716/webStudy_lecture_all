<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.sql.*"%>

<%
  request.setCharacterEncoding("euc-kr");

  String id= request.getParameter("id");
  String passwd= request.getParameter("passwd");
  String name= request.getParameter("name");
  Timestamp register=new Timestamp(System.currentTimeMillis());

  Connection conn=null;
  PreparedStatement pstmt=null;
  int result = 0;
  
  try{
	String jdbcUrl="jdbc:oracle:thin:@localhost:1521:xe";
    String dbId="scott";
    String dbPass="716";
	 
	// JDBC ���
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
	
	String sql= "insert into member1 values (?,?,?,sysdate)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,id);
    pstmt.setString(2,passwd);
	pstmt.setString(3,name);
//	pstmt.setTimestamp(4,register);
	result = pstmt.executeUpdate();  // 1 ����

	}catch(Exception e){ 
		e.printStackTrace();
	}finally{
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
%>

<html>
<head><title>���ڵ� ����(�߰�)����</title></head>
<body>
  
<%
	if(result == 1){
%>    
  		<script>
  			alert("ȸ������ ����");
  			location.href="selectTest.jsp";
  		</script>
<% 	}else{%>
   		<script>
			alert("ȸ������ ����");
			history.go(-1);
   		</script>
<% 	} %>   
</body>
</html>