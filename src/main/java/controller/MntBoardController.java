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

import dto.FileUpload;
import dto.MntBoard;
import service.face.MntBoardService;
import util.Paging;

@Controller
@RequestMapping("/mntboard")
public class MntBoardController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MntBoardService mntBoardService;
	
	@RequestMapping("/list")
	public void mntBoardList(
			@RequestParam(defaultValue = "0") int curPage, HttpSession session
			, Model model ) { 
		
		session.setAttribute("login", true); 
		session.setAttribute("member_no", 1); 
		session.setAttribute("member_nick", "nick"); 
		
		Paging paging = mntBoardService.getPaging(curPage);
		model.addAttribute("paging", paging);  
		logger.debug("{}", paging);
		
		List<HashMap<String,Object>> list = mntBoardService.list(paging);
		for( HashMap<String, Object> b : list )	logger.debug("{}", b);
		model.addAttribute("mntBoardlist", list);
		
	} 
	
//	조인으로 불러올 애들만 hash로 구현
	
	@RequestMapping("/view")
	public void mntBoardView (MntBoard viewBoard, Model model){
		logger.info("/mntboard/view - {} ", viewBoard);
		
		// 글조회
		HashMap<String, Object> mntViewBoard = mntBoardService.view(viewBoard);
		logger.info("조회된 게시글 {}", mntViewBoard);
		
		model.addAttribute("mntViewBoard", mntViewBoard);
		
		
		// 첨부파일
		FileUpload fileUpload = mntBoardService.getAttachFile(viewBoard);
		model.addAttribute("fileUpload", fileUpload);
		
	}
	
	
	@GetMapping("/write")
	public void write() {}
	
	
	@PostMapping("/write")
	public String writePost(MntBoard mntBoard, MultipartFile file, HttpSession session ) {
		logger.debug("{}", mntBoard);
		logger.debug("{}", file);
		
		
		 //작성자 정보 추가
		// 구현 예정 ( 로그인 세션 )
		mntBoard.setMemberNo( (int)session.getAttribute("member_no") );
		logger.debug("{}", mntBoard);
		logger.debug("{}", file);
		
		// 게시글, 첨부파일
		mntBoardService.write(mntBoard, file);
		
		return "redirect:/mntboard/list";
		
	}
	
	
	

}










