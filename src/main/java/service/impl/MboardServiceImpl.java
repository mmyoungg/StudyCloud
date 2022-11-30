package service.impl;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dao.face.MboardDao;
import dto.Mboard;
import service.face.MboardService;
import util.Paging;

public class MboardServiceImpl implements MboardService{
	
	@Autowired MboardDao mboardDao;
	
	@Autowired ServletContext context;

	@Override
	public Paging getPaging(int curPage) {
		
		//총 게시글 수 조회
		int totalCount = MboardDao.selectCntAll();
		
		return null;
		
		//페이징 계산
//		paging paging = new paging(totalCount, curPage);
		
//		return paging;
	}

	@Override
	public List<Mboard> list(Paging paging) {
		return null;
	}

	@Override
	public Mboard detail(Mboard detailMboard) {
		return null;
	}

	

}
