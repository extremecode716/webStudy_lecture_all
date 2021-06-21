// DAO(Data Access Object)

package upload;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDBBean {
	
	// 싱글톤
	private static BoardDBBean instance = new BoardDBBean();
	
	public static BoardDBBean getInstance() {
		return instance;
	}
	
	// 컨넥션풀에서 컨넥션을 구해오는 메소드
	private Connection getConnection() throws Exception{
		Context init = new InitialContext();
  		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/orcl");
  		return ds.getConnection();
	}
	
	// 글작성
	public int insert(BoardDataBean board) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();
			
String sql="insert into upload values(upload_seq.nextval,?,?,?,?,";			
	   sql+="sysdate,?,?,?,?)";
	   
	   		pstmt = con.prepareStatement(sql);
	   		pstmt.setString(1, board.getWriter());
	   		pstmt.setString(2, board.getEmail());
	   		pstmt.setString(3, board.getSubject());
	   		pstmt.setString(4, board.getPasswd());
	   		pstmt.setInt(5, 0);
	   		pstmt.setString(6, board.getContent());
	   		pstmt.setString(7, board.getIp());
	   		pstmt.setString(8, board.getUpload());
	   		
	   		result = pstmt.executeUpdate();	// SQL문 실행

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try { pstmt.close();}catch(Exception e) {}
			if(con!=null) try { con.close();}catch(Exception e) {}
		}
		
		return result;
	}
	
	// 총 데이터 갯수 구하기
	public int getCount() {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			
			String sql="select count(*) from upload";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();	// SQL문 실행
			if(rs.next()) {
//				result = rs.getInt(1);
				result = rs.getInt("count(*)");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();}catch(Exception e) {}
			if(pstmt!=null) try { pstmt.close();}catch(Exception e) {}
			if(con!=null) try { con.close();}catch(Exception e) {}
		}
		
		return result;
	}
	
	// 게시판 목록 : 데이터 10개 추출
	public List<BoardDataBean> getList(int start, int end){
		List<BoardDataBean> list = new ArrayList<BoardDataBean>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			
String sql="select * from (select rownum rnum, upload.* from ";
       sql+=" (select * from upload order by num desc) upload ) ";
       sql+=" where rnum >= ? and rnum <= ?";
			
       		pstmt = con.prepareStatement(sql);
       		pstmt.setInt(1, start);
       		pstmt.setInt(2, end);
       		rs = pstmt.executeQuery();		// SQL문 실행
       		
       		while(rs.next()) {
       			BoardDataBean board = new BoardDataBean();
       			board.setNum(rs.getInt("num"));
       			board.setWriter(rs.getString("writer"));
       			board.setEmail(rs.getString("email"));
       			board.setSubject(rs.getString("subject"));
       			board.setPasswd(rs.getString("passwd"));
       			board.setReg_date(rs.getTimestamp("reg_date"));
       			board.setReadcount(rs.getInt("readcount"));
       			board.setContent(rs.getString("content"));
       			board.setIp(rs.getString("ip"));
       			board.setUpload(rs.getString("upload"));
       			
       			list.add(board);
       		}
       
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();}catch(Exception e) {}
			if(pstmt!=null) try { pstmt.close();}catch(Exception e) {}
			if(con!=null) try { con.close();}catch(Exception e) {}
		}		
		
		return list;	
	}
	
	// 상세 페이지 : 조회수 1증가 + 상세정보 구하기
	public BoardDataBean updateContent(int num) {
		BoardDataBean board = new BoardDataBean();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();

String sql="update upload set readcount=readcount+1 where num=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();		// SQL문 실행
			
			sql = "select * from upload where num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();	// SQL문 실행
			if(rs.next()) {
				board.setNum(rs.getInt("num"));
       			board.setWriter(rs.getString("writer"));
       			board.setEmail(rs.getString("email"));
       			board.setSubject(rs.getString("subject"));
       			board.setPasswd(rs.getString("passwd"));
       			board.setReg_date(rs.getTimestamp("reg_date"));
       			board.setReadcount(rs.getInt("readcount"));
       			board.setContent(rs.getString("content"));
       			board.setIp(rs.getString("ip"));
       			board.setUpload(rs.getString("upload"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();}catch(Exception e) {}
			if(pstmt!=null) try { pstmt.close();}catch(Exception e) {}
			if(con!=null) try { con.close();}catch(Exception e) {}
		}
		
		return board;
	}
	
	// 수정폼 : 상세 정보 구하기
	public BoardDataBean getContent(int num) {
		BoardDataBean board = new BoardDataBean();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();

			String sql = "select * from upload where num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();	// SQL문 실행
			if(rs.next()) {
				board.setNum(rs.getInt("num"));
       			board.setWriter(rs.getString("writer"));
       			board.setEmail(rs.getString("email"));
       			board.setSubject(rs.getString("subject"));
       			board.setPasswd(rs.getString("passwd"));
       			board.setReg_date(rs.getTimestamp("reg_date"));
       			board.setReadcount(rs.getInt("readcount"));
       			board.setContent(rs.getString("content"));
       			board.setIp(rs.getString("ip"));
       			board.setUpload(rs.getString("upload"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close();}catch(Exception e) {}
			if(pstmt!=null) try { pstmt.close();}catch(Exception e) {}
			if(con!=null) try { con.close();}catch(Exception e) {}
		}
		
		return board;
	}
	
	// 글수정
	public int update(BoardDataBean board) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();

String sql="update upload set writer=?,email=?,subject=?,";
	   sql+="content=?,ip=?,upload=? where num=?";
	   
	   		pstmt = con.prepareStatement(sql);
	   		pstmt.setString(1, board.getWriter());
	   		pstmt.setString(2, board.getEmail());
	   		pstmt.setString(3, board.getSubject());
	   		pstmt.setString(4, board.getContent());
	   		pstmt.setString(5, board.getIp());
	   		pstmt.setString(6, board.getUpload());
	   		pstmt.setInt(7, board.getNum());
			
	   		result = pstmt.executeUpdate();	// SQL문 실행
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try { pstmt.close();}catch(Exception e) {}
			if(con!=null) try { con.close();}catch(Exception e) {}
		}
		
		return result;
	}
	
	// 글삭제 + 첨부파일 삭제
	public int delete(BoardDataBean upload, String path) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();
			
			String sql = "delete from upload where num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, upload.getNum());
			result = pstmt.executeUpdate();		// SQL문 실행
			
			if(upload.getUpload() != "") {
				
				// 첨부파일 삭제
				File file = new File(path);
				
				// upload 디렉토리의 모든 파일을 읽어온다.
				File[] f = file.listFiles();
				
				for(int i=0; i<f.length; i++) {
					
					//upload 디렉토리에 저장된 파일 중에서 db에 저장된 파일을 삭제한다.
					if(f[i].getName().equals(upload.getUpload())) {
						f[i].delete();	// 첨부파일 삭제
					}
				}			
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try { pstmt.close();}catch(Exception e) {}
			if(con!=null) try { con.close();}catch(Exception e) {}
		}		
		
		return result;
	}
	
	
}
