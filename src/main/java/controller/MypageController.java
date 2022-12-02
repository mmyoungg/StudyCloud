package controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@GetMapping("/mypage")
	public String mypage() {
		
		logger.info("/mypage [GET]성공");
		
		return "mypage/mypageMain";
	
	}
	
	@GetMapping("/editinformation")
	public String editinformation() {
		
		logger.info("/editinformation [GET]성공");
		
		return "mypage/editinformation";
	
	}
	
	@GetMapping("/withdrawal")
	public String withdrawal() {
		
		logger.info("/withdrawal [GET]성공");
		
		return "mypage/withdrawal";
	
	}
	
	@GetMapping("/message")
	public String message() {
		
		logger.info("/message [GET]성공");
		
		return "mypage/message";
	
	}
	
	@GetMapping("/wishlist")
	public String wishlist() {
		
		logger.info("/wishlist [GET]성공");
		
		return "mypage/wishlist";
	
	}
	
	@GetMapping("/mystudy")
	public String mystudy() {
		
		logger.info("/mystudy [GET]성공");
		
		return "mypage/mystudy";
		
	}
	
	@GetMapping("/booklist")
	public String booklist() {
		
		logger.info("/booklist [GET]성공");
		
		return "mypage/booklist";
		
	}
	
	@GetMapping("/likelist")
	public String likelist() {
		
		logger.info("/likelist [GET]성공");
		
		return "mypage/likelist";
		
	}
	
	@GetMapping("/mtbooklist")
	public String mtbooklist() {
		
		logger.info("/mtbooklist [GET]성공");
		
		return "mypage/mtbooklist";
	
	}

}
