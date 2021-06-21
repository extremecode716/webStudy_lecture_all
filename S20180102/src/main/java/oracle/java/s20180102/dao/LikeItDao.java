package oracle.java.s20180102.dao;

import oracle.java.s20180102.model.LikeItDto;

public interface LikeItDao {

	void inLikeIt(LikeItDto liDto);  // 좋아요 in!
	void delLikeIt(LikeItDto liDto); // 좋아요 삭제!
	

	
}