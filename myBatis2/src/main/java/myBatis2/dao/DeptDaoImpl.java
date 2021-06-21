package myBatis2.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import myBatis2.model.Dept;

@Repository
public class DeptDaoImpl implements DeptDao {
	@Autowired
	private SqlSessionTemplate st;

	public List<Dept> list() {
		return st.selectList("deptns.list");
	}

	public int insert(Dept dept) {
		return st.insert("deptns.insert", dept);
	}

	public Dept select(int deptno) {
		return st.selectOne("deptns.select", deptno);
	}

	public int update(Dept dept) {
		return st.update("deptns.update", dept);
	}

	public int delete(int deptno) {
		return st.delete("deptns.delete", deptno);
	}
}