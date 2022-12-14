package service.impl;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.face.MemberDao;
import dto.FileUpload;
import dto.Member;
import service.face.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired MemberDao memberDao;
//	@Autowired private FindidMapper mapper;
	
	//로그인
	
	@Override
	public boolean login(Member member) {
		int loginChk = memberDao.selectCntMember(member);
		logger.info("loginChk : {}", loginChk);
		
		if( loginChk > 0 )	return true;
		return false;
	}
	
	@Override
	public String getMemberNick(Member member) {
		return memberDao.selectMemberNick(member);
	}
	
	@Override
	public String getMemberNo(Member member) {
		return memberDao.selectMemberNo(member);
	}
	
	@Override
	   public Member getMemberById(String id) {
	      return memberDao.getMemberById(id);
	   }
	
	//회원가입

	@Override
	public boolean join(Member member) {
		
		//중복된 id인지 확인
		if( memberDao.selectCntById(member) > 0 ) {
			return false;
		}
		
		//회원 가입 - DB 삽입
		memberDao.insert(member);
		
		//회원가입 결과 확인
		if( memberDao.selectCntById(member) > 0 ) {
			return true;
		}
		return false;
		
	}
		
	// 아이디 찾기

	@Override
	public String selectid(Member member) {
		return memberDao.selectFindId(member);
	}

	@Override
	public String findid(String memberEmail) {
		// TODO Auto-generated method stub
		return null;
	}


	//비밀번호 찾기 이메일발송
	
	@Override
	public void sendEmail(Member member, String div) {
		logger.info("sendEmail");
		
				Properties props = new Properties();
				props.put("mail.smtp.host", "smtp.gmail.com");
				props.put("mail.smtp.port", "587");
				props.put("mail.smtp.auth", "true");
				props.put("mail.smtp.starttls.enable", "true");
				props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
				
				Session session = Session.getInstance(props, new Authenticator() {
					@Override
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("parksy421@gmail.com", "joaenufuyysabsft");
					}
				});
				
				Member dbMember = memberDao.selectMemberByEmail(member.getMemberEmail());
				
				String receiver = member.getMemberEmail(); // 메일 받을 주소
				String subject = "";
				String msg="";
				
				if(div.equals("findpw")) {
					subject = "StudyCloud 임시 비밀번호 입니다.";
					msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
					msg += "<h3 style='color: #3F92B7;'>";
					msg += dbMember.getMemberNick() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
					msg += "<p>임시 비밀번호 : ";
					msg += member.getMemberPw() + "</p></div>";
				}
				
				Message message = new MimeMessage(session);
				try {
					message.setFrom(new InternetAddress("parksy421@gmail.com", "(주)StudyCloud", "utf-8"));
					message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
					message.setSubject(subject);
					message.setContent(msg, "text/html; charset=utf-8");

					Transport.send(message);
				} catch (Exception e) {
					e.printStackTrace();
				}
		
//		
//		// Mail Server 설정
//		String charSet = "utf-8";
//		String hostSMTP = "smtp.gmail.com"; 
////		String hostSMTPid = "서버 이메일 주소(보내는 사람 이메일 주소)";
//		String hostSMTPid = "parksy421@gamil.com";
//		String hostSMTPpwd = "joaenufuyysabsft";
////		String hostSMTPpwd = "서버 이메일 비번(보내는 사람 이메일 비번)";
//
//		// 보내는 사람 EMail, 제목, 내용
////		String fromEmail = "보내는 사람 이메일주소(받는 사람 이메일에 표시됨)";
//		String fromEmail = "parksy421@gamil.com";
//		String fromName = "(주)StudyCloud";
//		String subject = "";
//		String msg = "";
//
//		if(div.equals("findpw")) {
//			subject = "StudyCloud 임시 비밀번호 입니다.";
//			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
//			msg += "<h3 style='color: blue;'>";
//			msg += member.getMemberId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
//			msg += "<p>임시 비밀번호 : ";
//			msg += member.getMemberPw() + "</p></div>";
//		}
//
//		// 받는 사람 E-Mail 주소
//		String mail = member.getMemberEmail();
//		try {
//			HtmlEmail email = new HtmlEmail();
//			email.setDebug(true);
//			email.setCharset(charSet);
//			email.setSSL(true);
//			email.setHostName(hostSMTP);
//			email.setSmtpPort(587);
//			email.setSSL(true);
////			email.setAuthentication(hostSMTPid, hostSMTPpwd);
//			email.setTLS(true);
//			email.addTo(mail, charSet);
//			email.setFrom(fromEmail, fromName, charSet);
//			email.setSubject(subject);
//			email.setHtmlMsg(msg);
//			email.send();
//		} catch (Exception e) {
//			System.out.println("메일발송 실패 : " + e);
//		}
	}

	//비밀번호찾기
	@Override
	public String findPw(Member member) {
		int ck = memberDao.readMember(member.getMemberEmail());
		
		// 가입된 이메일이 아니면
		if( ck < 1 ) {
			return "등록되지 않은 이메일입니다.";
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			member.setMemberPw(pw);
			// 비밀번호 변경
			memberDao.updatePw(member);
			// 비밀번호 변경 메일 발송
			sendEmail(member, "findpw");

			return "이메일로 임시 비밀번호를 발송하였습니다.";
		}
	}


	// 아이디 중복 체크
	@Override
	public int idchk(String memberId) throws Exception {
		 return memberDao.idchk(memberId);
	}

	@Override
	public Member memberInfo(Member member) {
		return memberDao.getMemberById(member.getMemberId());
	}
	
	@Override
	public Member memberInfoByNo(Member member) {
		return memberDao.getMemberByMemberNo(member);
	}

	@Override
	public FileUpload getProfileMemberNo(Member member) {
		return null;
	}
}
	
 

