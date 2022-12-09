package controller;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
		model.addAttribute("mntBoardlist", list);
		
		
	} 
	
//	조인으로 불러올 애들만 hash로 구현
	
	@RequestMapping("/view")
	public void view (
		 @RequestParam(defaultValue = "1") 
		 int curPage, HttpSession session, 
		 MntBoard viewBoard, int mntboardNo, Model model) {
		/* logger.info("/mntboard/view - {} ", viewBoard); */
		
		logger.info("mntboardNo : {}" , mntboardNo);
		// 글조회
		HashMap<String, Object> mntViewBoard = mntBoardService.view(viewBoard);
		/* logger.info("조회된 게시글 {}", mntViewBoard); */
		
		model.addAttribute("mntViewBoard", mntViewBoard);
		
		
		// 첨부파일
		FileUpload fileUpload = mntBoardService.getAttachFile(viewBoard);
		model.addAttribute("fileUpload", fileUpload);
		
	// -------------------------------------------------------------------------------	
		viewBoard.setMemberNo( (int)session.getAttribute("member_no") );

		CommtPaging commtPaging = mntBoardService.getCommtPaging(curPage, mntboardNo);
		model.addAttribute("commtPaging", commtPaging);
		 logger.debug("{}", commtPaging);
		 
		List<HashMap<String,Object>> commtList = mntBoardService.commtList(commtPaging, mntboardNo);
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
		System.out.println("로그인 : " + session.getAttribute("member_no")) ;
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
	 
	 
	 @RequestMapping("/commtPage")
		public void commtListPaging(int curPage, Model model, int mntboardNo ) {
			logger.info("댓글  게시글 {}", mntboardNo);
			logger.info("curpage - {} ", curPage);
			
			CommtPaging commtPaging = mntBoardService.getCommtPaging(curPage, mntboardNo);
			model.addAttribute("commtPaging", commtPaging);
			
			List<HashMap<String,Object>> commtList = mntBoardService.commtList(commtPaging, mntboardNo);
			logger.info("조회된 댓글 {}", commtList);
			model.addAttribute("commtList", commtList);
			
			// 댓글 수
			int CntCommt = mntBoardService.getCntCommt(mntboardNo);
			logger.info("!!!!!!!!!댓글 개수!!!!!!!!! : {}", CntCommt);
			model.addAttribute("CntCommt", CntCommt);
			
			mntBoardService.mntBoardCmt(mntboardNo);
		
			
		}
	 
	 // 댓글 등록
	  @PostMapping("/view")
	  public String CommtWrite( Commt commt, HttpSession session) {
		  logger.debug("{}", commt);
		  
		  // 임시 세션
		  session.setAttribute("member_no", 1); 
		  commt.setMemberNo( (int)session.getAttribute("member_no") ); 
		  logger.info("댓글등록 : {}", commt);
		  
		  mntBoardService.writeCommt(commt);
		  
		  return "redirect:/mntboard/view?mntboardNo=" + commt.getMntBoardNo();
	  }
	 
	  
	  // 미구현
	  @PostMapping("/updateCommt")
	  @ResponseBody
	  public String updateCommt(@RequestParam Map<String, Object> map,  HttpServletRequest req) {
		  try {
			  HttpSession session = req.getSession();
			  String no = session.getAttribute("member_no").toString();
			  int memberNo = Integer.parseInt(no);
			
			  logger.info("전송 완");
			  logger.info("댓글내용 : {}", map);
			  logger.info("멤버번호 : {}", memberNo);
			  
			  
			  Commt commt = new Commt();
			  commt.setCommtNo(Integer.parseInt(map.get("commt_no").toString()));
			  commt.setCommtContent(map.get("commt_content").toString());
			  commt.setMemberNo(memberNo);
			
	      	  mntBoardService.updateCommt(commt);
				
			 return "success";
		  }catch(Exception e) {
			  return "failed";
		  }
			
	  }
	  
	  
	  @GetMapping("/deleteCommt")
	  @ResponseBody
		public String deleteCommt(@RequestParam int commtNo) {
			try {
				logger.info("댓번호 : {}", commtNo);
				mntBoardService.deleteCommt(commtNo);
				return "success";
			
			}catch(Exception e) {
				return "failed";
			}
		}
	  
}








