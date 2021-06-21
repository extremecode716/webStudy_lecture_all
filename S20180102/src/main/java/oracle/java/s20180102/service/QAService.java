package oracle.java.s20180102.service;

import java.util.List;

import org.springframework.stereotype.Service;

import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.model.QADto;
@Service
public interface QAService {
	//List<QADto> QAList(String ID, String gServNo); // 받은 문의. 보낸 문의 조회 
	//List<QADto> QAList(String complete);           // 답변여부 필터링..(?)
	//int inQA(QADto qaDto);                         // 문의 등록
	//int upQA(QADto qaDto);                         // 문의 수정
	//int delQA(int QAnumber);                       // 문의 삭제
	
	//소희: 여기서부터 시작
	int selTotalQA(PagingDto pdto); //회원
	/*기본으로 충족: ID
	 *필터링 적용: 답변 여부, 날짜
	 * String ID, String reply_yn, String write_period*/
	List<QADto> selQAList(PagingDto pdto);      //회원 
	List<QADto> selQAList_rpy(PagingDto pdto);  //회원_답변
	List<QADto> selQAList2(PagingDto pdto);     //가이드
	List<QADto> selQAList2_rpy(PagingDto pdto); //가이드_답변
	
	void insertQA_guide(QADto qad);             // 가이드_ajax , 답변 입력하기
	int selTotalQA_manager(PagingDto pdto);		// 매니저 QA total
	List<QADto> selQAList3(PagingDto pdto);		// 매니저 
	
	
	void inQA(QADto qad);                       // 문의 등록 
	
	
	void updateQaContent(QADto qadto);
	void delQA_member(QADto qadto);
	QADto selQAdetail(PagingDto pdto);
	List<QADto> selQAList3_rpy(PagingDto pdto);
	
	
	void upComplete(QADto qadto);               // 답변 완료여부 변경
	QADto selOneQA(QADto qadto);                // 하나의 QA가져오기
	 
	
	
	/*List<QADto> selQACkList(int qaNumber); //회원_ajax -- 안쓸듯*/	
}