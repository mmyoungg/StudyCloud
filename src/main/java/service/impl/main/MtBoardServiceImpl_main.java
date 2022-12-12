package service.impl.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.face.main.MtBoardDao_main;
import dto.MtBoard;
import service.face.main.MtBoardService_main;

@Service
public class MtBoardServiceImpl_main implements MtBoardService_main	 {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MtBoardDao_main mtBoardDao_main;
	
	//메인페이지 
	
	//인기 멘토링 리스트
	@Override
	public List<Map<String, Object>> mtListWithFile(MtBoard mtBoard) {
		
		return mtBoardDao_main.selectMtList();
	}

	@Override
	public List<HashMap<String, Object>> mtReivewList(MtBoard mtBoard) {
		
		return mtBoardDao_main.selectMtReviewList();
	}

}
