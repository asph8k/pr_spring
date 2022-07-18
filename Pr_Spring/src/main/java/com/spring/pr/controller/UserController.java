package com.spring.pr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.pr.command.UserVO;
import com.spring.pr.user.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private IUserService service;
	
	//회원가입 페이지 이동 요청처리
	@GetMapping("/userJoin")
	public void UserJoin() {
	}
	
	//회원가입 요청 처리
	@PostMapping("/userJoin")
	public String UserJoin(UserVO vo) {
		service.join(vo);
		return "/user/userLogin";
	}
	
	//로그인 페이지 이동 요청 처리
	@GetMapping("/userLogin")
	public void UserLogin() {		
	}
	
	//로그인 요청 처리
	@PostMapping("/userLogin")
	public String UserLogin(@RequestParam("id") String id, @RequestParam("password") String pw) {
		service.login(id, pw);
		return "/user/userMypage";
	}
	
}
