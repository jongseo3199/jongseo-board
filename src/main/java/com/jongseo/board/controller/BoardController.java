package com.jongseo.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jongseo.board.exception.BoardRegistException;
import com.jongseo.board.model.dto.BoardDTO;
import com.jongseo.board.model.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {

  private final BoardService boardService;
	
	@Autowired
	public BoardController(BoardService boardService) {
		this.boardService = boardService;
	}
	
	@GetMapping("/list")
	public String selectAllBoardList(Model model) {
		
		System.out.println("값 확인 1");
		List<BoardDTO> boardList = boardService.selectAllBoardList();
		
		model.addAttribute("boardList", boardList);
		
		System.out.println(" 값확인 2" );
		
		return "/board/boardMain";
	}
	
	
	/*
	 *  게시판 등록
	 *  
	 * */
	@GetMapping("/boardRegist")
	public void registBoard() {}
	
	@PostMapping("/regist")
	public String registBoard(@ModelAttribute BoardDTO board, HttpServletRequest request,
			 RedirectAttributes rttr) throws BoardRegistException {
		
		System.out.println("값 1");
		
		int no = board.getNo(); // 요기 잘 모르겠음
		
		board.setNo(no);
		System.out.println("값 2");
		
		boardService.registBoard(board);
		
        rttr.addFlashAttribute("message", "공지사항 등록에 성공하셨습니다.");
		
		return "redirect:/board/list";
		
	
		
	}
	
	
}
