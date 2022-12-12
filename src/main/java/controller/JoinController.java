package controller;

import javax.management.RuntimeErrorException;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	//아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="login/idchk", method = RequestMethod. POST)
	public String idchk(@RequestBody Member memberId) {

		try{
			logger.info("{}", memberId);

			int result = memberService.idchk(memberId);
			return Integer.toString(result);	 

		} catch(Exception e){
			e.printStackTrace();
			return "failed";

		}
	}
	
	@PostMapping("/join")
	public String joinProcess(Member member, HttpSession session) throws Exception {
		int result = memberService.idchk(member);
		
		logger.info("{}", member);
		
		boolean joinResult = memberService.join(member);
		
		try {
		if( joinResult ) {
			
			logger.info("회원가입 성공");
			return "redirect:/login";
			
		} else {
				
			logger.info("회원가입 실패");
			return "redirect:/join";
		}
		
		} catch (Exception e) {
			throw new RuntimeException();

		}


	}

}