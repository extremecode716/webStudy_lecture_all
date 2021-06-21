package oracle.java.s20180102.dao;

import java.util.List;

import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.model.TourCardDto;
import oracle.java.s20180102.model.WishDto;

public interface WishDao {
	List<TourCardDto> selWishList(PagingDto pdto); //한 회원의 위시리스트
	int totalWish(String iD);                      // 회원별 위시리스트 개수
	void delWishList(WishDto wdto);                // 위시리스트 삭제
	void inWishList(WishDto wDto);                 // 위시리스트 등록
	int wishCheck(WishDto wdto);				   // 상품별 위시리스트 체크여부
}