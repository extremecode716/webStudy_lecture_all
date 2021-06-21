package oracle.java.s20180102.dao;

import java.util.List;

import oracle.java.s20180102.model.AccountingDto;
import oracle.java.s20180102.model.GuideDto;
import oracle.java.s20180102.model.PagingDto;

public interface GuideDao {

	int totalGuide();                          // 총 가이드 수
	List<GuideDto> g_list(PagingDto pDto);     // 가이드리스트(전체)
	GuideDto g_info(String memberId);          // 가이드 한명 정보
	void upGuide(GuideDto gDto);               // 가이드 정보 수정
	GuideDto selOneGuide(int gNo);             //gNo로 가이드 정보 출력
	int upCostGuide(GuideDto gDto);            // 정산후 남은 정산 금액 조정 
	void inAccounting(AccountingDto acDto);
	List<AccountingDto> selAccounting(PagingDto pgDto);
	int selTotalAcc(int gno);
	
	//지영------------------------------------------------------------------
	List<GuideDto> selPopularGuide();          // 인기 가이드 10명 가져오기
	void delGuide(GuideDto gDto);              // 가이드 탈퇴
	void inCost(AccountingDto acDto);          // 입금 기록

	
	//경희
	int kakaofs(String kakaoId);               // 카카오 아이디 중복체크
	void g_join(GuideDto gDto);                // 가이드 등록

	
}