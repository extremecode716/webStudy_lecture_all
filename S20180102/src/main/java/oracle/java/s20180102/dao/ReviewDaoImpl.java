package oracle.java.s20180102.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.model.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public void inReview(ReviewDto revDto) {
		session.insert("inReview",revDto);
	}

	@Override
	public ReviewDto oneReview(ReviewDto revDto) {
		return session.selectOne("oneReview",revDto);
	}

	@Override
	public void upReview(ReviewDto revDto) {
		session.update("upReview", revDto);
	}

	@Override
	public List<ReviewDto> oneReviewList(ReviewDto revDto) {
		System.out.println();
		return session.selectList("oneReviewList", revDto);
	}

	@Override
	public void inComment(ReviewDto revDto) {
		session.insert("inComment", revDto);
	}

	@Override
	public void delReview(ReviewDto revDto) {
		session.delete("delReview", revDto);
	}

	@Override
	public void delComment(ReviewDto revDto) {
		session.delete("delComment", revDto);
	}

	@Override
	public int total_Complete(ReviewDto reviewDto) {
		return session.selectOne("totalRevs",reviewDto);

	}

	@Override
	public int totalReview() {
		return session.selectOne("totalReview");
	}

	@Override
	public List<ReviewDto> selReviewList(PagingDto pDto) {
		return session.selectList("selReviewList", pDto);
	}

	@Override
	public int totalRevsGno(int gno) {
		return session.selectOne("totalRevsGno", gno);
	}

	@Override
	public List<ReviewDto> selgnoReviewList(PagingDto pDto) {
		return session.selectList("selgnoReviewList", pDto);
	}

	@Override
	public int totalGservNoRevs(int gservNo) {
		return session.selectOne("totalGservNoRevs", gservNo);
	}

	@Override
	public List<ReviewDto> selGsevNoList(PagingDto pdto) {
		
		return session.selectList("selGsevNoList", pdto);
	}

	@Override
	public int total_CompleteM(String searchKey) {
		return session.selectOne("total_CompleteM", searchKey);
	}

	@Override
	public List<ReviewDto> completeListM(String searchKey) {
		return session.selectList("completeListM", searchKey);

	}

	

}
