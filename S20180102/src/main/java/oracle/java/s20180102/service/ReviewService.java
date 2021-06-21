package oracle.java.s20180102.service;

import java.util.List;

import org.springframework.stereotype.Service;

import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.model.ReviewDto;
@Service
public interface ReviewService {

	void inReview(ReviewDto revDto);                         // 후기 등록
	void upReview(ReviewDto revDto);                         // 후기 수정
	ReviewDto oneReview(ReviewDto revDto);                   // 하나의 후기
	List<ReviewDto> oneReviewList(ReviewDto revDto);         // 하나의 후기에 달린 답변들
	void inComment(ReviewDto revDto);                        // 코멘트 등록
	void delReview(ReviewDto revDto);                        // 후기 삭제
	void delComment(ReviewDto revDto);                       // 코멘트 삭제
	
	
	int totalReview();                                       // 모든 후기 수 (rStep=0)
	List<ReviewDto> selReviewList(PagingDto pDto);           // 모든 후기 리스트
	
	
	int total_Complete(ReviewDto reviewDto);                
	//List<ReviewDto> selReviewList(ReviewDto reviewDto);    // 후기리스트 
	
	
	int totalRevsGno(int gno);                               // 가이드 별 총 후기수
	List<ReviewDto> selgnoReviewList(PagingDto pDto);        // 가이드 별 후기 리스트

	int totalGservNoRevs(int gservNo);                       // 하나의 상품에 달린 후기수
	List<ReviewDto> selGsevNoList(PagingDto pdto);           // 하나의 상품에 달린 후기 리스트
	int total_CompleteM(String searchKey);
	List<ReviewDto> completeListM(String searchKey);
	
}