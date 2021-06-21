// DAO(Data Access Object)

package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import model.BoardBean;

public class BoardDAO {

	// 싱글톤
	private static BoardDAO instance = new BoardDAO();
	
	public static BoardDAO getInstance() {
		return instance;
	}
	
	// 컨넥션풀에서 컨넥션을 구해오는 메소드
	private Connection getConnection() throws Exception{
		Context init = new InitialContext();
  		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/orcl");
  		return ds.getConnection();
	}
	
	// 글작성 : 원문작성
	public int insert(BoardBean board) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();

String sql="insert into model2 values(model2_seq.nextval,?,?,?,?,?,";	
       sql+="model2_seq.nextval,?,?,?,sysdate)";
       
       		pstmt = con.prepareStatement(sql);
       		pstmt.setString(1, board.getBoard_name());
       		pstmt.setString(2, board.getBoard_pass());
       		pstmt.setString(3, board.getBoard_subject());
       		pstmt.setString(4, board.getBoard_content());
       		pstmt.setString(5, board.getBoard_file());
       		pstmt.setInt(6, 0);		// board_re_lev
       		pstmt.setInt(7, 0);     // board_re_seq
       		pstmt.setInt(8, 0);     // board_readcount
       		result = pstmt.executeUpdate();		// SQL문 실행
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try { pstmt.close(); }catch(Exception e) {}
			if(con!=null) try { con.close(); }catch(Exception e) {}
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
			
			String sql="select count(*) from model2";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();	// SQL문 실행
			
			if(rs.next()) {
//				result = rs.getInt(1);
				result = rs.getInt("count(*)");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close(); }catch(Exception e) {}
			if(pstmt!=null) try { pstmt.close(); }catch(Exception e) {}
			if(con!=null) try { con.close(); }catch(Exception e) {}
		}
		
		return result;
	}
	
	
	// 글목록
	public List<BoardBean> getList(int start, int end){
		List<BoardBean> list = new ArrayList<BoardBean>();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();

String sql="select * from (select rownum rnum, board.*  from ";
	   sql+=" (select * from model2 order by board_re_ref desc,";
	   sql+=" board_re_seq asc) board ) ";
	   sql+=" where rnum>=? and rnum<=?";	
	   
	   		pstmt = con.prepareStatement(sql);
	   		pstmt.setInt(1, start);
	   		pstmt.setInt(2, end);
	   		rs = pstmt.executeQuery();	// SQL문 실행
	   		
	   		while(rs.next()) {
	   			BoardBean board = new BoardBean();
	   			board.setBoard_num(rs.getInt("board_num"));
	   			board.setBoard_name(rs.getString("board_name"));
	   			board.setBoard_pass(rs.getString("board_pass"));
	   			board.setBoard_subject(rs.getString("board_subject"));
	   			board.setBoard_content(rs.getString("board_content"));
	   			board.setBoard_file(rs.getString("board_file"));
	   			board.setBoard_re_ref(rs.getInt("board_re_ref"));
	   			board.setBoard_re_lev(rs.getInt("board_re_lev"));
	   			board.setBoard_re_seq(rs.getInt("board_re_seq"));
	   			board.setBoard_readcount(rs.getInt("board_readcount"));
	   			board.setBoard_date(rs.getTimestamp("board_date"));
	   			
	   			list.add(board);
	   		}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close(); }catch(Exception e) {}
			if(pstmt!=null) try { pstmt.close(); }catch(Exception e) {}
			if(con!=null) try { con.close(); }catch(Exception e) {}
		}
		
		return list;
	}
	
	
	// 조회수 증가
	public void readcountUpdate(int board_num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();
			
String sql="update model2 set board_readcount=board_readcount+1 ";
       sql+=" where board_num = ?";		

       		pstmt = con.prepareStatement(sql);
       		pstmt.setInt(1, board_num);
       		pstmt.executeUpdate();		// SQL문 실행
       
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try { pstmt.close(); }catch(Exception e) {}
			if(con!=null) try { con.close(); }catch(Exception e) {}
		}
		
	}
	
	
	// 상세 페이지
	public BoardBean getDetail(int board_num) {
		BoardBean board = new BoardBean();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = getConnection();
			
			String sql="select * from model2 where board_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();		// SQL문 실행
			
			if(rs.next()) {
				board.setBoard_num(rs.getInt("board_num"));
	   			board.setBoard_name(rs.getString("board_name"));
	   			board.setBoard_pass(rs.getString("board_pass"));
	   			board.setBoard_subject(rs.getString("board_subject"));
	   			board.setBoard_content(rs.getString("board_content"));
	   			board.setBoard_file(rs.getString("board_file"));
	   			board.setBoard_re_ref(rs.getInt("board_re_ref"));
	   			board.setBoard_re_lev(rs.getInt("board_re_lev"));
	   			board.setBoard_re_seq(rs.getInt("board_re_seq"));
	   			board.setBoard_readcount(rs.getInt("board_readcount"));
	   			board.setBoard_date(rs.getTimestamp("board_date"));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) try { rs.close(); }catch(Exception e) {}
			if(pstmt!=null) try { pstmt.close(); }catch(Exception e) {}
			if(con!=null) try { con.close(); }catch(Exception e) {}
		}
		
		return board;
	}
	
	
	// 댓글 작성
	public int boardReply(BoardBean board) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		// 부모글에 대한 정보 
		int re_ref = board.getBoard_re_ref();
		int re_lev = board.getBoard_re_lev();
		int re_seq = board.getBoard_re_seq();
		
		try {
			con = getConnection();
			
	String sql="update model2 set board_re_seq=board_re_seq+1 ";
		   sql+=" where board_re_ref=? and board_re_seq > ?";	
		   
		    pstmt = con.prepareStatement(sql);
		    pstmt.setInt(1, re_ref);
		    pstmt.setInt(2, re_seq);
		    pstmt.executeUpdate();
		    
   sql="insert into model2 values(model2_seq.nextval,?,?,?,?,?,";
   sql+="?,?,?,?,sysdate)";
   
   			pstmt = con.prepareStatement(sql);
   			pstmt.setString(1, board.getBoard_name());
   			pstmt.setString(2, board.getBoard_pass());
   			pstmt.setString(3, board.getBoard_subject());
   			pstmt.setString(4, board.getBoard_content());
   			pstmt.setString(5, "");
   			pstmt.setInt(6, re_ref);    	// board_re_ref
   			pstmt.setInt(7, re_lev+1);  	// board_re_lev
   			pstmt.setInt(8, re_seq+1);  	// board_re_seq
   			pstmt.setInt(9, 0);         	// board_readcount
   			result = pstmt.executeUpdate();	// SQL문 실행
   
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try { pstmt.close(); }catch(Exception e) {}
			if(con!=null) try { con.close(); }catch(Exception e) {}
		}
		
		return result;
	}
	
	
	// 글수정
	public int update(BoardBean board) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();
			
	String sql="update model2 set board_name=?, board_subject=?,";
	       sql+="board_content=? where board_num = ?";
	       
	       pstmt = con.prepareStatement(sql);
	       pstmt.setString(1, board.getBoard_name());
	       pstmt.setString(2, board.getBoard_subject());
	       pstmt.setString(3, board.getBoard_content());
	       pstmt.setInt(4, board.getBoard_num());
	       result = pstmt.executeUpdate();	// SQL문 실행
	
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try { pstmt.close(); }catch(Exception e) {}
			if(con!=null) try { con.close(); }catch(Exception e) {}
		}		
		
		return result;
	}
	
	
	// 글삭제
	public int delete(int board_num) {
		int result = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();
			
			String sql="delete from model2 where board_num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			result = pstmt.executeUpdate();		// SQL문 실행
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) try { pstmt.close(); }catch(Exception e) {}
			if(con!=null) try { con.close(); }catch(Exception e) {}
		}
		
		return result;
	}
	
}
