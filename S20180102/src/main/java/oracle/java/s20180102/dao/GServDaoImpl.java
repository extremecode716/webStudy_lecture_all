package oracle.java.s20180102.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;  // 
import org.springframework.stereotype.Repository;

import oracle.java.s20180102.model.CodeSetDto;
import oracle.java.s20180102.model.ContentsDto;
import oracle.java.s20180102.model.GServDto;
import oracle.java.s20180102.model.ReservDto;
import oracle.java.s20180102.model.TourCardDto;
import oracle.java.s20180102.vo.GServContentsVo;

@Repository
public class GServDaoImpl implements GServDao{
	@Autowired
	private SqlSession session;

//------- 태욱 ----------------------------------------------------------------------------------------------
	
	@Override
	public int total() { return session.selectOne("totalGserv");	}
	
	@Override
	public int total(int gno) {	
		int gnolength = Integer.toString(gno).length();
		int result = 0;
		if(gnolength>6) {
			result = 1;
		}else {
			result =  session.selectOne("totalGnoServ", gno);
		}
			
		return result;	
	}

	@Override
	public List<ContentsDto> selCont(int gservNo) {
		// TODO Auto-generated method stub
		return session.selectList("listContents", gservNo);
	}
	
	@Override
	public List<CodeSetDto> selCodeSet(String itemCode) {
		// TODO Auto-generated method stub
		//int code = Integer.parseInt(itemCode);
		System.out.println("gservDaoImpl->selCodeSet : "+itemCode);
		return session.selectList("listCodeSet", itemCode);
	}

	@Override
	public int upLock(GServDto lock) {
		return session.update("uplock", lock);
	}
	@Override
	public List<GServDto> selPayGuide(GServDto gsDto) {
		// TODO Auto-generated method stub
		return session.selectList("gservPayList", gsDto);
	}
	
	@Override
	public List<GServDto> selGServ(GServDto gsDto) {
		return session.selectList("listAll", gsDto);
	}

	@Override
	public GServDto oneGServ(int gservNo) {
		return session.selectOne("oneGserv", gservNo);
	}

	@Override
	public int upGServ(GServContentsVo gsctVO) {
		int gservNo = gsctVO.getGservNo();
		session.delete("deleteContents", gservNo);
		
		for(int i = 0; i < gsctVO.getGservOrder().length; i++) {
			
			if(gsctVO.getGservIntro()[i]==null && gsctVO.getGservIntro()[i].length()>1) {
				continue;
			}
			ContentsDto ctDto = new ContentsDto();
			ctDto.setGservNo(gsctVO.getGservNo());
			ctDto.setGservIntro(gsctVO.getGservIntro()[i]);
			ctDto.setGservOrder(gsctVO.getGservOrder()[i]);
			ctDto.setImgSrc(gsctVO.getImgSrc()[i]);
			if(i!=0) {
				ctDto.setIntroTitle(gsctVO.getIntroTitle()[i-1]);
			}else {
				ctDto.setIntroTitle(null);
			}
			
			session.insert("insertContents", ctDto);
		}
		
		return session.update("updateGserv", gsctVO);
	}

	@Override
	public int inGServ(GServContentsVo gsctVO) {
		int result = 0;
		result = session.insert("inGserv", gsctVO);
		
		for(int i = 0; i < gsctVO.getGservOrder().length; i++) {
			if(gsctVO.getGservIntro()[i]==null && gsctVO.getGservIntro()[i].length()>1) {
				continue;
			}
			ContentsDto ctDto = new ContentsDto();
			ctDto.setGservNo(gsctVO.getGservNo());
			ctDto.setGservIntro(gsctVO.getGservIntro()[i]);
			ctDto.setGservOrder(gsctVO.getGservOrder()[i]);
			ctDto.setImgSrc(gsctVO.getImgSrc()[i]);
			if(i!=0) {
				ctDto.setIntroTitle(gsctVO.getIntroTitle()[i-1]);
			}else {
				ctDto.setIntroTitle(null);
			}
			session.insert("insertContents", ctDto);
		}
		
		return result;
	}

	@Override
	public int selGServNo(int gno) {
		int result = session.selectOne("selGservNo", gno);
		return result;
	}

	@Override
	public List<GServDto> selGServRes(int gno) {
		return session.selectList("gservResList", gno);
	}
	
	@Override
	public int upMainView(GServDto gsDto) {
		return session.update("upMainView", gsDto);
	}

	@Override
	public void delServ(int gservNo) {
		session.delete("deleteContents", gservNo);
		session.delete("delServ", gservNo);
	}
	
	@Override
	public int selPayGuideTotal(GServDto gsDto) {
		return session.selectOne("selTotalPayG", gsDto);
	}
	
//------- 지영 ------------------------------------------------------------------------------------------	
	
	@Override
	public TourCardDto oneTourCard(ReservDto resvDto) {
		return session.selectOne("oneTourCard", resvDto);
	}
	
	@Override
	public List<TourCardDto> selRecommendGserv(String ID) {
		return session.selectList("selRecommendGserv", ID);
	}
	
	
	
	
//------- 소희 ------------------------------------------------------------------------------------------	


	@Override
	public List<GServDto> selGServList(String id) {
		return session.selectList("selGservList",id);
	}

	




}