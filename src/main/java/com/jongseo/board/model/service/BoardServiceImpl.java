package com.jongseo.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jongseo.board.exception.BoardRegistException;
import com.jongseo.board.model.dao.BoardMapper;
import com.jongseo.board.model.dto.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService {

	private final BoardMapper mapper;
	
	@Autowired
	public BoardServiceImpl(BoardMapper mapper) {
		
		this.mapper = mapper;
	}
	
	/*
	 * <pre>
	 * 게시판 전체 목록 조회용
	 * </pre>
	 * */
	@Override
	public List<BoardDTO> selectAllBoardList(){
		
		System.out.println("값 확인 3");
        List<BoardDTO> boardList = mapper.selectAllBoardList();
		
        
        System.out.println( "값 확인 4 : " );
		return boardList;
		
		
	}
	
	
	/**
	 * 공지사항 등록
	 * 
	 * @param board
	 * @throws BoardReigstException
	 */
	/*
	 * @Override public void registBoard(BoardDTO board) throws
	 * BoardRegistException{
	 * 
	 * mapper.registBoard(board); }
	 */
	@Override
	public void registBoard(BoardDTO board) throws BoardRegistException{
		
         int result = mapper.insertBoard(board);
		
		if(!(result > 0)) {
			
			throw new BoardRegistException("공지사항 등록에 실패하셨습니다.");
		}
	}

	@Override
	public void insertBoard(BoardDTO board) {
		// TODO Auto-generated method stub
		
	}

	
	
	/*
	 * 게시판 상세보기
	 * */
	@Override
	public BoardDTO selectBoardDetail(String writer) {
		
		System.out.println("상세보기 입니다.");
		BoardDTO boardDetail = null;
		
		int result = mapper.incrementBoardCount(writer);
		
		if(result > 0) {
			boardDetail = mapper.selectBoardDetail(writer);
		}
		
		
		System.out.println("상세보기 입니다2");
		return boardDetail;
	}

	
	
	
}
