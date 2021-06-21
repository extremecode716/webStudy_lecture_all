package sample17;

import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("ms")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao md;

	public int insert(RegisterMember rm) {
		int result = 0;
		Member member = md.selectByEmail(rm.getEmail());
		if (member == null) {
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
			member.setPass(rm.getPass());
			member.setName(rm.getName());
			md.update(member);
			result = 1;
		} else {
			System.out.println("없는네 우찌 고치니 ? 헐");
		}
		return result;
	}
}