package sample16;

import java.util.Collection;
import java.util.Date;
import java.util.List;

public class MemberServiceImpl implements MemberService {
	private MemberDao md;

	public void setMd(MemberDao md) {
		this.md = md;
	}

	public int insert(RegisterMember rm) {
		int result = 0;
		Member member = md.selectByEmail(rm.getEmail()); //email주소로 1명의 정보를 구해옴
		if (member == null) {	// 동일한 email 주소가 없으면 회원가입함
			member = new Member(rm.getPass(), rm.getEmail(), rm.getName(), new Date());
			md.insert(member);
			result = 1;
		} else {
			System.out.println("이미 데이터가 있습니다");
		}
		return result;
	}

	public Member select(String email) {
		return md.selectByEmail(email);
	}

	public Collection<Member> list() {
		return md.list();
	}

	public int delete(String email) {
		int result = 0; // 데이터가 이미 있는지 확인
		Member member = md.selectByEmail(email);
		if (member != null) {
			md.delete(email);
			result = 1;
		} else {
			System.out.println("없는네 우찌 삭제하니");
		}
		return result;
	}

	public int update(RegisterMember rm) {
		int result = 0; // 데이터가 이미 있는지 확인
		Member member = md.selectByEmail(rm.getEmail());
		if (member != null) {
			member.setPass(rm.getPass());  // 비번과 이름 수정
			member.setName(rm.getName());
			md.update(member);
			result = 1;
		} else {
			System.out.println("없는네 우찌 고치니 ? 헐");
		}
		return result;
	}
}