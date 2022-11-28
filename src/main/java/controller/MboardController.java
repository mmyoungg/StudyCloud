package controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MboardController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value="/mboard/mboardmain", method = RequestMethod.GET)
	private void mboard() {
		
		logger.info("mboardmain 호출 완");
		
		return;
		
	}
	
	@RequestMapping(value = "/mboard/mboardwrite", method = RequestMethod.GET)
	public void mboardwrite() {
		
		logger.info("mboardwirte 호출 완");
		
		return;
	}
	
	@RequestMapping(value = "/mboard/mboarddetail", method = RequestMethod.GET)
	public void mboarddetail() {
		
		logger.info("mboarddetail 호출 완");
		
		return;
		
	}
	
	
	

}
