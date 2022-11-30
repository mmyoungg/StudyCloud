package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dto.FileUpload;
import dto.FreeBoard;
import service.face.FreeBoardService;
import util.Paging;

@Controller
public class FreeBoardController {
	
	private Logger logger = LoggerFactory.getLogger(FreeBoardController.class);
	
	@Autowired FreeBoardService freeBoardService;
	
	@RequestMapping("/freeBoard/list")
	public void list(Model model, @RequestParam(defaultValue="0") int curPage, HttpSession session) {
		
		logger.info("/FreeBoard/list [GET]");
		
		// 추후 Login기능 구현 시 삭제 // 
		session.setAttribute("login", true); 
		session.setAttribute("member_no", 1); 
		session.setAttribute("member_nick", "nick"); 
		
		Paging paging = freeBoardService.getPaging(curPage);
		model.addAttribute("paging", paging);
		
		List<HashMap<String, Object>> list = freeBoardService.getList(paging);
		for( HashMap<String, Object> board : list )	logger.info("{}", board );
		model.addAttribute("fBoardList", list);
		
	}
	
	@RequestMapping("/freeBoard/view")
	public void view(int fBoardNo, Model model) {
		logger.info("/freeBoard/view [GET], 전달게시글 번호 : {}", fBoardNo);
		
		HashMap<String, Object> freeBoardView = freeBoardService.view(fBoardNo);
//		FreeBoard freeBoardView = freeBoardService.view(fBoard_no);
		logger.info("boardView : {}", freeBoardView);
		
		model.addAttribute("fBoardView", freeBoardView);
		
		FileUpload fileupload = freeBoardService.getAttachFile(fBoardNo);
		model.addAttribute("fileUpload", fileupload);
	}
	
	@RequestMapping(value="/freeBoard/write", method=RequestMethod.GET)
	public void write() {}
	
	@RequestMapping(value="/freeBoard/write", method=RequestMethod.POST)
	public String fBoardWriteProc(FreeBoard freeBoard, MultipartFile fBoardFile, HttpSession session) {
		logger.info("/freeBoard/write [POST], 파라미터 : {}", freeBoard);
		
		freeBoard.setMemberNo( (int)session.getAttribute("member_no") );
		
		freeBoardService.write(freeBoard, fBoardFile);
		return "redirect:/freeBoard/list";
	}
	
}
