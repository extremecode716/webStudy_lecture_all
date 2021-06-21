package oracle.java.s20180102.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WebsockDao {

	@Autowired
	private SqlSession session;

	// 입장수 구하기
	public int getCount() {

		int result = session.selectOne("cnt");

		if (result == 0) {

			// session.insert("insert");
			result = 0;
		} else if (result == 1) {
			session.update("update");
			result = session.selectOne("cnt");
		} else {
			session.update("update");
			result = session.selectOne("cnt");

		}

		System.out.println("dao 접속인원수  = " + result);

		return result;
	}

	// 일반인 퇴장
	public int delCount() {

		int result = session.update("delcount");

		return result;
	}

	//
	public int adminchat() {
		int result = 0;
		session.update("admin_update"); // cnt=1로 초기화
		System.out.println("adminchat webDao 시작2 ");
		result = session.selectOne("cnt");
		return result; // 현재값 cnt 리턴
	}

	// 관리자 입장
	public int admin_connect() {
		int result = 0;
	//	session.insert("insert"); // cnt=1로 초기화
		session.update("admin_update"); // cnt=1로 초기화

		result = session.selectOne("cnt");
		return result; // 현재값 cnt 리턴
	}

	// 인원 초기화
	public int initCount() {
		int result = 0;
		session.update("init");

		result = session.selectOne("cnt");
		return result; // 현재cnt 리턴
	}

	public int chat_connect() {
		int result=0;
		session.update("update");
//		result=session.insert("update");
		
		return result;  //현재값은?
	}

}