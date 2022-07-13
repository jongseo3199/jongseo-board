package com.jongseo.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jongseo.board.exception.BoardRegistException;
import com.jongseo.board.model.dto.BoardDTO;
import com.jongseo.board.model.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

    private final BoardService boardService;
	
	@Autowired
	public BoardController(BoardService boardService) {
		this.boardService = boardService;
	}
	
	/*
	 * 게시판 전체 리스트 조회
	 * 
	 * */
	@GetMapping("/list")
	public String selectAllBoardList(Model model) {
		
		System.out.println("값 확인 1");
		List<BoardDTO> boardList = boardService.selectAllBoardList();
		
		model.addAttribute("boardList", boardList);
		
		System.out.println(" 값 확인 2" );
		
		return "/board/boardMain";
	}
	
	
	/*
	 *  게시판 등록
	 *  
	 * */
	/*
	 * @GetMapping("/boardRegist") public void registBoard() {
	 * 
	 * System.out.println("게시글 작성 페이지"); }
	 */
	
	@RequestMapping(value="boardRegist", method=RequestMethod.GET)
	public String write() {
		
		System.out.println("게시글 작성 페이지");
		return "board/boardRegist";
	}
	
	
	
	
	
	
	/* @PostMapping("/boardRegist") */
	
	@RequestMapping(value="regist", method=RequestMethod.POST)
	public String registBoard(BoardDTO board, RedirectAttributes rttr) throws BoardRegistException {
	  
	  System.out.println("값 1111:"+board.toString());
	  
		/*
		 * boardService.registBoard(board);
		 * 
		 * rttr.addFlashAttribute("message", "공지사항 등록에 성공하셨습니다.");
		 */
	  
	  System.out.println("값 2222"); 
      
	  //return "redirect:/board/list";
	  return "/board/list";
	  
	  
	  }
	 
	
	
}
