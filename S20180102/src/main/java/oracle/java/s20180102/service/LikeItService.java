package oracle.java.s20180102.service;

import org.springframework.stereotype.Service;

import oracle.java.s20180102.model.LikeItDto;

@Service
public interface LikeItService {

	void inLikeIt(LikeItDto liDto);  // 좋아요 in!
	void delLikeIt(LikeItDto liDto); // 좋아요 삭제
	

	
}