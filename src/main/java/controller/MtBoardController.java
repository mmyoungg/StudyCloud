package controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class MtBoardController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value="/mtboard/list", method = RequestMethod.GET)
	public void mtBoardList() {
		/*
		 * logger.info("/mtboard/list [GET]성공");
		 */
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
	
	
	
}
