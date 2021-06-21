package oracle.java.s20180102.service;



import java.util.List;

import org.springframework.stereotype.Service;

import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.model.SearchDto;
import oracle.java.s20180102.model.TourCardDto;

@Service
public interface SearchService {

	String oneItemName(String itemCode);             // itemName 가져오기
	int total_filter(SearchDto sDto);                // 필터링 검색의 총 상품 개수
	List<TourCardDto> filterList(SearchDto sDto);    // 필터링 검색된 상품 리스트
 
	List<TourCardDto> keywordList(SearchDto sDto);   // 키워드 검색된 상품 리스트
	int total_keyword(SearchDto sDto);               // 키워드 검색의 총 상품 개수
	void inKeyWord(String keyword);                  // 검색어 누적
	List<TourCardDto> selGPage(PagingDto pDto);      // 보는사람(맴버ID)가 보는 가이드(gno)페이지 정보(TourCard)
	List<SearchDto> hotKeyword();                           // 인기검색어
	

	
	//int inSearch(String KeyWord);  // 검색어 누적
	//List<SearchDao> hotKeyWord();  // 인기검색어 리스트
}