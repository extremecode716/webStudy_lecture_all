package com.ch.hello;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PersonController {
	@RequestMapping("/addr")
	public String addr(@RequestParam("name") String name,
			@RequestParam("addr") String addr, Model model, HttpSession session) {
		model.addAttribute("name", name);
		model.addAttribute("addr", addr);
		return "addr";
	}

	@RequestMapping("/addr2")
	public String addr2(@ModelAttribute Person p, Model model) {
		model.addAttribute("person", p);
		return "addr2";
	}
}