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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dto.FileUpload;
import dto.Mboard;
import dto.MboardLike;
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
	public String mboarddetail(
		
			Mboard detailMboard,
//			int mboardNo
			 Model model
			
			) {
		
		logger.debug("{}", detailMboard);
		
		//잘못된 게시글 번호 처리
		if( detailMboard.getMboardNo() < 0 ) {
			return "redirect:/mboard/detail";
			
		}
		
		//게시글 조회
		HashMap<String, Object > detailmboard = mboardService.detail(detailMboard);
		logger.debug("조회된 게시글 {}", detailMboard);
		
		//모델값 전달
		model.addAttribute("detailMboard", detailMboard);
		
		//첨부파일 모델값 전달
		FileUpload fileUpload = mboardService.getAttachFile(detailMboard);
		model.addAttribute("fileUpload", fileUpload);
		
		return "mboard/detail";
	}
	
	@GetMapping("/mboard/write")
	public void write() {}
	
	@PostMapping("/mboard/write")
	public String writeProcess(
			
			Mboard mboard,
			int memberNo,
			MultipartFile file,
			HttpSession session
			
			) {
		
		logger.debug("{}", mboard);
		logger.debug("{}", file);

		//작성자 정보
		mboard.setMemberNo( (int)session. getAttribute("memberNo"));
		logger.debug("{}", mboard);
		
		mboardService.write(mboard, file);
		
		//번개게시판 메인으로 리다이렉트
		return "redirect:/mboard/main";
		
	}
	
	@RequestMapping("/mboard/download")
	public String download(
			FileUpload fileUpload
			, Model model
			) {
		
		//첨부파일 정보 객체
		fileUpload = mboardService.getFile(fileUpload);
		logger.debug("{}", fileUpload);
		
		//모델값 전달
		model.addAttribute("downFile", fileUpload);
		
		return "down";
		
	}
	
	@GetMapping("/mboard/update")
	public String update(
			
			Mboard mboard
			,Model model
			
			) {
		
		//게시글 조회
		HashMap<String, Object> detailMboard = mboardService.detail(mboard);
		logger.debug("조회된 게시글 {}", mboard);
		
		//모델값 전달
		model.addAttribute("updateMboard", mboard);
		
		//첨부파일 모델값 전달
		FileUpload fileupload = mboardService.getAttachFile(mboard);
		model.addAttribute("fileupload", fileupload);
		
		return "/mboard/update?boardNo=" + mboard.getMboardNo();
		
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
		
		return "/mboard/update?boardNo=" + mboard.getMboardNo();
		
		
	}
	
	@RequestMapping("/mboard/delete")
	public String delete(
			
			Mboard mboard
			
			) {
		logger.debug("{}", mboard);
		
		
		mboardService.delete(mboard);
		
		return "redirect:/mboard/main";
		
	}
	
	
	//좋아요 기능 시작
	@Transactional(rollbackFor = Exception.class)
	@PostMapping("/mboard/detail")
	public ResponseEntity<String> mboardlike (
			
			@RequestBody MboardLike mboardLike
			
			) {
		ResponseEntity<String> entity = null;
		
		try {
			mboardService.setMboardLike(mboardLike);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>("fail", HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	

	
	
	
	
	
	

}
