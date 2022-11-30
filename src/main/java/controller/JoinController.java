package controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import service.face.MemberService;
import dto.Member;

@Controller
public class JoinController {
	
	//로그 객체
	private static final Logger logger = LoggerFactory.getLogger(JoinController.class);
	
	//서비스 객체
	@Autowired private MemberService memberService;
	
	@GetMapping("/join")
	public String join() {
		
		logger.info("/join [GET] 성공");
		
		return "join/join";
	
	}
	
	@PostMapping("/member/join")
	public String joinProcess(Member member, HttpSession session) {
		logger.info("{}", member);
		
		boolean joinResult = memberService.join(member);
		
		if( joinResult ) {
			
			logger.info("회원가입 성공");
			return "redirect:/";
			
		} else {
			
			logger.info("회원가입 실패");
			return "redirect:/member/join";
		}
	}

}