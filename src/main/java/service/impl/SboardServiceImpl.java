package service.impl;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.face.SboardDao;
import dto.Commt;
import dto.StudyBoard;
import service.face.SboardService;
import util.Paging;

@Service
public class SboardServiceImpl implements SboardService{
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SboardDao sboardDao;
	
	@Autowired ServletContext context;

	@Override
	public Paging getPaging(int curPage) {
		
		//총 게시글 수 조회
		int totalCount = sboardDao.selectCntAll();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}

	@Override
	public ArrayList<HashMap<String, Object>> selectSboardHash(Paging paging) {
		return sboardDao.selectSboardHash(paging);
	}

	@Override
	public HashMap<String, Object> detail(int studyNo) {
		
		return sboardDao.detailPageBySboardNo(studyNo);
	}

	@Override
	public void enroll(StudyBoard sboard) {
		
		//게시글 처리
		if("".equals( sboard.getStudyTitle())) {
			sboard.setStudyTitle("(제목없음)");
		}
				
		sboardDao.enroll(sboard);
				
	}

	@Override
	public void update(StudyBoard sboard) {
		//게시글 처리
		if("".equals( sboard.getStudyTitle())) {
			sboard.setStudyTitle("(제목없음)");
		}
		
		sboardDao.update(sboard);
		
	}

	@Override
	public void delete(StudyBoard sboard) {
		
		//게시글 삭제
		sboardDao.delete(sboard);
		
	}
	
	//-------------------------------------------------------------------

	@Override
	public ArrayList<HashMap<String, Object>> sboardcmt(int studyNo) {
		
		return sboardDao.getsboardcmtmain(studyNo);
	}

	@Override
	public int getScmtcnt(int studyNo) {
		int cmtcnt = sboardDao.sboardcmtcnt(studyNo);
		return cmtcnt;
	}

	@Override
	public void sboardcmtcnt(int studyNo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertcmmt(Commt commt) {
		
		sboardDao.insertcmt(commt);
		
		int commtNo = commt.getCommtNo();
		Commt insertcom = sboardDao.selectCmtByCommtNo(commtNo);
		
	}
	
	@Override
	public void deletecmt(int commtNo) {
		sboardDao.deletecmt(commtNo);
	}

	
	
	
	

	

}
