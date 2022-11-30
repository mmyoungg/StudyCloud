package controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dto.Mboard;
import service.face.MboardService;
import util.Paging;

@Controller
public class MboardController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MboardService mboardService;
	
	@RequestMapping(value="/mboard/mboardmain")
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
		
		logger.info("mboardmain 호출 완");
		
		return;
		
	}
	
	@RequestMapping(value = "/mboard/mboarddetail")
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
		
		
		return "mboard/mboarddetail";
	}
	
	@RequestMapping(value = "/mboard/mboardwrite", method = RequestMethod.GET)
	public void mboardwrite() {
		
		logger.info("mboardwirte 호출 완");
		
		return;
	}
	
	
	
	
	

}
