package service.impl.admin;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.face.admin.SboardDao_admin;
import dto.StudyBoard;
import service.face.admin.SboardService_admin;
import util.Paging;

@Service
public class SboardServiceImpl_admin implements SboardService_admin {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SboardDao_admin sBoardDao_admin;

	@Override
	public Paging getPaging(int curPage) {
		
		//총 게시글 수 조회
		int totalCount = sBoardDao_admin.selectCntAll();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}

	@Override
	public List<StudyBoard> list(Paging paging) {
		return sBoardDao_admin.selectStudyList(paging);
	}

}
