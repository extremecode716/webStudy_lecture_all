package sample16;

import java.util.*;

public class MemberDaoImpl implements MemberDao {
	private Map<String, Member> map = new HashMap<String, Member>();
	private static int nextId = 0;

	public void insert(Member member) {
		member.setId(++nextId);
		map.put(member.getEmail(), member);
	}

	public Member selectByEmail(String email) {
		return map.get(email);
	}

	public Collection<Member> list() {
		return (Collection<Member>) map.values();
	}

	public void delete(String email) {
		map.remove(email);
	}

	public void update(Member member) {
		map.put(member.getEmail(), member);
	}
}