package oracle.java.s20180102.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;  // 
import org.springframework.stereotype.Service;

import oracle.java.s20180102.dao.GServDao;
import oracle.java.s20180102.model.CodeSetDto;
import oracle.java.s20180102.model.ContentsDto;
import oracle.java.s20180102.model.GServDto;
import oracle.java.s20180102.model.ReservDto;
import oracle.java.s20180102.model.SearchDto;
import oracle.java.s20180102.model.TourCardDto;
import oracle.java.s20180102.vo.GServContentsVo;

@Service
public class GServServiceImpl implements GServService{
	
	@Autowired
	private GServDao gsDao;
	
	@Override
	public int total() {
		return gsDao.total();
	}
	@Override
	public int total(int gNo) {
		return gsDao.total(gNo);
	}
	@Override
	public List<GServDto> selGServ(GServDto gsDto) {
		return gsDao.selGServ(gsDto);
	}
	@Override
	public GServDto oneGServ(int gServNo) {
		return gsDao.oneGServ(gServNo);
	}
	@Override
	public List<ContentsDto> selCont(int gServNo) {
		return gsDao.selCont(gServNo);
	}

	@Override
	public TourCardDto oneTourCard(ReservDto resvDto) {
		return gsDao.oneTourCard(resvDto);
	}
	
	@Override
	public List<CodeSetDto> selCodeSet(String itemCode) {
		return gsDao.selCodeSet(itemCode);
	}
	@Override
	public int upGServ(GServContentsVo gsctVO) {
		return gsDao.upGServ(gsctVO);
	}
	@Override
	public int inGServ(GServContentsVo gsctVO) {
		return gsDao.inGServ(gsctVO);
	}
	@Override
	public int selGServNo(int gNo) {
		return gsDao.selGServNo(gNo);
	}
	@Override
	public int upLock(GServDto lock) {
		// TODO Auto-generated method stub
		return gsDao.upLock(lock);
	}
	@Override
	public List<GServDto> selGServList(String Id) {
		return gsDao.selGServList(Id);
	}
	@Override
	public List<GServDto> selGServRes(int gNo) {
		return gsDao.selGServRes(gNo);
	}
	@Override
	public List<GServDto> selPayGuide(GServDto gsDto) {
		return gsDao.selPayGuide(gsDto);
	}
	@Override
	public int upMainView(GServDto gsDto) {
		return gsDao.upMainView(gsDto);
	}
	@Override
	public void delServ(int gservNo) {
		gsDao.delServ(gservNo);
	}
	@Override
	public List<TourCardDto> selRecommendGserv(String ID) {
		return gsDao.selRecommendGserv(ID);
	}
	@Override
	public int selPayGuideTotal(GServDto gsDto) {
		return gsDao.selPayGuideTotal(gsDto);
	}
	
}