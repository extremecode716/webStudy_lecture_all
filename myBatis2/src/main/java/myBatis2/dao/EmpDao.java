package myBatis2.dao;

import java.util.List;
import myBatis2.model.Emp;

public interface EmpDao {
	List<Emp> list(int deptno);

	List<Emp> empList();

	Emp select(int empno);

	int insert(Emp emp);

	int delete(int empno);

	int update(Emp emp);

	List<Emp> empAllList();
}