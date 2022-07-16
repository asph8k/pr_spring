package com.spring.pr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.pr.board.service.IBoardService;
import com.spring.pr.command.BoardVO;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private IBoardService service;
	
	//�� ��� ���� ��ûó��
	@GetMapping("/boardList")
	public void BoardList(Model model) {
		model.addAttribute("bList", service.getList());
	}
	
	//�� �ۼ� ������ �̵� ��û ó��
	@GetMapping("/boardRegist")
	public void BoardRegist() {
	}
	
	//�� ��� ��û ó��
	@PostMapping("/boardRegist")
	public String BoardRegist(BoardVO vo) {
		service.regist(vo);
		return "redirect:/board/boardList";
	}
	
	//글 상세보기 요청 처리
	@GetMapping("/boardDetail/{bno}")
	public String BoardDetail(@PathVariable int bno, Model model) {
		model.addAttribute("board", service.getContent(bno));
		return "/board/boardDetail";
	}
	/*
	//글 수정 페이지 이동 요청 처리
	@GetMapping("/boardModify")
	public ModelAndView BoardModify(int bno) {
		BoardVO article = service.getContent(bno);
		ModelAndView mv = new ModelAndView();
		mv.addObject("board", article);
		mv.setViewName("/board/boardModify");
		return mv;
	}
	*/
	
	//글 수정 페이지 이동 요청 처리
	@GetMapping("/boardModify")
	public void BoardModify() {
		
	}
	
	//글 내용 수정 요청 처리
	@PostMapping("/boardModify")
	public String BoardModify(BoardVO vo) {
		service.update(vo);
		return "redirect:/board/boardDetail";
	}
}
