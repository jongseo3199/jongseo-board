package com.jongseo.board.model.dao;

import java.util.List;

import com.jongseo.board.model.dto.BoardDTO;

public interface BoardMapper {

	List<BoardDTO> selectAllBoardList();

	

	void registBoard(BoardDTO board);

	int insertBoard(BoardDTO board);


	BoardDTO selectBoardDetail(String writer);



	int incrementBoardCount(String writer);



	int updateBoard(BoardDTO board);

}
