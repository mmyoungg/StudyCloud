package service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.face.FreeBoardDao;
import dto.FileUpload;
import dto.FreeBoard;
import service.face.FreeBoardService;
import util.Paging;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {
	
	@Autowired FreeBoardDao freeBoardDao;
	@Autowired ServletContext context;
	
	@Override
	public Paging getPaging(int curPage) {
		int totalCount = freeBoardDao.countBoard();
		Paging paging = new Paging(totalCount, curPage);
		return paging;
	}
	
	@Override
	public List<HashMap<String, Object>> getList(Paging paging) {
		
		return freeBoardDao.getListWithPaging(paging);
	}
	
	@Override
	public HashMap<String, Object> view(int fBoard_no) {
		
		// 조회수 증가
		freeBoardDao.plusHit(fBoard_no);
		
		return freeBoardDao.ViewfBoardByfBoardNo(fBoard_no);
	}
	
	@Override
	public void write(FreeBoard freeBoard, MultipartFile fBoard_file) {
		
		// 게시글 삽입
		freeBoardDao.fBoardInsert(freeBoard);
		
		if(fBoard_file.getSize() <= 0) { return; }
		
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		// 파일이 저장될 이름
		String originName = fBoard_file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		// 저장할 파일의 정보 객체
		File dest = new File( storedFolder, storedName);
		try {
			fBoard_file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// 첨부파일 정보 DB 기록
		FileUpload fileUpload = new FileUpload();
		fileUpload.setfBoard_no(freeBoard.getfBoard_no());
		fileUpload.setFileUpload_ori(originName);
		fileUpload.setFileUpload_stor(storedName);
			
		freeBoardDao.insertFile(fileUpload);
		
		
	}
	
	@Override
	public FileUpload getAttachFile(int fBoard_no) {
		return freeBoardDao.selectFileByfBoardNo(fBoard_no);
	}

	
	
	
}
