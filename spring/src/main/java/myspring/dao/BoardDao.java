package myspring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import myspring.model.Board;

@Repository
public class BoardDao {
	
	@Autowired
	private SqlSession session;
	
	public int insert(Board board) {
		return session.insert("insert", board);
	}

	public List<Board> getBoardList(){
		return session.selectList("list");
	}
	
	public void updatecount(int no) {
		session.update("hit", no);
	}
	
	public Board getBoard(int no) {
		return session.selectOne("content", no);
	}
}
