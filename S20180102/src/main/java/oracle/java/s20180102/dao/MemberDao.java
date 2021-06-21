package oracle.java.s20180102.dao;


import java.util.List;
import java.util.Map;

import oracle.java.s20180102.model.MemberDto;
import oracle.java.s20180102.model.PagingDto;

public interface MemberDao {
	
	/* 지영 */
	void upPoint(MemberDto mbDto);              // 포인트 up!
	void upMember(MemberDto mbDto);             // 프로필 수정
	MemberDto selMember(String id);             // 한 회원 선택
	void delMember(String ID);                  // 회원 삭제
	List<MemberDto> selManager();               // 매니저 list

	/* 경희씨 */
	int totalMember();
	List<MemberDto> selMemberList(PagingDto pDto);
	int changePw(MemberDto memberDto);           // 비번변경
	int changePwConfirm(MemberDto memberDto);    // 비번변경확인
	int inMember(MemberDto memberDto);           // 회원가입
	String fs(String memberId);					 // findPswForm ,logInForm ID 비교체크
	String findpsw(String memberId);			 //
	int checkpsw(Map<String, Object> map);		 // 로그인폼에서 비번비교체크
	int selgNo(String memberId);                 // gno 가져오기
	List<MemberDto> searchMember(String search); // 아이디/닉네임으로 회원 찾기
	
	/* 태욱 */
	int inMemberKakao(MemberDto mbDto);
	
}