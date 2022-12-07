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
import org.springframework.web.servlet.ModelAndView;

import dto.Commt;
import dto.FileUpload;
import dto.MntBoard;
import service.face.MntBoardService;
import util.CommtPaging;
import util.Paging;

@Controller
@RequestMapping("/mntboard")
public class MntBoardController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MntBoardService mntBoardService;
	/* @Autowired MntCommtService mntCommtService; */
	
	
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
	
	@RequestMapping("/listPaging")
	public void mntBoardListPaging(int curPage, Model model ) { 
		
		logger.info("curpage - {} ", curPage);
		
		Paging paging = mntBoardService.getPaging(curPage);
		model.addAttribute("paging", paging);  
		
		List<HashMap<String,Object>> list = mntBoardService.list(paging);
		for( HashMap<String, Object> b : list )	logger.debug("{}", b);
		model.addAttribute("mntBoardlist", list);
		
	} 
	
//	조인으로 불러올 애들만 hash로 구현
	
	@RequestMapping("/view")
	public void view (
		 @RequestParam(defaultValue = "0") int curPage, HttpSession session 
		 								, MntBoard viewBoard, Model model) {
		/* logger.info("/mntboard/view - {} ", viewBoard); */
		
		// 글조회
		HashMap<String, Object> mntViewBoard = mntBoardService.view(viewBoard);
		/* logger.info("조회된 게시글 {}", mntViewBoard); */
		
		model.addAttribute("mntViewBoard", mntViewBoard);
		
		
		// 첨부파일
		FileUpload fileUpload = mntBoardService.getAttachFile(viewBoard);
		model.addAttribute("fileUpload", fileUpload);
		
	// -------------------------------------------------------------------------------	

		// 댓글
//		session.setAttribute("login", true); 
//		session.setAttribute("member_no", 1); 
//		session.setAttribute("member_nick", "nick"); 
//		
//		 CommtPaging commtPaging = mntBoardService.getCommtPaging(curPage);
//		 model.addAttribute("commtPaging", commtPaging);
//		logger.debug("{}", commtPaging);
//		
//		
//		List<HashMap<String,Object>> commtList = mntBoardService.commtList(commtPaging);
//		for( HashMap<String, Object> c : commtList )	logger.debug(" c : {}", c);
//		logger.info("조회된 댓글 {}", commtList);
//		model.addAttribute("commtList", commtList);
		
	}
	
	
	@RequestMapping("/commtPaging")
	public void commtListPaging(Commt viewBoard, int curPage, Model model) {
		logger.info("댓글  게시글 {}", viewBoard.getMntBoardNo());
		logger.info("curpage - {} ", curPage);

		CommtPaging commtPaging = mntBoardService.getCommtPaging(curPage, viewBoard);
		model.addAttribute("commtPaging", commtPaging);

		List<HashMap<String,Object>> commtList = mntBoardService.commtList(commtPaging, viewBoard);
		for( HashMap<String, Object> c : commtList )	logger.debug(" c : {}", c);
		logger.info("조회된 댓글 {}", commtList);
		model.addAttribute("commtList", commtList);
	}


	
	@GetMapping("/write")
	public void write() {}
	
	
	@PostMapping("/write")
	public String writePost(MntBoard mntBoard, MultipartFile file, HttpSession session) {
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
	
	@RequestMapping("/download")
	public String download(FileUpload fileUpload, Model model) {
		
		fileUpload = mntBoardService.getFile(fileUpload);
		logger.debug("{}", fileUpload);
		
		model.addAttribute("downFile", fileUpload);
		
		return "down";
		
	}
	
	
	@GetMapping("/update")
	public void update(MntBoard mntBoard, Model model) {
		logger.debug("{}", mntBoard);
		
		HashMap<String, Object> mntViewBoard = mntBoardService.view(mntBoard);
		logger.debug("업데이트할 게시글 조회 {}", mntViewBoard);
		
		model.addAttribute("updateBoard", mntViewBoard);
	
		FileUpload fileUpload = mntBoardService.getAttachFile(mntBoard);
		model.addAttribute("fileUpload", fileUpload);
		
	}
	
	
	 @PostMapping("/update") 
	 public String updatePost(MntBoard mntBoard, MultipartFile file, HttpSession session) { 
		 logger.debug("{}", mntBoard);
	  
		 mntBoardService.update(mntBoard, file);
	  
		 return "redirect:/mntboard/view?mntboardNo=" + mntBoard.getMntboardNo();
	  }
	 
	 
	 
	 @RequestMapping("/delete")
	 public String delete(MntBoard mntBoard) {
		 
		 mntBoardService.delete(mntBoard);
		 
		return "redirect:/mntboard/list";
		 
	 }
	 
	 
	 
	 
	 // 댓글 등록
	  @PostMapping("/view")
	  public String CommtWrite( Commt commt, HttpSession session) {
		  logger.debug("{}", commt);
		  
		  // 임시 세션
		  commt.setMemberNo( (int)session.getAttribute("member_no") );
		  logger.info("댓글등록 : {}", commt);
		  
		  mntBoardService.writeCommt(commt);
		  
		  return "redirect:/mntboard/view?mntboardNo=" + commt.getMntBoardNo();
	  }
	 
	 
		/*
		 * // 댓글 수정
		 * 
		 * @GetMapping("/view") public void updateCommt(Commt commt, Model model) {
		 * logger.debug("Commt : {}", commt);
		 * 
		 * List<HashMap<String,Object>> commtList = mntCommtService.commtList(commt);
		 * logger.info("수정된 댓글 {}", commtList);
		 * 
		 * model.addAttribute("updateCommt", commtList); }
		 */
	  
	 
	 
	 
	 
	 
	 
}








