package service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.face.MypageDao;
import dto.Member;
import service.face.MypageService;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired MypageDao mypageDao;

	public void userUpdate(Member member) {
		
		mypageDao.userUpdate(member);;
		
	}


}
