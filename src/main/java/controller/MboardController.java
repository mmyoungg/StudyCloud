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

import dto.FileUpload;
import dto.Mboard;
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
		
		List<Mboard> list = mboardService.list(paging);
		for( Mboard m : list ) logger.debug("{}", m);
		model.addAttribute("list", list);
		
	}
	
	@RequestMapping("/mboard/detail")
	public String mboarddetail(
		
			Mboard detailMboard
			, Model model
			
			) {
		
		logger.debug("{}", detailMboard);
		
		//잘못된 게시글 번호 처리
		if( detailMboard.getMboardNo() < 0 ) {
			return "redirect:/mboard/mboarddetail";
			
		}
		
		//게시글 조회
		detailMboard = mboardService.detail(detailMboard);
		logger.debug("조회된 게시글 {}", detailMboard);
		
		//모델값 전달
		model.addAttribute("detailMboard", detailMboard);
		
		//첨부파일 모델값 전달
		FileUpload fileUpload = mboardService.getAttachFile(detailMboard);
		model.addAttribute("fileUpload", fileUpload);
		
		return "mboard/mboarddetail";
	}
	
	@GetMapping("/mboard/write")
	public void mboardwrite() {}
	
	@PostMapping("/mboard/write")
	public String writeProcess(
			
			Mboard mboard,
			MultipartFile file,
			HttpSession session
			
			) {
		
		logger.debug("{}", mboard);
		logger.debug("{}", file);

		//작성자 정보
		mboard.setMemberNo( (int)session. getAttribute("member_no"));
		
		mboardService.write(mboard, file);
		
		//번개게시판 메인으로 리다이렉트
		return "redirect:/mboard/mboardmain";
		
	}
	
//	@RequestMapping("/")
	
	
	
	
	
	

}
