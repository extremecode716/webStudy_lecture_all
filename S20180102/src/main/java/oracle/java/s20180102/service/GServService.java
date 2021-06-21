package oracle.java.s20180102.service;

import java.util.List;

import oracle.java.s20180102.model.CodeSetDto;
import oracle.java.s20180102.model.ContentsDto;
import oracle.java.s20180102.model.GServDto;
import oracle.java.s20180102.model.ReservDto;
import oracle.java.s20180102.model.TourCardDto;
import oracle.java.s20180102.vo.GServContentsVo;


public interface GServService {

// 태욱 ------------------------------------------------------------------------

	List<GServDto> selGServ(GServDto gsDto);                  // 전체 상품 조회
	int total();											  // 총 상품수
	int total(int gNo); 									  // 가이드별 상품수
	GServDto oneGServ(int gServNo);                        	  // 1개의 서비스 검색, 리턴;
	List<ContentsDto> selCont(int gServNo);
	List<CodeSetDto> selCodeSet(String itemCode);			  // 상분류지역에 따른 하부 지역 검색, 리턴
	int upGServ(GServContentsVo gsctVO);                      // 상품수정
	int inGServ(GServContentsVo gsctVO); 					  // 상품 등록
	int selGServNo(int gNo);             					  // 상품 등록페이지 진입을 위한 새로운 gServNo 번호 검색, 리턴
	int upLock(GServDto lock);
	List<GServDto> selPayGuide(GServDto gsDto);

	
	int upMainView(GServDto gsDto);                           // 메인뷰 업데이트
	void delServ(int gservNo);                                // 상품 삭제

	int selPayGuideTotal(GServDto gsDto);                     // 가이드 매출내역 수 구하기
	
	
	
	
// 지영------------------------------------------------------------------------

	TourCardDto oneTourCard(ReservDto resvDto);          // 하나의 투어카드 조회
	List<TourCardDto> selRecommendGserv(String ID);               // 관리자 추천 상품 가져오기

	
	
	//-----------------------------------------------------------------------------
	
//소히
	List<GServDto> selGServList(String Id);     // 선택 조회
	List<GServDto> selGServRes(int gNo);



}