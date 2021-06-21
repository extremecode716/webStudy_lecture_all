package com.example.demo.controller;

import java.io.IOException;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SampleController {
	@RequestMapping("/")
	@ResponseBody
	public void hello(HttpServletResponse response) throws IOException{
		response.getWriter().print("Hello world~!!!");
	}
	
	@RequestMapping("/abc")
	@ResponseBody
	public String abc() {
		return "hi abc";
	}
	
	@RequestMapping("/hello")
	public String hello() {
		System.out.println("hllo in");
		return "hello";
	}
	
	@RequestMapping("/gugu")
	public String gugu(Model model) {
		Random r = new Random();
		int dan = r.nextInt(8) + 2 ; // 2 ~ 9단
		model.addAttribute("dan", dan);
		return "gugu";
	}
}
