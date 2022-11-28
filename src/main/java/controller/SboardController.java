package controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SboardController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value = "/sboard/sboardmain", method = RequestMethod.GET)
	public void main() {
		
		System.out.println("sboardmain 호출 완");
		
		return;
	}
	
	@RequestMapping(value = "/sboard/sboarddetail", method = RequestMethod.GET)
	public void detail() {
		
		logger.info("detail 호출");
		
		return;
	}
	
	@RequestMapping(value = "/sboard/applystudy", method = RequestMethod.GET)
	public void apply() {
		
		logger.info("apply 호출");
		
		return;
	}
	
	@RequestMapping(value = "/sboard/enrollstudy", method = RequestMethod.GET)
	public void enroll() {
		
		logger.info("enroll 호출");
		
		return;
	}
	

}
