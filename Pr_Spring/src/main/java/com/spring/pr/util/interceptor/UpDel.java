package com.spring.pr.util.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.spring.pr.command.UserVO;

public class UpDel implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		UserVO user = (UserVO) session.getAttribute("login");
		System.out.println("유저 정보 객체 가져오는지: " + user);
		
		String writer = request.getParameter("writer");
		System.out.println("작성자 정보 객체 가져오는지: " + writer);
		
		if(user != null) {
			if(user.getUserId().equals(writer)) {
				return true;
			}
		}
		
		response.setContentType("text/html charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String html = "<script> \r\n"
				+ "alert('권한이 없습니다.'); \r\n"
				+ "history.back(); \r\n"
				+ "</script>";
		out.print(html);
		out.flush();
		
		return false;
	}
	
}
