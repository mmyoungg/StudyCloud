package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StudyRoomController {

	@RequestMapping("/sRoom/list")
	public void list() {}
	
	@RequestMapping("/sRoom/detail")
	public void detail() {}
	
	@RequestMapping("/sRoom/payResult")
	public void pay() {}
	
	@RequestMapping("/sRoom/reserve")
	public void reserve() {}
	
	@RequestMapping("/sRoom/insert")
	public void insert() {}
	
}
