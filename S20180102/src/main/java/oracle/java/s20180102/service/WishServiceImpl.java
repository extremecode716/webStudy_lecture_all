package oracle.java.s20180102.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;  // 
import org.springframework.stereotype.Service;

import oracle.java.s20180102.dao.WishDao;
import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.model.TourCardDto;
import oracle.java.s20180102.model.WishDto;

@Service
public class WishServiceImpl implements WishService{
	@Autowired
	private WishDao wDao;

	@Override
	public List<TourCardDto> selWishList(PagingDto pdto) {
		return wDao.selWishList(pdto);
	}

	@Override
	public int totalWish(String ID) {
		return wDao.totalWish(ID);
	}

	@Override
	public void delWishList(WishDto wdto) {
		wDao.delWishList(wdto);
	}

	@Override
	public void inWishList(WishDto wDto) {
		wDao.inWishList(wDto);
	}

	@Override
	public int wishCheck(WishDto wdto) {
		return wDao.wishCheck(wdto);
	}

	
}