package myBatis1.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import myBatis1.dao.DeptDao;
import myBatis1.model.Dept;

@Service
public class DeptServiceImpl implements DeptService {
	@Autowired
	private DeptDao dd;

	public List<Dept> list() {
		return dd.list();
	}

	public Dept select(int deptno) {
		return dd.select(deptno);
	}

	public int update(Dept dept) {
		return dd.update(dept);
	}

	public int delete(int deptno) {
		return dd.delete(deptno);
	}
}