package oracle.java.s20180102.service;


import java.util.List;

import org.springframework.stereotype.Service;

import oracle.java.s20180102.model.AccountingDto;
import oracle.java.s20180102.model.GuideDto;
import oracle.java.s20180102.model.PagingDto;


@Service
public interface GuideService {

	int totalGuide();                          // 총 가이드 수
	List<GuideDto> g_list(PagingDto pDto);     // 가이드리스트(전체)
	GuideDto g_info(String memberId);          // 가이드 디테일 정보
	void upGuide(GuideDto gDto);               // 가이드 정보 수정
	GuideDto selOneGuide(int gNo);             //gNo로 가이드 정보 출력
	int upCostGuide(GuideDto gDto);            // 정산후 남은 정산 금액 조정 
	void inAccounting(AccountingDto acDto);    // 정산 기록
	List<AccountingDto> selAccounting(PagingDto pgDto); // 가이드 정산내역 출력(입금,출금)
	int selTotalAcc(int gno);                           // 가이드 정산내역 개수

	
	//지영------------------------------------------------------------------
	List<GuideDto> selPopularGuide();          // 인기 가이드 10명 가져오기
	void delGuide(GuideDto gDto);              // 가이드 탈퇴
	int kakaofs(String kakaoId);               // 카카오 id 중복 체크
	void g_join(GuideDto gDto);                // 가이드 등록
	void inCost(AccountingDto acDto);          // 입금 기록
	
	
	
	

	
}