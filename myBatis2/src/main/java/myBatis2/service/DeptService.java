package myBatis2.service;

import java.util.List;
import myBatis2.model.Dept;

public interface DeptService {
	List<Dept> list();

	int insert(Dept dept);

	Dept select(int deptno);

	int update(Dept dept);

	int delete(int deptno);
}