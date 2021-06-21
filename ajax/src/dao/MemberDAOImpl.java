package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//import model.MemberBean;
//import model.ZipcodeBean2;
//import util.SqlMapLocator;

public class MemberDAOImpl {//ibatis ����Ŭ ��� ���� Ŭ����
	
	Connection con=null;
	PreparedStatement pstmt=null;
	Statement stmt=null;
	ResultSet rs=null;
	DataSource ds=null;
	String sql=null; 
	
	/*public MemberDAOImpl(){
		try{
			Context initCtx=new InitialContext();
			Context envCtx=(Context)initCtx.lookup("java:comp/env");
			ds=(DataSource)envCtx.lookup("jdbc/orcl");
		}catch(Exception e){
			e.printStackTrace();
		}
     }*/

	/***** ���̵� �ߺ� üũ *****/
	public int checkMemberId(String id){
		int re=-1;	// ��� ������ ID
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
			
		sql="select join_code from join_member where join_id=?";
		try{
//		
//			con=ds.getConnection();
			
			Class.forName(driver);//JDBC Driver Loading
			con = DriverManager.getConnection(url, "scott", "716");
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			if(rs.next()){//중복 아이디
				re=1;	  // �ߺ� ID�� ���		
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(con != null) con.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return re;
	}
	/***** ���̵� �ߺ� üũ �� *****/

	/*���� �˻�*/
//	public List<ZipcodeBean2> findZipcode(String dong) throws SQLException{
//		List<ZipcodeBean2> list=SqlMapLocator.getMapper().queryForList(
//				"zipcodeList",dong);
		//������:���κ��� �Ѱ� �̻� ���ڵ带 �˻� �Ҷ� ����ϴ� ibatis �޼���:queryForList()
		//���� ���� �Ѱ� ���ڵ� �˻��Ҷ� ����ϴ� ibatis �޼���:queryForObject()
		//���ڵ� �����Ҷ� ����ϴ� ibatis�޼���:insert()
		//���ڵ� �����Ҷ� ����ϴ� ibatis�޼���:update()
		//���ڵ� �����Ҷ� ����ϴ� ibatis�޼���:delete()
//		return list;
//	}

	/* ��� �˻� */
//	public MemberBean findpwd(Map pm) throws SQLException{
//	     return (MemberBean)SqlMapLocator.getMapper().queryForObject(
//	    		 "pwd_find",pm);
//		}

	/*ȸ������*/
//	public void insertMember(MemberBean m) throws SQLException{
//	     SqlMapLocator.getMapper().insert("member_join",m);		
//	}

	/*�α��� ���� üũ */
//	public MemberBean userCheck(String id) throws SQLException{
//		return (MemberBean)SqlMapLocator.getMapper().queryForObject(
//				"login_check",id);
//	}
    /*ȸ������*/
//	public void updateMember(MemberBean member) throws SQLException{
//		SqlMapLocator.getMapper().update("member_edit",member);		
//	}
	/*ȸ������*/
//	public void deleteMember(MemberBean delm) throws SQLException{
//		SqlMapLocator.getMapper().update("member_delete",delm);		
//	}
}



