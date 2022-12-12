package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dao.face.admin.ReserveDao_admin;
import dto.ApplyMt;
import dto.FileUpload;
import dto.Member;
import dto.Reservation;
import dto.SroomQna;
import dto.StudyBoard;
import dto.StudyRoom;
import service.face.admin.ApplyMtService_admin;
import service.face.admin.MemberService_admin;
import service.face.admin.ReserveService_admin;
import service.face.admin.SboardService_admin;
import service.face.admin.SroomService_admin;
import util.Paging;

@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired SroomService_admin sRoomService_admin;
	@Autowired ApplyMtService_admin applyMtService_admin;
	@Autowired SboardService_admin sBoardService_admin;
	@Autowired MemberService_admin memberService_admin;
	@Autowired ReserveService_admin reserveService_admin;
	@Autowired ReserveDao_admin reserveDao_admin;
	
	//로그인
	@GetMapping("/login/admin")
	public void adminLogin() {
	
	}
	
	@PostMapping("/login/admin")
	public String loginPorc(Member member, HttpSession session) {
		logger.info("{}", member);
		
		boolean isLogin = memberService_admin.login(member);
		logger.info("loginResult: {}", isLogin);
		
		if( isLogin ) {
			logger.info("로그인 성공");
			
			session.setAttribute("login", isLogin);
			session.setAttribute("loginid", member.getMemberId());
			
			//로그인 성공시 관리자 메인페이지로 이동
			return "redirect:/admin/main";

		} else {
			logger.info("로그인 실패");
			
			//세션 삭제
			session.invalidate();
			
			return "redirect:/login/admin";
		}
		
	}
	
	//로그아웃
	@RequestMapping("/admin/logout")
	public String logout(HttpSession session) {
		logger.info("/admin/logout");
		
		session.invalidate();
		
		return "redirect:/login/admin";
	}
	
	//메인
	@GetMapping("/admin/main")
	public void admin(ApplyMt applyMt, StudyBoard studyBoard, HttpSession session, Model model) {
		logger.info("/admin/main [GET]");
		
		//로그인 정보
		String loginid = (String) session.getAttribute("loginid");
		logger.info("/admin/main loginid : {}", loginid);
		
		Member info = memberService_admin.info(loginid);
		logger.info("info : {}", info);
		
		model.addAttribute("info", info);
		
		//투데이 어플라이
		int todayMentoApply = applyMtService_admin.todayApply(applyMt);
		logger.debug("{}", todayMentoApply);
		model.addAttribute("todayMentoApply", todayMentoApply);
		
		int todayStudyApply = sBoardService_admin.todayApply(studyBoard);
		logger.debug("{}", todayStudyApply);
		model.addAttribute("todayStudyApply", todayStudyApply);
		
		//예약 미리보기
		List<HashMap<String, Object>> preReserve = reserveDao_admin.previewReserve();
		System.out.println( preReserve );
		
		model.addAttribute("preReserve", preReserve);
		
	}
	
	//멘토 등록
	@GetMapping("/admin/mento")
	public void mento(
			@RequestParam(defaultValue = "0" ) int curPage
			, Model model ) {
		
		logger.info("/admin/mento [GET]");
		
		Paging paging = applyMtService_admin.getPaging(curPage);
		logger.debug("{}", paging);
		model.addAttribute("paging", paging);
		
		List<ApplyMt> list = applyMtService_admin.list(paging);
		for( ApplyMt a : list ) logger.info("{}", a);
		model.addAttribute("list", list);
		
	}
	
	@PostMapping("/admin/mento")
	public String mento (Member member) {
		logger.info("/admin/mento [POST]");
		
		//회원 등급 변경
		applyMtService_admin.updateMember(member);
		logger.debug("member : {}", member);
		
		return "redirect:/admin/mento";
	}
	
	//스터디 등록
	@GetMapping("/admin/study")
	public void study(
			@RequestParam(defaultValue = "0" ) int curPage
			, Model model ) {
		
		logger.info("/admin/study [GET]");
		
		Paging paging = sBoardService_admin.getPaging(curPage);
		logger.debug("{}", paging);
		model.addAttribute("paging", paging);
		
		List<StudyBoard> list = sBoardService_admin.list(paging);
		for (StudyBoard s : list ) logger.debug("{}", s);
		model.addAttribute("list", list);
		
	}
	
	@PostMapping("/admin/study")
	public String study(Member member) {
		logger.info("/admin/study [POST]");
		
		//회원 등급 변경
		sBoardService_admin.updateMember(member);
		logger.debug("member : {}", member);
		
		return "redirect: /admin/study";
	}
	

	//스터디룸 등록
	@GetMapping("/admin/studyroom")
	public void studyroom(
			@RequestParam(defaultValue = "0" ) int curPage
			, Model model ) {
		
		logger.info("/admin/studyroom [GET]");

		Paging paging = sRoomService_admin.getPaging(curPage);
		logger.info("{}", paging);
		model.addAttribute("paging", paging);
		
		List<StudyRoom> list = sRoomService_admin.list(paging);
		for( StudyRoom s : list ) logger.info("{}", s);
		model.addAttribute("list", list);
		
	}
	
	@GetMapping("/admin/studyroom/write")
	public String insert() {
		logger.info("/admin/studyroom/write [GET]");
		
		return "/admin/sRoominsert";
	}
	
	@PostMapping("/admin/studyroom/write")
	public String insertProc(StudyRoom studyroom, MultipartFile file, HttpSession session) {
		
		logger.info("/admin/studyroom/write [POST]");

		logger.info("{}", studyroom);
		logger.info("{}", file);
		
		//게시글, 첨부파일 처리
		sRoomService_admin.write(studyroom, file);
		
		//목록으로 리다이렉트
		return "redirect:/admin/studyroom";
	}
	
	@GetMapping("/admin/studyroom/view")
	public String view(StudyRoom studyroom, Model model) {
		logger.debug("{}", studyroom);
		
		//잘못된 게시글 번호 처리
		if( studyroom.getsRoomNo() < 0) {
			return "redirect:/admin/studyroom";
		}
		
		//게시글 조회
		studyroom = sRoomService_admin.view(studyroom);
		logger.debug("조회된 게시글 {}", studyroom);
		
		//모델값 전달
		model.addAttribute("studyroom", studyroom);
		
		//첨부파일 모델값 전달
		FileUpload sRoomFile = sRoomService_admin.getAttachFile(studyroom);
		model.addAttribute("sRoomFile", sRoomFile);
		
		return "/admin/sRoomView";
	}
	
	@GetMapping("/admin/studyroom/update")
	public String update(StudyRoom studyroom, Model model) {
		logger.debug("{}", studyroom);
		
		//잘못된 게시글 번호 처리
		if( studyroom.getsRoomNo() < 0 ) {
			return "redirect:/admin/studyroom";
		}
		
		//게시글 조회
		studyroom = sRoomService_admin.view(studyroom);
		logger.debug("조회된 게시글 {}", studyroom);
		
		//모델값 전달
		model.addAttribute("updateStudyroom", studyroom);
		
		//첨부파일 모델값 전달
		FileUpload sRoomFile = sRoomService_admin.getAttachFile(studyroom);
		model.addAttribute("sRoomFile", sRoomFile);
		
		return "/admin/sRoomUpdate";
	}
	
	@PostMapping("/admin/studyroom/update")
	public String updatePorc(StudyRoom studyroom, MultipartFile file) {
		logger.debug("{}", studyroom);
		
		sRoomService_admin.update(studyroom, file);
		
		//게시글 수정한 페이지로 이동
		return "redirect:/admin/studyroom/view?sRoomNo="+studyroom.getsRoomNo();
	}
	
	@RequestMapping("/admin/studyroom/delete")
	public String delete(StudyRoom studyroom) {
		
		sRoomService_admin.delete(studyroom);
		
		return "redirect:/admin/studyroom";
	}
	
	//스터디룸 QnA
	@RequestMapping("/admin/qna")
	public void qna(StudyRoom studyroom, Model model) {
		
		logger.info("/admin/qna [GET]");
		
		List<HashMap<String, Object>> qna = sRoomService_admin.qnaList();
		
		logger.info("qna: {}", qna);
		
		model.addAttribute("qna", qna);
		
	}
	
	@GetMapping("/admin/qna/view") //QnA 상세보기
	public String qnaView(SroomQna qnaView, Model model) {
		
		//잘못된 게시글 번호 처리
		if( qnaView.getsRoomNo() < 0) {
			return "redirect:/admin/qna";
		}
		
		//게시글 조회
		qnaView = sRoomService_admin.qnaView(qnaView);
		logger.debug("조회된 게시글 {}", qnaView);
		
		//모델값 전달
		model.addAttribute("qnaView", qnaView);
		
		return "/admin/qnaView";
	}
	
	@PostMapping("/admin/qna/view") //QnA 답변 등록
	public String insertqna(SroomQna sroomQna, Member member, HttpSession session, Model model ) {
		
		logger.info("/admin/qna/view [POST]");
		
		logger.info("{}", sroomQna);

		sroomQna.setMemberNo( (int) session.getAttribute("member_no") );
		
		//게시글 처리
		sRoomService_admin.writeqna(sroomQna);
		
		//목록으로 리다이렉트
		return "redirect:/admin/qna";
	}
	
	//예약 관리
	@GetMapping("/admin/reserve")
	public void reserve(
			@RequestParam(defaultValue = "0" ) int curPage
			, Model model) {
		
		logger.info("/admin/reserve [GET]");
		
		Paging paging = reserveService_admin.getPaging(curPage);
		logger.debug("{}", paging);
		model.addAttribute("paging", paging);
		
		List<HashMap<String, Object>> list = reserveDao_admin.selectHash(paging);
		System.out.println( list );
		
		model.addAttribute("list", list);

	}
	
	@RequestMapping("admin/reserve/view") //예약 상세보기
	public String view(Reservation res, Model model) {
		
		logger.info("/admin/reserve/view [GET]");
		
		List<HashMap<String, Object>> view = reserveService_admin.viewReserve(res);
		logger.debug("view", view);
		
		model.addAttribute("view", view);
		
		return "admin/reserveView";
	}
	
	@RequestMapping("/admin/reserve/search") //예약 검색
	public void search(@RequestParam(defaultValue="sroom_name") String search_option
			,@RequestParam(defaultValue="") String keyword, Model model) { //키워드 : 스터디룸명 
		logger.info("/admin/reserve/search [GET]");
		logger.info("{}", search_option);
		logger.info("{}", keyword);
		
		List<HashMap<String, Object>> resList = reserveService_admin.searchReserve(search_option);
		
		model.addAttribute("resList", resList);
	}

	
	//회원 정보
	@GetMapping("admin/member")
	public void memberList(
			@RequestParam(defaultValue = "0" ) int curPage
			, Model model) {
		
		logger.info("/admin/member [GET]");
		
		Paging paging = memberService_admin.getPaging(curPage);
		logger.debug("{}", paging);
		model.addAttribute("paging", paging);
		
		List<Member> list = memberService_admin.list(paging);
		for( Member m : list ) logger.info("{}", m);
		model.addAttribute("list", list);
		
	}
	
	@RequestMapping("admin/memberview")
	public void memberView() {
		
	}
	
	@RequestMapping("admin/update")
	public void update() {
		
	}
	
}
