package com.jongseo.board.model.dao;

import java.util.List;
import java.util.Map;

import com.jongseo.board.model.dto.BoardDTO;
import com.jongseo.board.paging.SelectCriteria;

public interface BoardMapper {

	List<BoardDTO> selectAllBoardList();

	int insertBoard(BoardDTO board);


	BoardDTO selectBoardDetail(int no);

	int incrementBoardCount(int no);


	int updateBoard(BoardDTO board);


	int deleteBoard(int no);


	int removeBoard(int no);

	int selectTotalCount(Map<String, String> searchMap);

	List<BoardDTO> selectBoardList(SelectCriteria selectCriteria);
	
	

}
