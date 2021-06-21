package myBatis1.service;

import java.util.List;
import myBatis1.model.Dept;

public interface DeptService {
	List<Dept> list();

	Dept select(int deptno);

	int update(Dept dept);

	int delete(int deptno);

}