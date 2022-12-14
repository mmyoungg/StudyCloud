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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dto.ApplyMnt;
import dto.ApplyMt;
import dto.FileUpload;
import dto.Member;
import dto.MtBoard;
import service.face.MemberService;
import service.face.MtBoardService;
import util.Paging;


@Controller
public class MtBoardController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MtBoardService mtBoardService;
	@Autowired private MemberService memberService;
	
	@RequestMapping("/mtboard/list")
	public void mtBoardList(
			@RequestParam(defaultValue = "0") int curPage, HttpSession session
			, Model model ) {
		
		Paging paging = mtBoardService.getPaging(curPage);
		model.addAttribute("paging", paging);
		logger.debug("paging : {} ", paging);
		
		List<HashMap<String,Object>> list = mtBoardService.list(paging);
		for( HashMap<String, Object> b : list )	logger.debug("{}", b);
		model.addAttribute("mtBoardlist", list);
	}
	
	@RequestMapping("/mtboard/listPaging")
	public void mtBoardListPaging(int curPage, Model model ) { 
		
		logger.info("curpage - {} ", curPage);
		
		Paging paging = mtBoardService.getPaging(curPage);
		model.addAttribute("paging", paging);  
		
		List<HashMap<String,Object>> list = mtBoardService.list(paging);
		model.addAttribute("mtBoardlist", list);
		model.addAttribute("mtBoardlist", list);
		
		
	} 
	
	
	@RequestMapping("/mtboard/detail")
	public void view (
		 @RequestParam(defaultValue = "1") 
		 int curPage, HttpSession session, 
		 MtBoard viewBoard, int mtboardNo, Model model) {
		/* logger.info("/mtboard/view - {} ", viewBoard); */
		
		logger.info("mtboardNo : {}" , mtboardNo);
		// 글조회
		HashMap<String, Object> mtViewBoard = mtBoardService.view(viewBoard);
		/* logger.info("조회된 게시글 {}", mtViewBoard); */
		
		model.addAttribute("mtViewBoard", mtViewBoard);
		
		  // 첨부파일 
		FileUpload fileUpload = mtBoardService.getAttachFile(viewBoard);
		model.addAttribute("fileUpload", fileUpload);
		 
		
	// -------------------------------------------------------------------------------	
	
	  // 후기
	//  viewBoard.setMemberNo( (int)session.getAttribute("member_no") );
	  
	//  CommtPaging reviewPaging = mtBoardService.getCommtPaging(curPage, mtboardNo);
	//  model.addAttribute("reviewPaging", reviewPaging); logger.debug("{}",reviewPaging);
	  
	//  List<HashMap<String,Object>> reviewList = mtBoardService.reviewList(reviewPaging, mtboardNo); 
	 // for( HashMap<String,Object> c : reviewList ) logger.debug(" c : {}", c); 
	//  logger.info("조회된 후기 {}", reviewList); 
	//  model.addAttribute("reviewList", reviewList);
	 
		
	}
	
	@GetMapping("/mtboard/write")
	public void write() {}
	
	// 멘토 (권한번호 2만 글쓰기가능)
	 @PostMapping("/write") 
	 public String writePost( MtBoard mtBoard, MultipartFile file, HttpSession session) { 
		  	logger.debug("{}", mtBoard); 
	  		logger.debug("{}", file);
	  
	  
	  //작성자 정보 추가 
	  // 구현 예정 ( 로그인 세션 ) 
	  mtBoard.setMemberNo( (int)session.getAttribute("member_no") ); 
	  System.out.println("로그인 : " + session.getAttribute("member_no")) ; 
	  logger.debug("{}", mtBoard);
	  logger.debug("파일 : {}", file);
	  
	  // 게시글, 첨부파일 
	  mtBoardService.write(mtBoard, file);
	  
	  return "redirect:/mtboard/list";
	  
	  }
	 
	 
	 @RequestMapping("/mtboard/download")
		public String download(FileUpload fileUpload, Model model) {
			
			fileUpload = mtBoardService.getFile(fileUpload);
			logger.debug("{}", fileUpload);
			
			model.addAttribute("downFile", fileUpload);
			
			return "down";
			
		}
	
	
	
	
	 @GetMapping("/mtboard/update")
		public void update(MtBoard mtBoard, Model model) {
			logger.debug("{}", mtBoard);
			
			HashMap<String, Object> mtViewBoard = mtBoardService.view(mtBoard);
			logger.debug("업데이트할 게시글 조회 {}", mtViewBoard);
			
			model.addAttribute("updateBoard", mtViewBoard);
		
			FileUpload fileUpload = mtBoardService.getAttachFile(mtBoard);
			model.addAttribute("fileUpload", fileUpload);
			
		}
		
		
		 @PostMapping("/mtboard/update") 
		 public String updatePost(MtBoard mtBoard, MultipartFile file, HttpSession session) { 
			 logger.debug("{}", mtBoard);
		  
			 mtBoardService.update(mtBoard, file);
		  
			 return "redirect:/mtboard/detail?mtboardNo=" + mtBoard.getMtboardNo();
		  }
		 
	
	 @RequestMapping("/mtboard/delete")
	 public String delete(MtBoard mtBoard) {
			 
		 mtBoardService.delete(mtBoard);
			 
		return "redirect:/mtboard/list";
			 
	 }
	
	 
	 // 후기
		/*
		 * @RequestMapping("/mtboard/reviewPaging") public void commtListPaging(int
		 * curPage, Model model, int mtboardNo ) { logger.info("댓글  게시글 {}", mtboardNo);
		 * logger.info("curpage - {} ", curPage);
		 * 
		 * CommtPaging reviewPaging = mtBoardService.getCommtPaging(curPage, mtboardNo);
		 * model.addAttribute("reviewPaging", reviewPaging);
		 * 
		 * List<HashMap<String,Object>> reviewList =
		 * mtBoardService.reviewList(reviewPaging, mtboardNo); logger.info("조회된 후기 {}",
		 * reviewList); model.addAttribute("reviewList", reviewList);
		 * 
		 * // 리뷰 수 int CntReview = mtBoardService.getCntReview(mtboardNo);
		 * logger.info("!!!!!!!!!후기 개수!!!!!!!!! : {}", CntReview);
		 * model.addAttribute("CntReview", CntReview);
		 * 
		 * mtBoardService.mtBoardRvw(mtboardNo);
			}
		
		 */
			
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 // 멘토지원
	
	 @RequestMapping("/mtboard/mentoApply")
		public void mentoApply() {}
	
		 
		 
	 @GetMapping("/mtboard/applyMt")
		public void applyMt() {}
		 
	 @PostMapping("/mtboard/applyMt")
		public String applyMtPost(ApplyMt applyMt, HttpSession session) {
		 logger.debug("{}", applyMt);
			 
		 applyMt.setMemberNo( (int)session.getAttribute("member_no") ); 
		System.out.println("로그인 : " + session.getAttribute("member_no")) ; 
				
		mtBoardService.applyMt(applyMt);
				
		return "redirect:/mtboard/list";
			
			}
	
	 
	 
	 
	 @GetMapping("/mtboard/applyMnt")
		public void applyMnt() {}
	
	 @PostMapping("/mtboard/applyMnt")
		public String applyMntPost(ApplyMnt applyMnt, HttpSession session, Model model) {
		 logger.debug("{}", applyMnt);
			 
//		applyMnt.setMemberNo( (int)session.getAttribute("member_no") ); 
//		System.out.println("로그인 : " + session.getAttribute("member_no")) ; 
//				
		 int member_no = (int) session.getAttribute("member_no");
			Member member = new Member();
			member.setMemberNo(member_no);
			member = memberService.memberInfoByNo(member);
			
			logger.info("!!!!!!!!!!!!member!!!!!!!!!! : {} ", member);

			model.addAttribute("member", member);
			
		mtBoardService.applyMnt(applyMnt);
				
		 return "redirect:/mntboard/detail?mtboardNo=" + applyMnt.getMtboardNo();
			
			}
	
	//      넘겨주는거 해야됨
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/mtboard/pay_info", method = RequestMethod.GET)
	public void pay_info() {
		
		/* logger.info("/mtboard/mentoApply [GET]성공"); */
	}
	
}
