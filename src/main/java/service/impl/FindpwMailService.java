package service.impl;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import dto.FindpwMail;
import util.FindpwMailHandler;

@Service
public class FindpwMailService {
    private JavaMailSender mailSender;
    private static final String FROM_ADDRESS = "reneekim08@naver.com";

    public void mailSend(FindpwMail mail) {

        try {
            FindpwMailHandler mailHandler = new FindpwMailHandler(mailSender);

            // 받는 사람
            mailHandler.setTo(mail.getAddress());
            // 보내는 사람
            mailHandler.setFrom(FindpwMailService.FROM_ADDRESS);
            // 제목
            mailHandler.setSubject(mail.getTitle());
            // HTML Layout
            String htmlContent = "<p>" + mail.getMessage() + "<p> <img src='cid:sample-img'>";
            mailHandler.setText(htmlContent, true);


            mailHandler.send();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
