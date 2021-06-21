package oracle.java.s20180102.service;

import java.util.List;

import org.springframework.stereotype.Service;

import oracle.java.s20180102.model.MsgDto;
import oracle.java.s20180102.model.PagingDto;

@Service
public interface MsgService {

	//int inMsg(MsgDto msgDto);   // 보내기
	//int upMsg(MsgDto msgDto);   // 답변할 때, 받는 사람 답변여부 y로 update
	//int delMsg(MsgDto msgDto);  // 문의사항 삭제

	void inMsgResv(MsgDto msgDto);       // 예약관련 Msg 보내기
	int totalMsg(String id);             //회원이 보내거나 받은 메시지 total
	List<MsgDto> selMsg(PagingDto pdto); //회원이 보내거나 받은 메시지 List
	int totalMsgTalk(PagingDto pdto);
	List<MsgDto> selMsgTalk(PagingDto pdto);
	void inMsgTalk(MsgDto msgDto);      // 메시지 보내기
	void upMsgCheck(PagingDto pdto);    // check update하기
	int getNewMsgCnt(String iD);        // 새로온 메시지

	
}