package myBatis2.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import myBatis2.dao.EmpDao;
import myBatis2.model.Emp;

@Service
public class EmpServiceImpl implements EmpService {
	@Autowired
	private EmpDao ed;

	public List<Emp> list(int deptno) {
		return ed.list(deptno);
	}

	public List<Emp> empList() {
		return ed.empList();
	}

	public Emp select(int empno) {
		return ed.select(empno);
	}

	public int insert(Emp emp) {
		return ed.insert(emp);
	}

	public int delete(int empno) {
		return ed.delete(empno);
	}

	public int update(Emp emp) {
		return ed.update(emp);
	}

	public List<Emp> empAllList() {
		return ed.empAllList();
	}
}