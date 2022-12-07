package controller;

import dto.FindpwMail;
import service.impl.FindpwMailService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class FindpwMailController {
    private final FindpwMailService mailService = new FindpwMailService();

    @GetMapping("/mail")
    public String disMail(){
        return "content/mailSendTest";
    }

    @PostMapping("/mail")
    public void execMail(FindpwMail mail){
        mailService.mailSend(mail);
    }
}