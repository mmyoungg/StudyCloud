package service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.face.MemberService;
import dto.Member;
import dao.face.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired MemberDao memberDao;
	
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
	public boolean join(Member member) {
		// TODO Auto-generated method stub
		return false;
	}
}
