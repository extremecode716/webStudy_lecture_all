package oracle.java.s20180102.dao;

import java.util.List;

import oracle.java.s20180102.model.MsgDto;
import oracle.java.s20180102.model.PagingDto;

public interface MsgDao {


	void inMsgResv(MsgDto msgDto);        // 예약 확정/취소 메시지
	int totalMsg(String id);              //회원이 보내거나 받은 메시지 total
	List<MsgDto> selMsg(PagingDto pdto);  //회원이 보내거나 받은 메시지 List
	int totalMsgTalk(PagingDto pdto);
	List<MsgDto> selMsgTalk(PagingDto pdto);
	void inMsgTalk(MsgDto msgDto);        // 메시지 보내기
	void upMsgCheck(PagingDto pdto);      // 메시지 업데이트
	int getNewMsgCnt(String iD);          // 새로운 메시지
	
	
}