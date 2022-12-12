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


import dao.face.MemberDao;
import dao.face.MypageDao;
import dto.Member;
import service.face.MemberService;
import service.face.MypageService;

@Controller
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired MypageService mypageService;
	@Autowired private MemberService memberService;
	@Autowired MypageDao mypageDao;
	@Autowired MemberDao memberDao;
	
	@GetMapping("/mypage")
	public String mypage() {
		
		logger.info("/mypage [GET]성공");
		
		return "mypage/mypageMain";
	
	}
		
   
    // 회원 정보 수정 페이지
	
	@GetMapping("/edit")
	public String userUpdate(HttpSession session, Model model) {
		logger.info("/edit [GET]성공");
		
		int member_no = (int) session.getAttribute("member_no");
		Member member = new Member();
		member.setMemberNo(member_no);
		member = memberService.memberInfoByNo(member);

		model.addAttribute("member", member);
		
		return "mypage/edit";
	}
    
	// 회원 정보 수정
	
	@PostMapping("/edit")
	public String userUpdate(Member member, HttpSession session, Model model, HttpServletRequest req) {

		logger.info("{}", member);
		mypageService.userUpdate(member);

		return "redirect:/edit";
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
