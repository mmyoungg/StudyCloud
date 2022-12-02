package service.impl;

import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.face.MboardDao;
import dto.FileUpload;
import dto.Mboard;
import service.face.MboardService;
import util.Paging;

@Service
public class MboardServiceImpl implements MboardService{
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MboardDao mboardDao;
	
	@Autowired ServletContext context;

	@Override
	public Paging getPaging(int curPage) {
		
		//총 게시글 수 조회
		int totalCount = mboardDao.selectCntAll();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
		
		//페이징 계산
//		paging paging = new paging(totalCount, curPage);
		
//		return paging;
	}

	@Override
	public List<Mboard> list(Paging paging) {
		return mboardDao.selectList(paging);
	}

	@Override
	public Mboard detail(Mboard detailMboard) {
		return null;
	}

	@Override
	public FileUpload getAttachFile(Mboard detailMboard) {
		return null;
	}

	@Override
	public void write(Mboard mboard, MultipartFile file) {
		
	}

	

}
