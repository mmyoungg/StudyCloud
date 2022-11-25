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

}
