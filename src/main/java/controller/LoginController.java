package controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import service.face.MemberService;
import dto.Member;

@Controller
public class LoginController {
	
	//로그 객체
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	//서비스 객체
	@Autowired private MemberService memberService;
	
	
	//로그인
	@GetMapping("/login")
	public String login() {
		
		logger.info("/login [GET]성공");
		return "login/login";
	
	}
	
	@PostMapping("/login")
	public String loginProcess(Member member, HttpSession session) {
		
		logger.info("{}", member);
		
		boolean loginResult = memberService.login(member);
		
		logger.info("loginResult : {}", loginResult);
		
		if( loginResult ) {
			
			logger.info("로그인 성공");
			
			session.setAttribute("login", loginResult);
			session.setAttribute("member_id", member.getMember_id());
			session.setAttribute("member_nick", memberService.getMemberNick(member));
			
			return "redirect:/mainpage";
			
		} else {
			
			logger.info("로그인 실패");
			session.invalidate();
			
			return "redirect:/login";
		}
		
	}

	//로그아웃
	
	@RequestMapping("login/logout")
	
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/mainpage";
	}
	
	
	
	@GetMapping("/login/findid")
	public String findid() {
		
		logger.info("/login/findid [GET]성공");
		
		return "login/findid";
	
	}
	
	@GetMapping("/login/findpw")
	public String findpw() {
		
		logger.info("/login/findpw [GET]성공");
		
		return "login/findpw";
	
	}
}
