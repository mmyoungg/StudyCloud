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

import service.face.MtBoardService;
import util.Paging;


@Controller
@RequestMapping("/mtboard")
public class MtBoardController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MtBoardService mtBoardService;
	
	
	@RequestMapping("/list")
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
	
	@RequestMapping("/listPaging")
	public void mntBoardListPaging(int curPage, Model model ) { 
		
		logger.info("curpage - {} ", curPage);
		
		Paging paging = mtBoardService.getPaging(curPage);
		model.addAttribute("paging", paging);  
		
		List<HashMap<String,Object>> list = mtBoardService.list(paging);
		model.addAttribute("mntBoardlist", list);
		model.addAttribute("mtBoardlist", list);
		
		
	} 
	
	
	
	
	
	
	@RequestMapping(value="/mtboard/write", method = RequestMethod.GET)
	public void mtBoardWrite() {
		/*
		 * logger.info("/mtboard/list [GET]성공");
		 */
	}
	
	@RequestMapping(value="/mtboard/update", method = RequestMethod.GET)
	public void mtBoardUpdate() {
		/*
		 * logger.info("/mtboard/list [GET]성공");
		 */
	}
	
	@RequestMapping(value="/mtboard/delete", method = RequestMethod.GET)
	public void mtBoardDelete() {
		/*
		 * logger.info("/mtboard/list [GET]성공");
		 */
	}

	@RequestMapping(value="/mtboard/detail", method = RequestMethod.GET)
	public void mtBoardDetail() {
		/*
		 * logger.info("/mtboard/list [GET]성공");
		 */
	}
	
	
	@RequestMapping(value="/mtboard/mentoApply", method = RequestMethod.GET)
	public void mentoApply() {
		
		/* logger.info("/mtboard/mentoApply [GET]성공"); */
	}
	
	
	@RequestMapping(value="/mtboard/applyMt", method = RequestMethod.GET)
	public void applyMt() {
		
		/* logger.info("/mtboard/mentoApply [GET]성공"); */
	}
	
	
	@RequestMapping(value="/mtboard/applyMnt", method = RequestMethod.GET)
	public void applyMnt() {
		
		/* logger.info("/mtboard/mentoApply [GET]성공"); */
	}
	
	@RequestMapping(value="/mtboard/pay_info", method = RequestMethod.GET)
	public void pay_info() {
		
		/* logger.info("/mtboard/mentoApply [GET]성공"); */
	}
	
}
