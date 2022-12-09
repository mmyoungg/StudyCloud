package service.impl;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.face.MtBoardDao;
import service.face.MtBoardService;
import util.Paging;

@Service
public class MtBoardServiceImpl implements MtBoardService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MtBoardDao mtBoardDao;
	
	@Override
	public Paging getPaging(int curPage) {
		
		  int totalCount = mtBoardDao.CntMtBaord();
		  Paging paging = new Paging(totalCount, curPage);
		  return paging; 
	}

	@Override
	public List<HashMap<String, Object>> list(Paging paging) {
		return mtBoardDao.MtBoardList(paging);
	}

}
