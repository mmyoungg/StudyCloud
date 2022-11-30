package controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import dto.StudyRoom;
import service.face.admin.SroomService_admin;

@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired SroomService_admin sRoomService_admin;
	
	@RequestMapping("/admin/main")
	public void admin() {
		
	}
	
	@RequestMapping("/admin/mento")
	public void mento() {
		
	}
	
	@RequestMapping("/admin/qna")
	public void qna() {
		
	}
	
	@RequestMapping("/admin/study")
	public void study() {
		
	}
	
	//스터디룸
	@GetMapping("/admin/studyroom")
	public void studyroom() {
		logger.info("/admin/studyroom 호출");
	}
	
	@GetMapping("/admin/sRoominsert")
	public void insert() {
		logger.info("/admin/sRoominsert 호출");
	}
	
	@PostMapping("/admin/sRoominsert")
	public String insertProc(StudyRoom studyroom, MultipartFile file, HttpSession session) {
		
		logger.info("{}", studyroom);
		logger.info("{}", file);
		
		//게시글, 첨부파일 처리
		sRoomService_admin.write(studyroom, file);
		
		//목록으로 리다이렉트
		return "redirect:/admin/studyroom";
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
