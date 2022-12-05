package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String loginProcess(Member member, HttpSession session, HttpServletRequest req) {
		
		logger.info("{}", member);
		
		boolean loginResult = memberService.login(member);
		
		logger.info("loginResult : {}", loginResult);
		
		if( loginResult ) {
			
			logger.info("로그인 성공");
			
			session.setAttribute("login", loginResult);
			session.setAttribute("member_id", member.getMemberId());
			session.setAttribute("member_nick", memberService.getMemberNick(member));

			return "redirect:/mainpage";

		} else {

			logger.info("로그인 실패");

			req.setAttribute("message", "아이디와 비밀번호를 확인해주세요");
			req.setAttribute("url", "/login");

		}

		return "redirect:/loginFail";
	}
	
	@GetMapping("/loginFail")
	public String loginFail() {
		
		logger.info("/loginFail [GET]성공");
		return "login/loginFail";
	
	}
		
	//로그아웃
	
	@RequestMapping("login/logout")
	
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/mainpage";
	}
	
	
	
	//아이디 찾기 
//	@RequestMapping(value="/login/findid")
//	@ResponseBody
//	public String findid(Member member,
//			@RequestParam(value="memberEmail" , required=false) String memberEmail, Model model) {
//
//		model.getAttribute(memberEmail);
//		String result = memberService.findid(memberEmail);
//
//		return result;
//	}

	@GetMapping("/login/findid")
	public String findid() {
		
		logger.info("/login/findid [GET]성공");
		
		return "login/findid";
		
	}
	
	@PostMapping("/login/findid")
	public String findid(Member member,
			@RequestParam(value="memberEmail", required=false) String memberEmail, Model model) {
		
			model.addAttribute(model);
			String result = memberService.findid(memberEmail);
		
	
		return "/login/findid";
	}
	
	
	@GetMapping("/login/findpw")
	public String findpw() {
		
		logger.info("/login/findpw [GET]성공");
		
		return "login/findpw";
	
	}
}
