package service.impl.admin;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.face.admin.ReserveDao_admin;
import dto.Reservation;
import service.face.admin.ReserveService_admin;
import util.Paging;

@Service
public class ReserveServiceImpl_admin implements ReserveService_admin {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired  ReserveDao_admin reserveDao_admin;
	
	@Override
	public Paging getPaging(int curPage) {
		
		//총 게시글 수 조회;
		int totalCount = reserveDao_admin.selectCntAll();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}

	@Override
	public List<HashMap<String, Object>> viewReserve(Reservation res) {
		
		//상세보기 결과 리턴
		return reserveDao_admin.selectReserve(res);
	}

}
