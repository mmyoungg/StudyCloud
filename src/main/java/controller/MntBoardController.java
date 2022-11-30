package controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MntBoardController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value="/mntboard/list", method = RequestMethod.GET)
	public void mntBoardList() {
		
		/* logger.info("/mntboard/list [GET]성공"); */
	}
	
	@RequestMapping(value="/mntboard/write", method = RequestMethod.GET)
	public void mntBoardWrite() {
		
		/* logger.info("/mntboard/list [GET]성공"); */
	}
	
	@RequestMapping(value="/mntboard/detail", method = RequestMethod.GET)
	public void mntBoardDetail() {
		
		/* logger.info("/mntboard/list [GET]성공"); */
	}
}
