package oracle.java.s20180102.dao;

import java.util.List;

import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.model.ReviewDto;

public interface ReviewDao {

	int total_Complete(ReviewDto reviewDto);                // 투어 완료된 후기 수
	void inReview(ReviewDto revDto);                        // 후기 등록
	ReviewDto oneReview(ReviewDto revDto);                  // 하나의 후기 선택
	void upReview(ReviewDto revDto);                        // 후기 수정
	List<ReviewDto> oneReviewList(ReviewDto revDto);        // 하나의 후기에 달린 답변들
	void inComment(ReviewDto revDto);                       // 코멘트 등록
	void delReview(ReviewDto revDto);                       // 후기 삭제	
	void delComment(ReviewDto revDto);                      // 코멘트 삭제
	
	int totalReview();                                      // 모든 후기수
	List<ReviewDto> selReviewList(PagingDto pDto);          // 후기 리스트
	
	int totalRevsGno(int gno);                               // 가이드 별 총 후기수
	List<ReviewDto> selgnoReviewList(PagingDto pDto);        // 가이드 별 후기 리스트

	int totalGservNoRevs(int gservNo);                       // 하나의 상품에 달린 후기수
	List<ReviewDto> selGsevNoList(PagingDto pdto);           // 하나의 상품에 달린 후기 리스트
	
	int total_CompleteM(String searchKey);
	List<ReviewDto> completeListM(String searchKey);
	
}