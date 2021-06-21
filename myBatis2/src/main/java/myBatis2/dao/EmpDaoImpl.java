package myBatis2.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import myBatis2.model.Emp;

@Repository
public class EmpDaoImpl implements EmpDao {
	@Autowired
	private SqlSessionTemplate sst;

	public List<Emp> list(int deptno) {
		return sst.selectList("empns.list", deptno);
	}

	public List<Emp> empList() {
		return sst.selectList("empns.empList");
	}

	public Emp select(int empno) {
		return sst.selectOne("empns.select", empno);
	}

	public int insert(Emp emp) {
		return sst.insert("empns.insert", emp);
	}

	public int delete(int empno) {
		return sst.delete("empns.delete", empno);
	}

	public int update(Emp emp) {
		return sst.update("empns.update", emp);
	}

	public List<Emp> empAllList() {
		return sst.selectList("empAllList");
	}
}






