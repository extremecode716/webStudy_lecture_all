package send;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class QueryDAO {

	private static QueryDAO instance = new QueryDAO();
	
	public static QueryDAO getInstance(){
		return instance;
	}
	
	public void insert(QueryDTO dto){
		Connection conn = null;
		PreparedStatement pstmt = null;
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String sql="";
		
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url,"totoro","totoro123");
			
			sql="insert into query values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getVclass());
			pstmt.setString(5, dto.getPhone());
			pstmt.executeUpdate();		
			
		}catch(Exception e){
			
		}finally{
			if(pstmt != null){
				try{
					pstmt.close();
				}catch(Exception e){					
				}
			}
			if(conn != null){
				try{
					conn.close();
				}catch(Exception e){					
				}
			}			
		}
		
	}
	
}
