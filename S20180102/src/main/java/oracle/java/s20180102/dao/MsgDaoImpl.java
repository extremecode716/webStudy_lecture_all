package oracle.java.s20180102.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;  // 
import org.springframework.stereotype.Repository;
import oracle.java.s20180102.model.MsgDto;
import oracle.java.s20180102.model.PagingDto;

@Repository
public class MsgDaoImpl implements MsgDao{
	@Autowired
	private SqlSession session;

	@Override
	public void inMsgResv(MsgDto msgDto) {
		session.insert("inMsgResv", msgDto);
	}

	@Override
	public int totalMsg(String id) {
		return session.selectOne("totalMsg", id);
	}

	@Override
	public List<MsgDto> selMsg(PagingDto pdto) {
		return session.selectList("selMsg",pdto);
	}

	@Override
	public int totalMsgTalk(PagingDto pdto) {
		return session.selectOne("totalMsgTalk", pdto);
	}

	@Override
	public List<MsgDto> selMsgTalk(PagingDto pdto) {
		return session.selectList("selMsgTalk", pdto);
	}

	@Override
	public void inMsgTalk(MsgDto msgDto) {
		session.insert("inMsgTalk", msgDto);
	}

	@Override
	public void upMsgCheck(PagingDto pdto) {
		session.update("upMsgCheck", pdto);
	}

	@Override
	public int getNewMsgCnt(String iD) {
		return session.selectOne("getNewMsgCnt",iD);
	}



}