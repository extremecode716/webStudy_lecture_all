<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="java.sql.*"%>

<%
Connection con = null;

try {

	/***************** My-SQL ���� �����ϴ� �κ� *****************************/
	//    String driver = "com.mysql.jdbc.Driver";

	//    String jdbcUrl = "jdbc:mysql://localhost:3306/academy";
	//    String dbId = "totoro";
	//    String dbPass = "1234";	
	/************************************************************************/

	/**************** Oracle ���� �����ϴ� �κ� *****************************/
	String driver = "oracle.jdbc.driver.OracleDriver";

	String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
	String dbId = "scott";
	String dbPass = "716";
	/************************************************************************/

	Class.forName(driver);
	con = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

	out.println("����� ����Ǿ����ϴ�.");

} catch (Exception e) {

	e.printStackTrace();

}
%>
