package oracle.java.s20180102.service;


import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import oracle.java.s20180102.model.MemberDto;
import oracle.java.s20180102.model.PagingDto;

@Service
public interface MemberService {

	MemberDto selMember(String id);                 // 한 회원 선택
	void upPoint(int upPoint, String memberId);     // 회원 포인트 up!
	void downPoint(int downPoint, String memberId); // 회원 포인트 down!
	void delMember(String ID);                      // 회원 삭제
	void upMember(MemberDto mbDto);                 // 프로필 수정
	List<MemberDto> selManager();                   // 매니저 list 선택
	List<MemberDto> searchMember(String search);    // 닉네임과 아이디로 회원찾기
 
	
	//int inMember(MemberDto memberDto);        // 회원가입
	//List<MemberDto> selMemberList();          // 회원조회
	//int delMember(String id);                 // 회원삭제


	
	// 경희씨 ---------------------------------------------------------//
	int totalMember();                             // 모든 회원 수 
	List<MemberDto> selMemberList(PagingDto pDto); // 회원 리스트
	int changePw(MemberDto memberDto);             //비번변경
	int changePwConfirm(MemberDto memberDto);      //비번변경확인

	void findpw2(String memberId);                 //임시비번 이멜발송
	int inMember(MemberDto mbDto);                 // 회원가입
	String fs(String memberId);					   //
	String findpsw(String memberId);			   //pswFindForm ,logInForm에서 ID 비교 체크
	int checkpsw(Map<String, Object> map);		   //로그인폼 비번 체크
	
	
	// 태욱 ------------------------------------------------------------
	int selgNo(String memberId);                   // gno 가져오기
	int inMemberKakao(MemberDto mbDto);            // 카카오로 회원가입

	
}