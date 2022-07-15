package com.spring.pr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.pr.board.service.IBoardService;
import com.spring.pr.command.BoardVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private IBoardService service;
	
	//글 목록 보기 요청처리
	@GetMapping("/boardList")
	public void BoardList(Model model) {
		model.addAttribute("bList", service.getList());
	}
	
	//글 작성 페이지 이동 요청 처리
	@GetMapping("/boardRegist")
	public void BoardRegist() {
	}
	
	//글 등록 요청 처리
	@PostMapping("/boardRegist")
	public String BoardRegist(BoardVO vo) {
		service.regist(vo);
		return "redirect:/board/boardList";
	}
	
}
