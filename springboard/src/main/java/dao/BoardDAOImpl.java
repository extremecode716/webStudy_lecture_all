package dao;

import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import model.BoardBean;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDao{

	@Autowired
	private SqlSession sqlSession;

	
	/* 게시판 저장 */
	public void insertBoard(BoardBean b) throws Exception {
		sqlSession.insert("Test.board_insert", b);
	}

	
	/* 게시물 목록  */
	public List<BoardBean> getBoardList(int page) throws Exception {
		List<BoardBean> list = sqlSession.selectList("Test.board_list", page);

		return list;
	}

	
	/* 게시판 총 갯수  */
	public int getListCount() throws Exception {
		int count = 0;	
		count = ((Integer) sqlSession.selectOne("Test.board_count")).intValue();

		return count;
	}

	
	/* 게시판 글내용보기  */
	public BoardBean getBoardCont(int board_num) throws Exception {
		return (BoardBean) sqlSession.selectOne("Test.board_cont",board_num);
	}

	
	/* 게시판 조회수 증가  */
	public void boardHit(int board_num) throws Exception {
		sqlSession.update("Test.board_hit", board_num);		
	}

	
	/* 게시물 수정  */
	public void boardEdit(BoardBean b) throws Exception {
		sqlSession.update("Test.board_edit", b);		
	}

	
	/* 게시물 삭제  */
	public void boardDelete(int board_num) throws Exception {
		sqlSession.delete("Test.board_del", board_num);				
	}

	
	/* 답변글 레벨 증가  */
	public void refEdit(BoardBean b) throws Exception {
		sqlSession.update("Test.board_Level", b);		
	}

	
	/* 답변글 저장  */
	public void boardReplyOk(BoardBean b) throws Exception {
		sqlSession.insert("Test.board_reply", b);		
	}

}
