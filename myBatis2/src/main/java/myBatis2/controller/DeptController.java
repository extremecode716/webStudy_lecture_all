package myBatis2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import myBatis2.model.Dept;
import myBatis2.service.DeptService;

@Controller
public class DeptController {
	@Autowired
	private DeptService ds;

	@RequestMapping("deptList.do")
	public String deptList(Model model) {
		List<Dept> list = ds.list();
		model.addAttribute("list", list);
		return "deptList";
	}

	@RequestMapping("deptInsertForm.do")
	public String deptInsertForm() {
		return "deptInsertForm";
	}

	@RequestMapping("deptInsert.do")
	public String deptInsert(@ModelAttribute Dept dept, 
			                 Model model) {
		Dept dt = ds.select(dept.getDeptno());
		if (dt == null) {
			int result = ds.insert(dept);
			model.addAttribute("result", result);
		} else {
			model.addAttribute("msg", "이미 있는 데이터입니다");
			model.addAttribute("result", -1);
		}
		return "deptInsert";
	}

	@RequestMapping("deptUpdateForm.do")
	public String deptUpdateForm(int deptno, Model model) {
		Dept dept = ds.select(deptno);
		model.addAttribute("dept", dept);
		return "deptUpdateForm";
	}

	@RequestMapping("deptUpdate.do")
	public String deptUpdate(Dept dept, Model model) {
		int result = ds.update(dept);
		model.addAttribute("result", result);
		return "deptUpdate";
	}

	@RequestMapping("deptDelete.do")
	public String deptDelete(int deptno, Model model) {
		int result = ds.delete(deptno);
		model.addAttribute("result", result);
		return "deptDelete";
	}
}