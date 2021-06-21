// DAO(Data Access Object)

package dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.MemberDTO;

public class MemberDAO {
	
	private static MemberDAO instance = new MemberDAO();
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	public SqlSession getSession() {
		SqlSession session=null;
		Reader reader=null;			
		try {
			reader = Resources.getResourceAsReader("mybatis-config.xml");
			SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(reader);
			session = sf.openSession(true);	 // auto commit	
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return session;
	}
		
		
	// 회원가입
	public int insert(MemberDTO member) throws Exception{
		int result=0;
		SqlSession session = getSession();
		result = session.insert("insert", member);		
		System.out.println("result:"+result);
		
		return result;
	}
	
	// ID중복검사
	public int idcheck(String id) throws Exception{
		int result = 0;
		SqlSession session = getSession();
		MemberDTO member = session.selectOne("idcheck", id);
		if(member != null) {	// 중복 ID	
			result = 1;			
		}else {					// 사용가능한 ID
			result = -1;
		}
		
		return result;
	}
	
	// 로그인(회원인증)
	public int memberAuth(String id, String passwd) throws Exception {
		int result = 0;
		SqlSession session = getSession();
		MemberDTO member = session.selectOne("idcheck", id);
		if(member != null) {		// 중복 ID	
			if(member.getPasswd().equals(passwd)) {
				result = 1;			// 회원인증 성공
			}else {
				result = -1;		// 회원인증 실패
			}
		}

		return result;
	}

	
	// 회원 1명 정보 구하기 : 수정폼, 수정, 삭제
	public MemberDTO getMember(String id) throws Exception{
		SqlSession session = getSession();
		MemberDTO member = session.selectOne("idcheck", id);
		
		return member;
	}
	
	
	// 회원정보 수정
	public int update(MemberDTO member) throws Exception{
		int result = 0;
		SqlSession session = getSession();
		result = session.update("update", member);

		return result;
	}

	// 회원 탈퇴
	public int delete(String id) throws Exception{
		int result = 0;
		SqlSession session = getSession();
		result = session.delete("delete", id);		
		
		return result;
	}	

}