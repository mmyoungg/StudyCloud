package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.ResponseBody;

import dto.Member;
import service.face.MemberService;

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
			session.setAttribute("member_no", member.getMemberNo());
			session.setAttribute("member_nick", memberService.getMemberNick(member));

			return "redirect:/mainpage";

		} else {

			logger.info("로그인 실패");

//			req.setAttribute("message", "error");
//			req.setAttribute("url", "/login");

			return "redirect:/loginFail";
		}

	}
	
		@GetMapping("/loginFail")
		public String loginFail() {
			
	//		logger.info("/loginFail [GET]성공");
			return "login/loginFail";
		
		}
		
	//로그아웃
	
	@RequestMapping("login/logout")
	
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/mainpage";
	}
	
	
	
	//아이디 찾기 
	@GetMapping("/login/findid")
	public String findid() {
		
		logger.info("/login/findid [GET]성공");
		
		return "login/findid";
		
	}
	
	@PostMapping("/login/findid")
	@ResponseBody
	public String findid(Member member, Model model) {

		String findid = memberService.selectid(member);
		
//			String result = memberService.findid(memberEmail);
			model.addAttribute("findid", findid);
		
			return findid;
	}
	

	//비밀번호찾기
	
//	@GetMapping("/login/findpw")
//	public String findpw() {
//		
//		logger.info("/login/findpw [GET]성공");
//		
//		return "login/findpw";
//	
//	}
	
	@RequestMapping(value = "/login/findpw", method = RequestMethod.GET)
	public void findPwGET() throws Exception{
	}

	@RequestMapping(value = "/login/findpw", method = RequestMethod.POST)
	public void findPwPOST(Member member, HttpServletResponse resp) {
		resp.setContentType("text/plain;charset=utf-8");
		
		String msg = memberService.findPw(member);
		
		try {
			resp.getWriter().append(msg);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
