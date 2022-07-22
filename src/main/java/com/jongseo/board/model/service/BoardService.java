package com.jongseo.board.model.service;

import java.util.List;
import java.util.Map;

import com.jongseo.board.exception.BoardModifyException;
import com.jongseo.board.exception.BoardRegistException;
import com.jongseo.board.exception.BoardRemoveException;
import com.jongseo.board.model.dto.BoardDTO;
import com.jongseo.board.paging.SelectCriteria;


public interface BoardService {

	


	void registBoard(BoardDTO board) throws BoardRegistException;


	void modifyBoard(BoardDTO board) throws BoardModifyException;


	BoardDTO selectBoardDetail(int no);


	void removeBoard(int no) throws BoardRemoveException;


	List<BoardDTO> selectBoardList(SelectCriteria selectCriteria);


	int selectTotalCount(Map<String, String> searchMap);


	







	


	


	

	

}
