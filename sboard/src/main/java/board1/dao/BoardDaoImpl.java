package board1.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import board1.model.Board;

@Repository
public class BoardDaoImpl implements BoardDao {
	@Autowired
	private SqlSessionTemplate sst;

	// public List<Board> list(int startRow, int endRow) {
	public List<Board> list(Board board) {
		/*
		 * HashMap<String, Integer> hm=new HashMap<String, Integer>();
		 * hm.put("startRow",startRow); 
		 * hm.put("endRow",endRow);
		 */
		return sst.selectList("boardns.list", board);
	}

	public int getTotal(Board board) {
		return sst.selectOne("boardns.getTotal", board);
	}

	public int insert(Board board) {
		return sst.insert("boardns.insert", board);
	}

	public Board select(int num) {
		return sst.selectOne("boardns.select", num);
	}

	public void selectUpdate(int num) {
		sst.update("boardns.selectUpdate", num);
	}

	public int update(Board board) {
		return sst.update("boardns.update", board);
	}

	public int delete(int num) {
		return sst.update("boardns.delete", num);
	}

	public int getMaxNum() {
		return sst.selectOne("boardns.getMaxNum");
	}

	public void updateRe(Board board) {
		sst.update("boardns.updateRe", board);
	}
}