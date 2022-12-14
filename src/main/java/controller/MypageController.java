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
import org.springframework.web.multipart.MultipartFile;

import dao.face.MemberDao;
import dao.face.MypageDao;
import dto.FileUpload;
import dto.Member;
import service.face.MemberService;
import service.face.MypageService;

@Controller
public class MypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired MypageService mypageService;
	@Autowired MemberService memberService;
	@Autowired MypageDao mypageDao;
	@Autowired MemberDao memberDao;
	
	@GetMapping("/mypage")
	public String mypage() {
		
		logger.info("/mypage [GET]성공");
		
		return "mypage/mypageMain";
	
	}
		
   
    // 회원 정보 수정 페이지
	
	@GetMapping("/edit")
	public String userUpdate(HttpSession session,  HttpServletRequest req, Model model) {
			logger.info("/edit [GET]성공");
			
			if(session.getAttribute("member_no") != null) {
				int member_no = (int)session.getAttribute("member_no");
				Member member = new Member();
				member.setMemberNo(member_no);
				
				member = memberService.memberInfoByNo(member);

				model.addAttribute("member", member);
				model.addAttribute("picture", mypageService.selectProfile(member_no) );
				
			}
			
			return "mypage/edit";
		
	}
    
	// 회원 정보 수정
	
	@PostMapping("/edit")
	public String userUpdate(Member member, HttpSession session, Model model, HttpServletRequest req, MultipartFile file) {

		if(session.getAttribute("member_no") != null) {
			int member_no = (int) session.getAttribute("member_no");
			
			member.setMemberNo(member_no);
			
			if(member.getMemberPw() == null || member.getMemberPw() == "" || member.getMemberPw().isEmpty()) {
				Member dbMember = memberService.getMemberById(member.getMemberId());
				logger.info("dbMember : {}", dbMember);
				member.setMemberPw(dbMember.getMemberPw());
			}
		
			mypageService.userUpdate(member);

			//모델값 전달
			model.addAttribute("member", member);
			
			//첨부파일(프로필사진) 모델값 전달
			FileUpload fileUpload = memberService.getProfileMemberNo(member);
			model.addAttribute("fileUpload", fileUpload);
			
			//첨부파일 처리
			if(file != null && file.getSize() > 0) {
				mypageService.insertProfile(member, file);
			}
			
			return "redirect:/edit";
		}else {
			return "redirect:/login";
		}
		
	}

	
	//회원탈퇴
	@RequestMapping(value="/withdrawal")
	public String withdrawal(Member member, HttpSession session) {
		
		logger.info("/withdrawal [GET]성공");
		
		mypageService.withdrawal(member,session);

		return "mypage/withdrawal";
	}
	
	//비밀번호 확인
	@RequestMapping(value="/withdrawal", method=RequestMethod.POST, produces = "application/text; charset=utf8") 
		@ResponseBody
		public String passCheck(Member member) {
		
		int result = mypageService.passCheck(member);
		
		return Integer.toString(result);

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
