package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
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
import org.springframework.web.servlet.ModelAndView;

import dto.ApplyMnt;
import dto.ApplyMt;
import dto.FileUpload;
import dto.MtBoard;
import dto.MtMark;
import service.face.MtBoardService;
import util.CommtPaging;
import util.PagingVUp;


@Controller
@RequestMapping("/mtboard")
public class MtBoardController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MtBoardService mtBoardService;
	@Autowired ServletContext context;
	
	@RequestMapping("/list")
	public void mtBoardList(
			@RequestParam(defaultValue = "1") int curPage, HttpSession session
			, Model model ) {
		
		session.setAttribute("login", true); 
		session.setAttribute("member_no", 1); 
		session.setAttribute("member_nick", "nick");
		
		Map<String, Object> map = new HashMap<>();
		
		PagingVUp paging = mtBoardService.getPaging(map, curPage);
		model.addAttribute("paging", paging);
		logger.debug("paging : {} ", paging);
		
		List<HashMap<String,Object>> list = mtBoardService.list(paging);
		for( HashMap<String, Object> b : list )	logger.debug("{}", b);
		model.addAttribute("mtBoardlist", list);
	}
	
	@RequestMapping("/listPaging")
	public void mtBoardListPaging(@RequestParam Map<String, Object> map, Model model ) { 
		
		int curPage = Integer.parseInt(map.get("curPage").toString()); 
		PagingVUp paging = mtBoardService.getPaging(map, curPage);
		model.addAttribute("paging", paging);  
		
		map.put("startNo",paging.getStartNo());
		map.put("endNo",paging.getEndNo());
		map.put("paging",paging);
		
		logger.info("map - {} ", map);
		
		List<HashMap<String,Object>> list = mtBoardService.list(map);
		model.addAttribute("mtBoardlist", list);
		logger.info("list - {} ", list);
		
		
	} 
	
	
	@RequestMapping("/detail")
	public void view (
		 @RequestParam(defaultValue = "1") 
		 int curPage, HttpSession session, Model model,
		 @RequestParam(required = true)
		 int mtboardNo ) {
		
		logger.info("mtboardNo : {}" , mtboardNo);
		
		// 글조회
		HashMap<String, Object> mtViewBoard = mtBoardService.view(mtboardNo);
		/* logger.info("조회된 게시글 {}", mtViewBoard); */
		
		model.addAttribute("mtViewBoard", mtViewBoard);
		
		  // 첨부파일 
		FileUpload fileUpload = mtBoardService.getAttachFile(mtboardNo);
		model.addAttribute("fileUpload", fileUpload);
		logger.info("fileUpload : {}" , fileUpload);
		
	// -------------------------------------------------------------------------------	
	
		
		// ----------- 찜하기 -----------
		
		MtMark mtMark = new MtMark();
		mtMark.setMemberNo( (int)session.getAttribute("member_no") );
		// 찜하기 모델값 
		model.addAttribute("mark", mtBoardService.mark(mtMark));
		// 찜하기 수 모델값
		model.addAttribute("likeMark", mtBoardService.getTotalCntMark(mtMark));
				
	}
	
	@GetMapping("/write")
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
	 
	 
	 @RequestMapping("/download")
		public String download(FileUpload fileUpload, Model model) {
			
			fileUpload = mtBoardService.getFile(fileUpload);
			logger.debug("{}", fileUpload);
			
			model.addAttribute("downFile", fileUpload);
			
			return "down";
			
		}
	
	
	
	
	 @GetMapping("/update")
		public void update(@RequestParam(required = true) int mtboardNo, Model model) {
			logger.debug("{}", mtboardNo);
			
			HashMap<String, Object> mtViewBoard = mtBoardService.view(mtboardNo);
			logger.debug("업데이트할 게시글 조회 {}", mtViewBoard);
			
			model.addAttribute("updateBoard", mtViewBoard);
		
			FileUpload fileUpload = mtBoardService.getAttachFile(mtboardNo);
			model.addAttribute("fileUpload", fileUpload);
			
		}
		
		
		 @PostMapping("/update") 
		 public String updatePost(MtBoard mtBoard, MultipartFile file, HttpSession session) { 
			 logger.debug("{}", mtBoard);
		  
			 mtBoardService.update(mtBoard, file);
		  
			 return "redirect:/mtboard/detail?mtboardNo=" + mtBoard.getMtboardNo();
		  }
		 
	
	 @RequestMapping("/delete")
	 public String delete(MtBoard mtBoard) {
			 
		 mtBoardService.delete(mtBoard);
			 
		return "redirect:/mtboard/list";
			 
	 }
	
	 
	// ------------------------ 찜하기 ---------------------
	@RequestMapping("/like")
	public ModelAndView Like( MtMark mtMark, ModelAndView mav, HttpSession session) {
			
	// 찜하기 하트
		mtMark.setMemberNo((int)session.getAttribute("member_no"));
			  
			  
			  boolean result = mtBoardService.mtboardMark(mtMark);
			  
			  // 찜하기 수 조회
			  int markCnt = mtBoardService.getTotalCntMark(mtMark);
			  
			  mav.addObject("result", result);
			  mav.addObject("markCnt", markCnt);
			  
			  mav.setViewName("jsonView");
			  
			  
			  return mav;
			  
		  }
	 
	 
	 
	// ------------------------ 검색 --------------------------
	  
    @PostMapping("/search")
	public String mtSearch(Model model, 
			@RequestParam(value="searcharr[]") List<String> searcharr
			, String searchKeyword, @RequestParam(defaultValue="1") int curPage) {
		
    	logger.info("searcharr : {}", searcharr);
		logger.info("searchKeyword : {}", searchKeyword);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", searcharr); // 체크박스 값 담긴 List
		map.put("keyword", searchKeyword); // 검색 키워드
		map.put("curPage", curPage); // 페이징처리를 위한 현재페이지
    	
		CommtPaging paging = mtBoardService.getSearchPaging(map);
		
		
    	List<HashMap<String, Object>> list = mtBoardService.getSearchList(map);
		model.addAttribute("paging", paging);
		
		map.get("searchKeyword");
		logger.info("검색 결과 : {} ", list);
		model.addAttribute("mtSearchList", list);
		model.addAttribute("Keyword", list);
		
		
		
    	return "/mtboard/searchPaging";
	}
	 
	 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	 
//	 // 멘토지원
//	
//	 @RequestMapping("/mtboard/mentoApply")
//		public void mentoApply() {}
//	
//		 
//		 
//	 @GetMapping("/mtboard/applyMt")
//		public void applyMt() {}
//		 
//	 @PostMapping("/mtboard/applyMt")
//		public String applyMtPost(ApplyMt applyMt, HttpSession session) {
//		 logger.debug("{}", applyMt);
//			 
//		 applyMt.setMemberNo( (int)session.getAttribute("member_no") ); 
//		System.out.println("로그인 : " + session.getAttribute("member_no")) ; 
//				
//		mtBoardService.applyMt(applyMt);
//				
//		return "redirect:/mtboard/list";
//			
//			}
//	
//	 
//	 
//	 
//	 @GetMapping("/mtboard/applyMnt")
//		public void applyMnt() {}
//	
//	 @PostMapping("/mtboard/applyMnt")
//		public String applyMntPost(ApplyMnt applyMnt, HttpSession session, Model model) {
//		 logger.debug("{}", applyMnt);
//			 
////		applyMnt.setMemberNo( (int)session.getAttribute("member_no") ); 
////		System.out.println("로그인 : " + session.getAttribute("member_no")) ; 
////				
//		 int member_no = (int) session.getAttribute("member_no");
//			Member member = new Member();
//			member.setMemberNo(member_no);
//			/* member = memberService.memberInfoByNo(member); */
//			
//			logger.info("!!!!!!!!!!!!member!!!!!!!!!! : {} ", member);
//
//			model.addAttribute("member", member);
//			
//		mtBoardService.applyMnt(applyMnt);
//				
//		 return "redirect://detail?mtboardNo=" + applyMnt.getMtboardNo();
//			
//			}
//	
//	//      넘겨주는거 해야됨
//	
//	
//	
	
	
	
	
	
	
	
	@RequestMapping(value="/mtboard/pay_info", method = RequestMethod.GET)
	public void pay_info() {
		
		/* logger.info("/mtboard/mentoApply [GET]성공"); */
	}
	
}
