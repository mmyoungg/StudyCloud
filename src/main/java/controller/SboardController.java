package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SboardController {
	
	@RequestMapping(value = "/sboard/sboardmain", method = RequestMethod.GET)
	public void sboard() {
		
		System.out.println("sboardmain 호출 완");
		
		return;
	}

}
