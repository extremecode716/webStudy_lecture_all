package oracle.java.s20180102.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;  // 
import org.springframework.stereotype.Repository;

import oracle.java.s20180102.model.PagingDto;
import oracle.java.s20180102.model.TourCardDto;
import oracle.java.s20180102.model.WishDto;

@Repository
public class WishDaoImpl implements WishDao{
	@Autowired
	private SqlSession session;

	@Override
	public List<TourCardDto> selWishList(PagingDto pdto) {
		return session.selectList("selWishList", pdto);
	}

	@Override
	public int totalWish(String iD) {
		return session.selectOne("totalWish", iD);
	}

	@Override
	public void delWishList(WishDto wdto) {
		session.delete("delWishList",wdto);
	}

	@Override
	public void inWishList(WishDto wDto) {
		session.insert("inWishList",wDto);
	}

	@Override
	public int wishCheck(WishDto wdto) {
		return session.selectOne("wishCheck", wdto);
	}

	

	
}