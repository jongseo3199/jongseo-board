package com.jongseo.board.model.service;

import java.util.List;

import com.jongseo.board.exception.BoardModifyException;
import com.jongseo.board.exception.BoardRegistException;
import com.jongseo.board.model.dto.BoardDTO;

public interface BoardService {

	List<BoardDTO> selectAllBoardList();


	void registBoard(BoardDTO board) throws BoardRegistException;


	void insertBoard(BoardDTO board);



	BoardDTO selectBoardDetail(String writer);


	void modifyBoard(BoardDTO board) throws BoardModifyException;


	


	

	

}
