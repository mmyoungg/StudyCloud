package service.impl;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.face.MemberDao;
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
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; 
//		String hostSMTPid = "서버 이메일 주소(보내는 사람 이메일 주소)";
//		String hostSMTPpwd = "서버 이메일 비번(보내는 사람 이메일 비번)";

		// 보내는 사람 EMail, 제목, 내용
//		String fromEmail = "보내는 사람 이메일주소(받는 사람 이메일에 표시됨)";
		String fromEmail = "admin@studycloud.com";
		String fromName = "(주)StudyCloud";
		String subject = "";
		String msg = "";

		if(div.equals("findpw")) {
			subject = "StudyCloud 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += member.getMemberId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += member.getMemberPw() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = member.getMemberEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465);

//			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
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


}
