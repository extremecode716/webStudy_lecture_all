package myBatis2.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import myBatis2.model.Dept;
import myBatis2.model.Emp;
import myBatis2.service.DeptService;
import myBatis2.service.EmpService;

@Controller
public class EmpController {
	@Autowired
	private EmpService es;
	@Autowired
	private DeptService ds;

	@RequestMapping("empList.do")
	public String empList(int deptno, Model model) {
		Dept dept = ds.select(deptno);
		List<Emp> list = es.list(deptno);
		model.addAttribute("dept", dept);
		model.addAttribute("list", list);
		return "emp/empList";
	}

	@RequestMapping("empInsertForm.do")
	public String empInsertForm(Model model) {
		List<Dept> deptList = ds.list();
		List<Emp> empList = es.empList();
		model.addAttribute("deptList", deptList);
		model.addAttribute("empList", empList);
		return "emp/empInsertForm";
	}

	@RequestMapping("dupCheck.do")
	public String dupCheck(int empno, Model model) {
		System.out.println("empno:"+empno);
		Emp emp = es.select(empno);
		String msg = "";
		if (emp != null)
			msg = "이미 있는 데이터입니다";
		else
			msg = "사용 가능한 사번 입니다";
		model.addAttribute("msg", msg);
		return "emp/dupCheck";
	}

	@RequestMapping("empInsert.do")
//	public String empInsert(Emp emp, String hiredate1, Model model) {
	public String empInsert(Emp emp, Model model) {
//		emp.setHiredate(Date.valueOf(hiredate1)); // String -> Date 형변환
		int result = es.insert(emp);
		model.addAttribute("result", result);
		model.addAttribute("deptno", emp.getDeptno());
		return "emp/empInsert";
	}

	@RequestMapping("empView.do")
	public String empView(int empno, Model model) {
		Emp emp = es.select(empno);
		model.addAttribute("emp", emp);
		return "emp/empView";
	}

	@RequestMapping("empDelete.do")
	public String empDelete(int empno, Model model) {
		Emp emp = es.select(empno);
		int result = es.delete(empno);
		model.addAttribute("result", result);
		model.addAttribute("deptno", emp.getDeptno());
		return "emp/empDelete";
	}

	@RequestMapping("empUpdateForm.do")
	public String empUpdateForm(int empno, Model model) {
		Emp emp = es.select(empno);
		List<Dept> deptList = ds.list();
		model.addAttribute("emp", emp);
		model.addAttribute("deptList", deptList);
		return "emp/empUpdateForm";
	}

	@RequestMapping("empUpdate.do")
	public String empUpdate(Emp emp, Model model) {
		int result = es.update(emp);
		model.addAttribute("deptno", emp.getDeptno());
		model.addAttribute("result", result);
		return "emp/empUpdate";
	}

	@RequestMapping("empAllList.do")
	public String empAllList(Model model) {
		List<Emp> list = es.empAllList();
		model.addAttribute("list", list);
		return "emp/empAllList";
	}
}


