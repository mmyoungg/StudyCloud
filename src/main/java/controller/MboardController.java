package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dto.FileUpload;
import dto.Mboard;
import dto.MboardLike;
import dto.Member;
import service.face.MboardService;
import util.Paging;

@Controller
public class MboardController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MboardService mboardService;
	
	@RequestMapping("/mboard/main")
	private void mboardmain(
			
			@RequestParam(defaultValue = "0") int curPage
			,Model model 
			
			) {
		
		Paging paging = mboardService.getPaging(curPage);
		logger.debug("{}", paging);
		model.addAttribute("paging", paging);
		
		List<HashMap<String, Object>> mlist = mboardService.selectMboardHash(paging);
		
		for( HashMap<String, Object> b : mlist ) 
			logger.debug("{}", b);
		
		model.addAttribute("mlist", mlist);
		
	}
	
	@RequestMapping("/mboard/detail")
	public void mboarddetail(
			
			String memberId
			,int mboardNo
			,Model model
//			,ModelAndView mav
			
			) {
		
		logger.debug("{}", mboardNo);
		
		//게시글 조회
		HashMap<String, Object > Mboarddetail= mboardService.detail(mboardNo);
		logger.debug("조회된 게시글 {}", Mboarddetail);
		
		//모델값 전달
		model.addAttribute("detailMboard", Mboarddetail);
		
		//첨부파일 모델값 전달
		List<HashMap<String, Object>> fileUpload = mboardService.getAttachFile(mboardNo);
		model.addAttribute("fileUpload", fileUpload);
		
		//좋아요 여부 데이터 가져오기
//		model.addAttribute("like", mboardService.findmboardlike(mboardNo, memberId);
//		model.addAttribute("getLike", mboardService.getmboardlike(mboardNo));
		
		return;
		
	}
	
	@GetMapping("/mboard/write")
	public void write() {}
	
	@PostMapping("/mboard/write")
	public String writeProcess(
			Member member,
			Mboard mboard,
			MultipartFile file,
			HttpSession session
			
			) {
		
		logger.debug("{}", mboard);
		logger.debug("{}", file);

//		작성자 정보
		member.setMemberNo( (int)session. getAttribute("memberNo"));
		
		mboardService.write(mboard, file);
		
		//번개게시판 메인으로 리다이렉트
		return "redirect:/mboard/main";
		
	}
	
	
	@GetMapping("/mboard/update")
	public void update(
			
			int mboardNo
			,Model model
			
			) {
		
		logger.info("{}" , mboardNo);
		//게시글 조회
		HashMap<String, Object> Mboarddetail = mboardService.detail(mboardNo);
		logger.debug("조회된 게시글 {}", Mboarddetail);
		
		//모델값 전달
		model.addAttribute("updateMboard", Mboarddetail);
		
		//첨부파일 모델값 전달
		List<HashMap<String, Object>> fileupload = mboardService.getAttachFile(mboardNo);
		model.addAttribute("fileupload", fileupload);
		
		
	}
	
	@PostMapping("/mboard/update")
	public String updateProcess(
			
			Mboard mboard
			,MultipartFile file
			,HttpSession session
			
			) {
		logger.debug("{}", mboard);
		logger.debug("{}", file);
		
		//작성자 정보
		mboard.setMemberNo( (int)session. getAttribute("member_no"));
		
		mboardService.update(mboard, file);
		
		return "redirect:/mboard/detail";
		
		
	}
	@RequestMapping("/mboard/download")
	public String download(
			
			FileUpload fileUpload
			, Model model
			
			) {
		logger.info("{}", fileUpload);
		
		//첨부파일 정보 객체
		fileUpload = mboardService.getFile(fileUpload);
		logger.debug("{}", fileUpload);
		
		//모델값 전달
		model.addAttribute("downFile", fileUpload);
		
		return "down";
		
	}
	
	@RequestMapping("/mboard/delete")
	public String delete(
			
			Mboard mboard
			
			) {
		logger.debug("{}", mboard);
		
		mboardService.delete(mboard);
		
		return "redirect:/mboard/main";
		
	}
	
	//------------------------------------------------------------------------
	
	//좋아요 등록
//	@Transactional(rollbackFor = Exception.class)
//	@PostMapping("/mboard/detail")
//	public ResponseEntity<String> mboardLike (
//			
//			@RequestBody MboardLike mboardLike
//			
//			) {
//		ResponseEntity<String> entity = null;
//		logger.info("좋아요");
//		
//		try {
//			mboardService.setMboardLike(mboardLike);
//			entity = new ResponseEntity<String>("success", HttpStatus.OK);
//		} catch (Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
//		}
//		
//		return entity;
//		
//	}
//	
	//좋아요 취소
//	@Transactional(rollbackFor = Exception.class)
//	@DeleteMapping("/mboard/detail")
//	public ResponseEntity<String> mboardLikeCancel (
//			
//			MboardLike mboardLike
//			
//			) {
//		
//		ResponseEntity<String> entity = null;
//		logger.info("좋아요 취소");
//		
//		try {
//			mboardService.setMboardLike(mboardLike);
//			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
//		} catch (Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
//		}
//		
//		return entity;
//		
//	}
//	

	
	
	
	
	
	

}
