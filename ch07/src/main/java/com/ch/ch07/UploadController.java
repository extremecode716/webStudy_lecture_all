package com.ch.ch07;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {
	@RequestMapping(value = "upload.do", method = RequestMethod.GET)
	public String uploadForm() {
		return "upload";
	}

	@RequestMapping(value = "upload.do", method = RequestMethod.POST)
	public String upload(@RequestParam("file") MultipartFile mf, Model model, HttpSession session)
			throws IllegalStateException, IOException {
		String fileName = mf.getOriginalFilename();
		int fileSize = (int) mf.getSize();
		// mf.transferTo(new File("/gov/"+fileName));
		String path = session.getServletContext().getRealPath("/upload");
		FileOutputStream fos = new FileOutputStream(path + "/" + fileName);
		fos.write(mf.getBytes());
		fos.close();
		
		model.addAttribute("fileName", fileName);
		model.addAttribute("fileSize", fileSize);
		return "uploadResult";
	}

	@RequestMapping("loginForm.do")
	public String loginForm() {
		return "loginForm";
	}

	@RequestMapping("login.do")
	public String login(String id, String pass, HttpSession session, Model model) {
		if (id.equals("java") && pass.equals("1234")) {
			session.setAttribute("id", id);
			return "loginSuccess";
		} else {
			model.addAttribute("msg", "똑바로 입력해");
			return "loginForm";
		}
	}
}