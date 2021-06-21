package myBatis2.dao;

import java.util.List;
import myBatis2.model.Dept;

public interface DeptDao {
	List<Dept> list();

	int insert(Dept dept);

	Dept select(int deptno);

	int update(Dept dept);

	int delete(int deptno);
}