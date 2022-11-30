package controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SendMessageController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	

	@RequestMapping(value = "/mboard/message", method = RequestMethod.GET)
	public void message() {
		
		logger.info("message 호출 완");
		
		return;
		
	}

	@RequestMapping(value = "/mtboard/msg", method = RequestMethod.GET)
	public void mtMsg() {
		
		/* logger.info("/mtboard/msg [GET]성공"); */
	}

	@RequestMapping(value = "/mntboard/msg", method = RequestMethod.GET)
	public void mntMsg() {
		
		/* logger.info("/mtboard/msg [GET]성공"); */
	}

}

