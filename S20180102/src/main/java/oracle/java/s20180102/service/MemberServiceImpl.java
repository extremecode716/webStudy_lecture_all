package oracle.java.s20180102.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service;

import oracle.java.s20180102.dao.MemberDao;

import oracle.java.s20180102.model.MemberDto;
import oracle.java.s20180102.model.PagingDto;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao mbDao;

	@Override
	public MemberDto selMember(String id) {
		return mbDao.selMember(id);
	}

	@Override
	public int totalMember() {
		return mbDao.totalMember();
	}

	@Override
	public List<MemberDto> selMemberList(PagingDto pDto) {
		System.out.println("selMemberList -> svImp");
		return mbDao.selMemberList(pDto);
	}
	
	@Override
	public int changePw(MemberDto memberDto) {
		
		return mbDao.changePw(memberDto);
	}


	@Override
	public int changePwConfirm(MemberDto memberDto) {
		
		return mbDao.changePwConfirm(memberDto);
	}

	@Override
	public void upPoint(int upPoint, String memberId) {
		MemberDto mbDto = mbDao.selMember(memberId);
		int nowPoint = mbDto.getMpoint();
		mbDto.setMpoint(nowPoint+upPoint);
		mbDao.upPoint(mbDto);
	}

	@Override
	public void downPoint(int delPoint, String ID) {
		MemberDto mbDto = mbDao.selMember(ID);
		int nowPoint = mbDto.getMpoint();
		int newPoint = nowPoint-delPoint;
		// 차감액보다 보유 포인트가 작을 경우 
		if(newPoint < 0) {
			newPoint = 0;
		} 
		mbDto.setMpoint(newPoint);
		mbDao.upPoint(mbDto);  // point update 메서드 
	}

	@Override
	public void delMember(String ID) {
		mbDao.delMember(ID);
	}

	@Override
	public void upMember(MemberDto mbDto) {
		mbDao.upMember(mbDto);
	}
	

	@Override
	public void findpw2(String memberId) {

	}


	@Override
	public int inMember(MemberDto mbDto) {	
		return  mbDao.inMember(mbDto);
	}
	@Override
	public String fs(String memberId) {
		
		System.out.println("s.v-> "+memberId);
		return mbDao.fs(memberId);
	}

	@Override
	public String findpsw(String memberId) {
		
		return mbDao.findpsw(memberId);
	}

	@Override
	public int checkpsw(Map<String, Object> map) {
			return mbDao.checkpsw(map);
	}

	@Override
	public int selgNo(String memberId) {
		return mbDao.selgNo(memberId);
	}

	@Override
	public List<MemberDto> selManager() {
		return mbDao.selManager();
	}

	@Override
	public List<MemberDto> searchMember(String search) {
		return mbDao.searchMember(search);
	}

	@Override
	public int inMemberKakao(MemberDto mbDto) {
		return mbDao.inMemberKakao(mbDto);
	}
	
}