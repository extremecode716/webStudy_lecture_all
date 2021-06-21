package oracle.java.s20180102.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service;

import oracle.java.s20180102.dao.MsgDao;
import oracle.java.s20180102.model.MsgDto;
import oracle.java.s20180102.model.PagingDto;

@Service
public class MsgServiceImpl implements MsgService{
	@Autowired
	private MsgDao msgDao;

	@Override
	public void inMsgResv(MsgDto msgDto) {
		msgDao.inMsgResv(msgDto);
		
	}
	@Override
	public int totalMsg(String id) {
		return msgDao.totalMsg(id);
	}
	@Override
	public List<MsgDto> selMsg(PagingDto pdto) {
		return msgDao.selMsg(pdto);
	}
	@Override
	public int totalMsgTalk(PagingDto pdto) {
		return msgDao.totalMsgTalk(pdto);
	}
	@Override
	public List<MsgDto> selMsgTalk(PagingDto pdto) {
		return msgDao.selMsgTalk(pdto);
	}
	@Override
	public void inMsgTalk(MsgDto msgDto) {
		msgDao.inMsgTalk(msgDto);
	}
	@Override
	public void upMsgCheck(PagingDto pdto) {
		msgDao.upMsgCheck(pdto);
	}
	@Override
	public int getNewMsgCnt(String iD) {
		return msgDao.getNewMsgCnt(iD);
	}
	

	
	
}