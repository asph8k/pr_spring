package com.spring.pr.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.pr.board.mapper.IBoardMapper;
import com.spring.pr.command.BoardVO;

@Service
public class BoardService implements IBoardService {

	@Autowired
	private IBoardMapper mapper;
	
	@Override
	public void regist(BoardVO board) {
		mapper.regist(board);
	}

	@Override
	public List<BoardVO> getList() {
		return mapper.getList();
	}

	@Override
	public int getTotal() {
		return mapper.getTotal();
	}

	@Override
	public BoardVO getContent(int bno) {
		return mapper.getContent(bno);
	}

	@Override
	public void update(BoardVO board) {
		mapper.update(board);
	}

	@Override
	public void delete(int bno) {
		mapper.delete(bno);
	}

}
