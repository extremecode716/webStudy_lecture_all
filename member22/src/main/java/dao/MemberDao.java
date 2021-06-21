package dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Member;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemberDao {
	
	private SqlSession getSession() {
		SqlSession session=null;
		Reader reader=null;
		try {
			reader = Resources.getResourceAsReader("mybatis-config.xml"); //Mybatis 환경설정을 불러오면 db연결
			SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(reader); // SqlSession을 구하는 일련의 과정
			session = sf.openSession(true);	// true일시 DML수행시 auto commit
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		return session;
	}

	public int insert(Member member) {
		int result = 0;
		SqlSession session=null;
		try { 
			session = getSession(); 
			result = session.insert("insert", member); // member.xml의 id="insert" SQL을 불러와서 수행.
			// session.commit(); // openSesson(false); 일시 수동으로 commit;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public int chk(Member member) {
		int result = 0;
		SqlSession session=null;
		try { session = getSession(); 
			Member mem = (Member) session.selectOne("select", member.getId());
			if (mem.getId().equals(member.getId())) {
				result = -1;
				if (mem.getPassword().equals(member.getPassword())) {
					result = 1;
				}
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public Member select(String id) throws SQLException {
		Member mem = null;
		SqlSession session=null;
		try { session = getSession(); 
		mem = (Member) session.selectOne("select", id);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return mem;
	}

	public List<Member> list() {
		List<Member> list = new ArrayList<Member>();
		
		SqlSession session=null;
		try { session = getSession(); 
			list = session.selectList("list");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}

	public int delete(String id) {
		int result = 0;
		SqlSession session=null;
		try { session = getSession(); 
			result = session.delete("delete", id);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public int update(Member mem) {
		int result = 0;
		SqlSession session=null;
		try { session = getSession(); 
			result = session.update("update", mem);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
}
