package oracle.java.s20180102.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;  // 
import org.springframework.stereotype.Service;

import oracle.java.s20180102.dao.ReviewDao;
import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.model.ReviewDto;


@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewDao revDao;

	@Override
	public void inReview(ReviewDto revDto) {
		revDao.inReview(revDto);
	}

	@Override
	public ReviewDto oneReview(ReviewDto revDto) {
		return revDao.oneReview(revDto);
	}

	@Override
	public void upReview(ReviewDto revDto) {
		revDao.upReview(revDto);
	}

	@Override
	public List<ReviewDto> oneReviewList(ReviewDto revDto) {
		return revDao.oneReviewList(revDto);
	}

	@Override
	public void inComment(ReviewDto revDto) {
		revDao.inComment(revDto);
	}

	@Override
	public void delReview(ReviewDto revDto) {
		revDao.delReview(revDto);
	}

	@Override
	public void delComment(ReviewDto revDto) {
		revDao.delComment(revDto);
	}

	@Override
	public int total_Complete(ReviewDto reviewDto) {
		return revDao.total_Complete(reviewDto);
	}

	/*@Override
	public List<ReviewDto> selReviewList(ReviewDto reviewDto) {
		return revDao.selReviewList(reviewDto);
	}*/

	@Override
	public int totalReview() {
		return revDao.totalReview();
	}

	@Override
	public List<ReviewDto> selReviewList(PagingDto pDto) {
		return revDao.selReviewList(pDto);
	}

	@Override
	public int totalRevsGno(int gno) {
		return revDao.totalRevsGno(gno);
	}

	@Override
	public List<ReviewDto> selgnoReviewList(PagingDto pDto) {
		return revDao.selgnoReviewList(pDto);
	}

	@Override
	public int totalGservNoRevs(int gservNo) {
		return revDao.totalGservNoRevs(gservNo);
	}

	@Override
	public List<ReviewDto> selGsevNoList(PagingDto pdto) {
		return revDao.selGsevNoList(pdto);
	}

	@Override
	public int total_CompleteM(String searchKey) {
		return revDao.total_CompleteM(searchKey);
	}

	@Override
	public List<ReviewDto> completeListM(String searchKey) {
		return revDao.completeListM(searchKey);
	}




	
}