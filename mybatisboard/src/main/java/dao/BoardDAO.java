package dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.BoardBean;

public class BoardDAO {

	private static BoardDAO instance = new BoardDAO();

	public static BoardDAO getInstance() {
		return instance;
	}
		
	public SqlSession getSession() {
		SqlSession session=null;
		Reader reader=null;			
		try {
			reader = Resources.getResourceAsReader("mybatis-config.xml");
			SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(reader);
			session = sf.openSession(true);	 // auto commit	
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return session;
	}
	
	
	//글작성(원문작성)
	public int insert(BoardBean board) throws Exception {
		int result=0;
		SqlSession session = getSession();
		result = session.insert("board_insert", board);		
		System.out.println("result:"+result);
		
		return result;
	}
	
	
	// 총데이터 갯수 구하기
	public int getCount() throws Exception{
		int result=0;
		SqlSession session=getSession();
		result = (Integer)session.selectOne("board_count");
		
		return result;
	}
	
	
	// 데이터 목록
	public List getList(int page) throws Exception {
//	public List getList(Map map) throws Exception {
		List list = new ArrayList();
		SqlSession session=getSession();
		list = session.selectList("board_list", page); 
		
		return list;
	}
	
	
	// 조회수 증가
	public void updateCount(int board_num) throws Exception{
		SqlSession session = getSession();
		session.update("board_updatecount", board_num);
	}
		
	
	// 댓글 출력 순서 (board_re_seq값 증가)
	public void updateSeq(BoardBean board) {
		SqlSession session = getSession();
		session.update("board_updateseq", board);
	}
		

	// 댓글작성
	public void boardReply(BoardBean board) {
		SqlSession session = getSession();
		session.insert("board_reply", board);
	}
	
	
	// 상세 페이지, 수정 폼
	public BoardBean getContent(int board_num) throws Exception {
		BoardBean board = new BoardBean();

		SqlSession session=getSession();
		board  = (BoardBean)session.selectOne("board_content", board_num);
		
		return board;
	}
	
	
	// 글수정
	public void update(BoardBean board) throws Exception {
		SqlSession session=getSession();
		session.update("board_update", board);
	}

	
	// 글삭제
	public void delete(int board_num) {
		SqlSession session=getSession();
		session.delete("board_delete", board_num);
	}

}




