package myBatis1.dao;

import java.util.List;
import myBatis1.model.Dept;

public interface DeptDao {
	List<Dept> list();

	Dept select(int deptno);

	int update(Dept dept);

	int delete(int deptno);

}