package com.ch.hello;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ErrorController {
	@ExceptionHandler(Exception.class)
	public ModelAndView err(Exception e) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("er", e);
		mav.setViewName("errResult");
		return mav;
	}
}