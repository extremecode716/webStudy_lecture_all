package myBatis1.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.stereotype.Repository;

import myBatis1.model.Dept;

@Repository
public class DeptDaoImpl implements DeptDao {
	private static SqlSession session;
	static {
	    try { 
	    	Reader reader = Resources.getResourceAsReader("configuration.xml");
		      SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
		      session = ssf.openSession(true);
		      reader.close(); 
		} catch (IOException e) {
		  System.out.println("read file error : "+e.getMessage());
		}
	}
	public List<Dept> list() {
		return session.selectList("deptns.list");
	}
	public Dept select(int deptno) {
		return session.selectOne("deptns.select",deptno);
	}
	public int update(Dept dept) {
		return session.update("deptns.update",dept);
	}
	public int delete(int deptno) {
		return session.delete("deptns.delete",deptno);
	}
}