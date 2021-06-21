package oracle.java.s20180102.dao;

import java.util.List;

import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.model.QADto;

public interface QADao {
	//지영
	void inQA(QADto qad);                   // 문의 등록
	void upComplete(QADto qadto);           // 답변 완료 update
	QADto selOneQA(QADto qadto);            // 하나의 문의사항 가져오기
	


	//소희
	int selTotalQA(PagingDto pdto);
	List<QADto> selQAList(PagingDto pdto); //member
	List<QADto> selQAList_rpy(PagingDto pdto); //member_rpy
	List<QADto> selQAList2(PagingDto pdto); //guide
	List<QADto> selQAList2_rpy(PagingDto pdto); //guide_rpy
	void insertQA_guide(QADto qad); //guide-ajax 가이드페이지에서 문의에 대한 답변을 입력한다

	int selTotalQA_manager(PagingDto pdto); //manager QA의 total
	List<QADto> selQAList3(PagingDto pdto); //manager

	List<QADto> selQAList3_rpy(PagingDto pdto);
	void delQA_member(QADto qad);
	QADto selQAdetail(PagingDto pdto);
	void updateQaContent(QADto qadto);


	

	/*List<QADto> selQACkList(int qaNumber); //member_ajax_내용과 답변
*/
}