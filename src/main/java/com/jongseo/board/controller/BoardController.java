package com.jongseo.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jongseo.board.exception.BoardModifyException;
import com.jongseo.board.exception.BoardRegistException;
import com.jongseo.board.exception.BoardRemoveException;
import com.jongseo.board.model.dto.BoardDTO;
import com.jongseo.board.model.service.BoardService;
import com.jongseo.board.paging.Pagenation;
import com.jongseo.board.paging.SelectCriteria;

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
	@RequestMapping(value="list", method=RequestMethod.GET) 
	public ModelAndView BoardSelectList(@RequestParam(defaultValue = "1") int currentPage, @ModelAttribute SelectCriteria searchCriteria,
	         ModelAndView mv) {
	
		String searchCondition = searchCriteria.getSearchCondition();
		String searchValue = searchCriteria.getSearchValue();
		
		Map<String, String> searchMap = new HashMap<>();
		searchMap.put("searchCondition", searchCondition);
		searchMap.put("searchValue", searchValue);
		
		System.out.println("컨디션 값: " + searchCondition);
		System.out.println(" 검색 조건 확인 : " + searchMap);
		System.out.println("밸류값: " + searchValue);
		/* 전체 게시물수
		 * 1. 데이터베이스에서 먼저 전체 게시물 수를 조회
		 * 2. 검색조건이 있는 경우 검색 조건에 맞는 전체 게시물 수를 조회
		 * */
		int totalCount = boardService.selectTotalCount(searchMap);
		
		System.out.println("검색 후 갯수 : " + totalCount);
		
		/* 한 페이지에 보여줄 게시물 수 */
		int limit = 22;
		
		/* 한 번에 보여질 페이징 버튼의 갯수*/
		int buttonAmount = 5; 
		
		/* 페이징 처리를 위한 로직 호출 후 페이징 처리에 관한 정보를 담고 있는 인스턴스를 반환*/
		SelectCriteria selectCriteria = null;
		
		if(searchCondition != null && !"".equals(searchCondition)) {
		
			selectCriteria = Pagenation.getSelectCriteria(currentPage, totalCount, limit, buttonAmount, searchCondition, searchValue);
		} else {
			selectCriteria = Pagenation.getSelectCriteria(currentPage, totalCount, limit, buttonAmount);
		}
		
		System.out.println("selectCriteria : " + selectCriteria);
		
		List<BoardDTO> boardList = boardService.selectBoardList(selectCriteria);
		
		System.out.println("boardList : " + boardList);
		
		mv.addObject("boardList", boardList);
		mv.addObject("selectCriteria", selectCriteria);
		mv.setViewName("/board/boardMain");
		return mv;
	}
	
	
	/*
	 *  게시판 등록 (페이지 불러오기)
	 *  
	 */
	
	@RequestMapping(value="boardRegist", method=RequestMethod.GET)
	public String write() {
		
		System.out.println("게시글 작성 페이지");
		return "board/boardRegist";
	}
	
	
	 /*
	  * 게시판 등록(게시물 등록)
	  * 
	  * */
	 @RequestMapping(value="regist", method=RequestMethod.POST)
	 public String registBoard(BoardDTO board, RedirectAttributes rttr) throws BoardRegistException {
	  
	  System.out.println("등록페이지 :" + board);
	  
	  boardService.registBoard(board);
	  
	  System.out.println("등록 값 확인 : " + board);
	  
	  rttr.addFlashAttribute("message", "등록 성공");
	  
	  return "/board/Main";
	  
	  
	  }

	 
	 /*
	  * 게시글 상세 보기
	  * 
	  * */
	 @RequestMapping(value="detail", method=RequestMethod.GET)
	 public String selectBoardDetail(@RequestParam int no, Model model) {
			
			System.out.println(" 값: " + no);
			
			BoardDTO boardDetail = boardService.selectBoardDetail(no);
			
			model.addAttribute("board", boardDetail);
			
			System.out.println( "게시글 상세보기 완료");
			
			return "/board/boardDetail";
		}
	
	
	 
	 /*
	  * 게시판 수정하기
	  * 
	  * */
	 @RequestMapping(value="update", method=RequestMethod.GET)
	 public String modifyBoard(@RequestParam int no, Model model) {
		 
			System.out.println("no 확인1 :" + no);
			System.out.println("model 값 확인1 : " + model);
			
			BoardDTO board = boardService.selectBoardDetail(no);
			
			System.out.println("no 확인2 : " + no);
			System.out.println("모델도 확인2:" + model);
			model.addAttribute("board", board);
			
			return "/board/boardUpdate";
		}
	 
	 
	 @RequestMapping(value="update", method=RequestMethod.POST)
	 public String modifyBoard(@ModelAttribute BoardDTO board, RedirectAttributes rttr) throws BoardModifyException {
			
			System.out.println("board 수정값 확인: " + board);
			
			boardService.modifyBoard(board);
			
			rttr.addFlashAttribute("message", "공지사항 수정에 성공하셨습니다!");
			
			return "redirect:/board/list";
		}
	 
	 
	 
	 
	 /*
	  * 게시판 삭제
	  * 
	  * */
	    @RequestMapping(value="delete", method=RequestMethod.GET)
		public String removeBoard(@RequestParam int no, RedirectAttributes rttr) throws BoardRemoveException {
			
	    	System.out.println("삭제값 1 :" + no);
			boardService.removeBoard(no);
			
			System.out.println("삭제값 2 :");
			rttr.addFlashAttribute("message", "공지사항 삭제에 성공하였습니다.");
			
			
			return "redirect:/board/list";
		}
	 
	 
	 
}
