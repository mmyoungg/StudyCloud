package controller;

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

import dto.ApplyMt;
import dto.Member;
import dto.StudyBoard;
import dto.StudyRoom;
import service.face.admin.ApplyMtService_admin;
import service.face.admin.SboardService_admin;
import service.face.admin.SroomService_admin;
import util.Paging;

@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired SroomService_admin sRoomService_admin;
	@Autowired ApplyMtService_admin applyMtService_admin;
	@Autowired SboardService_admin sBoardService_admin;
	
	@GetMapping("/admin/main")
	public void admin() {
		logger.info("/admin/mento [GET]");
		
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
		for( ApplyMt a : list ) logger.debug("{}", a);
		model.addAttribute("list", list);
		
	}
	
	@PostMapping("/admin/mento")
	public String mento (Member member) {
		logger.info("/admin/mento [POST]");
		
		//회원권한 변경
		applyMtService_admin.updateMember(member);
		
		return "redirect:/admin/mento";
	}
	
	//view
	@GetMapping("/admin/mento/view")
	public String mentoView(ApplyMt applyMt, Model model) {
		logger.info("/admin/mento/view [GET]");
		logger.debug("{}", applyMt);
		
		//신청서 조회
		applyMt = applyMtService_admin.view(applyMt);
		logger.debug("조회된 신청서 {}", applyMt);
		
		//모델값 전달
		model.addAttribute("applyMt", applyMt);
		
		return "redirect: /admin/mento/view";
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

	//스터디룸 등록
	@GetMapping("/admin/studyroom")
	public void studyroom(
			@RequestParam(defaultValue = "0" ) int curPage
			, Model model ) {
		
		logger.info("/admin/studyroom [GET]");

		Paging paging = sRoomService_admin.getPaging(curPage);
		logger.debug("{}", paging);
		model.addAttribute("paging", paging);
		
		List<StudyRoom> list = sRoomService_admin.list(paging);
		for( StudyRoom s : list ) logger.debug("{}", s);
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
	
	@RequestMapping("/admin/qna")
	public void qna() {
		
	}
	
	@RequestMapping("/admin/reserve")
	public void reserve() {
		
	}
	
	@RequestMapping("admin/reserveView")
	public void view() {
		
	}
	
	@RequestMapping("admin/member")
	public void memberList() {
		
	}
	
	@RequestMapping("admin/memberview")
	public void memberView() {
		
	}
	
	@RequestMapping("admin/update")
	public void update() {
		
	}
	
}
