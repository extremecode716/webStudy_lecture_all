package oracle.java.s20180102.service;


import org.springframework.beans.factory.annotation.Autowired;  // 
import org.springframework.stereotype.Service;

import oracle.java.s20180102.dao.LikeItDao;
import oracle.java.s20180102.model.LikeItDto;

@Service
public class LikeItServiceImpl implements LikeItService{
	@Autowired
	private LikeItDao liDao;

	@Override
	public void inLikeIt(LikeItDto liDto) {
		liDao.inLikeIt(liDto);
	}

	@Override
	public void delLikeIt(LikeItDto liDto) {
		liDao.delLikeIt(liDto);
	}

}