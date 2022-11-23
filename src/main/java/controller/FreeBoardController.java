package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FreeBoardController {
	
	@RequestMapping("/freeBoard/list")
	public void list() {}
	
	@RequestMapping("/freeBoard/view")
	public void view() {}
	
	@RequestMapping("/freeBoard/write")
	public void write() {}
	
}
