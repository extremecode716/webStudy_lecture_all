package com.ch.ch07;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginCheck implements HandlerInterceptor {
	
	// DispatcherServlet의 화면 처리가 완료된 상태에서 처리
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}

	// 지정된 컨트롤러의 동작 이후에 처리, Spring MVC의 Front Controller인 DispatcherServlet의 화면 처리가 완료된 상태에서 처리
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
	}

	// 지정된 컨트롤러의 동작 이전에 가로채는 역할 (세션이 없으면, 로그인 폼으로 이동 하도록 해준다 )
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("id") == null) {
			response.sendRedirect("loginForm.do");
			return false;
		}
		return true;
	}
}