package com.jongseo.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jongseo.board.exception.BoardModifyException;
import com.jongseo.board.exception.BoardRegistException;
import com.jongseo.board.exception.BoardRemoveException;
import com.jongseo.board.model.dao.BoardMapper;
import com.jongseo.board.model.dto.BoardDTO;
import com.jongseo.board.paging.SelectCriteria;

@Service
public class BoardServiceImpl implements BoardService {

	private final BoardMapper mapper;
	
	@Autowired
	public BoardServiceImpl(BoardMapper mapper) {
		
		this.mapper = mapper;
	}
	
	
	
	/*
	 * 
	 * 게시판 전체 갯수 조회용
	 * 
	 * */
	
	@Override
	public int selectTotalCount(Map<String, String> searchMap) {
		
		System.out.println(" 갯수 (서비스단)" + searchMap);
		return mapper.selectTotalCount(searchMap);
	}

	
	/*
	 * 게시글 전체 조회용
	 * */
	
	@Override
	public List<BoardDTO> selectBoardList(SelectCriteria selectCriteria) {
		
		System.out.println(" 전체 조회 (서비스단)" + selectCriteria);
		return mapper.selectBoardList(selectCriteria);
	}


	
	
	/**
	 * 공지사항 등록
	 * 
	 
	 */
	@Override
	public void registBoard(BoardDTO board) throws BoardRegistException{
		
		System.out.println("등록값(서비스) : " + board);
		
         int result = mapper.insertBoard(board);
		
         System.out.println("등록값(서비스)2 : " + result);
		 if(!(result > 0)) {
			
			throw new BoardRegistException("공지사항 등록에 실패하셨습니다.");
		}
	}



	
	
	/*
	 * 게시판 상세보기
	 * */
	@Override
	public BoardDTO selectBoardDetail(int no) {
		
		System.out.println("상세보기 입니다.");
		BoardDTO boardDetail = null;
		
		int result = mapper.incrementBoardCount(no);
		System.out.println("상세보기값1 : "  + result);
		
		if(result > 0) {
			boardDetail = mapper.selectBoardDetail(no);
		}
		
		System.out.println("상세보기값2 :" + result);
		System.out.println("상세보기 값3 : " + no);
		
		
		return boardDetail;
	}

	
	/*
	 * 게시판 수정 하기
	 * 
	 * */
	@Override
	public void modifyBoard(BoardDTO board) throws BoardModifyException {
		System.out.println("수정값 확인");
		
		int result = mapper.updateBoard(board);
		System.out.println(" 수정결과 값1(서비스):" + result);
		System.out.println(" 수정결과 값2(서비스):" + board);
		
		if(!(result > 0)) {
			
			System.out.println(" 수정결과 값3(서비스):" + result);
			throw new BoardModifyException("공지사항 수정에 실패하셨습니다.");
		}
	}



	/*
	 * 게시글 삭제
	 * 
	 * */
	@Override
	public void removeBoard(int no) throws BoardRemoveException {
		
		System.out.println("삭제값 확인(서비스단)" + no);

		
		int result = mapper.removeBoard(no);
		
		
		if(!(result > 0)) {
			
		System.out.println(" 결과 값 :" + result);
		throw new BoardRemoveException("삭제에 실패하셨습니다.");
		
		}
		
	}












	



	
	
}
