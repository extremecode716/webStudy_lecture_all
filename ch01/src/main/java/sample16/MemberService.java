package sample16;

import java.util.Collection;
import java.util.List;

public interface MemberService {
	int insert(RegisterMember rm);

	Member select(String string);

	Collection<Member> list();

	int delete(String string);

	int update(RegisterMember rm);
}