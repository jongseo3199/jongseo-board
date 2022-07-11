package com.jongseo.board.Maincontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/*")
public class MainControl {

	@GetMapping(value= {"/", "Main"})
	public String main() {
		
		return "/board/Main";
		
		
	}
}
