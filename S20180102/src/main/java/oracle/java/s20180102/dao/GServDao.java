package oracle.java.s20180102.dao;

import java.util.List;

import oracle.java.s20180102.model.CodeSetDto;
import oracle.java.s20180102.model.ContentsDto;
import oracle.java.s20180102.model.GServDto;
import oracle.java.s20180102.model.ReservDto;
import oracle.java.s20180102.model.TourCardDto;
import oracle.java.s20180102.vo.GServContentsVo;

public interface GServDao {
	
    //------- 태욱 -------------------------------------------------------------------------------

	List<GServDto> selGServ(GServDto gsDto);                  // 전체 상품 조회
	int total();
	int total(int gNo);
	GServDto oneGServ(int gServNo);
	List<ContentsDto> selCont(int gServNo);                  
	List<CodeSetDto> selCodeSet(String itemCode);
	int upGServ(GServContentsVo gsctVO);
	int inGServ(GServContentsVo gsctVO);
	int selGServNo(int gNo);
	int upLock(GServDto lock);
	List<GServDto> selGServRes(int gNo);    
	List<GServDto> selPayGuide(GServDto gsDto);
	int upMainView(GServDto gsDto);                           // 메인 뷰 update
	void delServ(int gservNo);                                // 상품 삭제
	int selPayGuideTotal(GServDto gsDto);
	
	//------- 지영 -------------------------------------------------------------------------------
	TourCardDto oneTourCard(ReservDto resvDto);               // 하나의 투어카드 선택
	List<TourCardDto> selRecommendGserv(String ID);                    // 관리자 추천 상품 가져오기
	

	//------- 소희 -------------------------------------------------------------------------------
	List<GServDto> selGServList(String id);

}