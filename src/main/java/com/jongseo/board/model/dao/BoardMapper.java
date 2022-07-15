package com.jongseo.board.model.dao;

import java.util.List;

import com.jongseo.board.model.dto.BoardDTO;

public interface BoardMapper {

	List<BoardDTO> selectAllBoardList();

	

	

	int insertBoard(BoardDTO board);


	BoardDTO selectBoardDetail(int no);



	int incrementBoardCount(int no);



	int updateBoard(BoardDTO board);




	int deleteBoard(int no);





	int removeBoard(int no);
	
	

}
