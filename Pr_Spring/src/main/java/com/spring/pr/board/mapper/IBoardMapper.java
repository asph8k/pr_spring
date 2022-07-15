package com.spring.pr.board.mapper;

import java.util.List;

import com.spring.pr.command.BoardVO;

public interface IBoardMapper {

	// 글 등록 
	void regist(BoardVO board);
	
	// 글 목록
	List<BoardVO> getList();
	
	// 총 게시물 수 
	int getTotal();
	
	// 상세보기 
	BoardVO getContent(int bno);
	
	// 수정 
	void update(BoardVO board);
	
	// 삭제 
	void delete(int bno);
}
