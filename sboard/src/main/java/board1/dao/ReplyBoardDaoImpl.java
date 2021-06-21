package board1.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import board1.model.ReplyBoard;

@Repository
public class ReplyBoardDaoImpl implements ReplyBoardDao {
	@Autowired
	private SqlSessionTemplate sst;

	public List<ReplyBoard> list(int bno) {
		return sst.selectList("rbns.list", bno);
	}

	public void insert(ReplyBoard rb) {
		sst.insert("rbns.insert", rb);
	}

	public void delete(int rno) {
		sst.delete("rbns.delete", rno);
	}

	public void update(ReplyBoard rb) {
		sst.update("rbns.update", rb);
	}
}