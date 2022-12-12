package service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.face.MtBoardDao;
import dto.FileUpload;
import dto.MtBoard;
import service.face.MtBoardService;
import util.CommtPaging;
import util.Paging;

@Service
public class MtBoardServiceImpl implements MtBoardService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired MtBoardDao mtBoardDao;
	@Autowired ServletContext context;
	
	// 페이징
	@Override
	public Paging getPaging(int curPage) {
		
		  int totalCount = mtBoardDao.CntMtBaord();
		  Paging paging = new Paging(totalCount, curPage);
		  return paging; 
	}

	// 글목록
	@Override
	public List<HashMap<String, Object>> list(Paging paging) {
		return mtBoardDao.MtBoardList(paging);
	}

	// 상세보기
	@Override
	public HashMap<String, Object> view(MtBoard viewBoard) {
		
		// 조회수 증가
		mtBoardDao.mtBoardHit(viewBoard);
		
		// 상세보기 조회결과 
		return mtBoardDao.selectMtBoard(viewBoard);
	}

	// 글쓰기
	@Override
	public void write(MtBoard mtBoard, MultipartFile file) {
		
		mtBoardDao.insertBoard(mtBoard);
		
		//빈 파일일 경우
		if( file.getSize() <= 0 ) {
			return;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//파일이 저장될 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//저장할 파일의 정보 객체
		File dest = new File( storedFolder, storedName );
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//--------------------------------------------
		
		//첨부파일 정보 DB 기록
		FileUpload fileUpload = new FileUpload();
		fileUpload.setMtBoardNo(mtBoard.getMtboardNo());
		fileUpload.setFileUploadOri(originName);
		fileUpload.setFileUploadStor(storedName);
		
		mtBoardDao.insertFile(fileUpload);
		
	}
	
	
	 @Override public FileUpload getAttachFile(MtBoard viewBoard) { 
		 return mtBoardDao.selectMtBoardFileByBoardNo(viewBoard); 
	 }

	@Override
	public FileUpload getFile(FileUpload fileUpload) {
		return mtBoardDao.selectBoardFileByFileNo(fileUpload);
	}

	@Override
	public HashMap<String, Object> updateBoard(MtBoard mtBoard) {
		return mtBoardDao.mtBoardView(mtBoard);
	}

	@Override
	public void update(MtBoard mtBoard, MultipartFile file) {
		
		mtBoardDao.updateMtBoard(mtBoard);
		
		// 첨부파일
		if( file.getSize() <= 0 ) {
			return;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//파일이 저장될 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//저장할 파일의 정보 객체
		File dest = new File( storedFolder, storedName );
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//--------------------------------------------
		
		//첨부파일 정보 DB 기록
		FileUpload fileUpload = new FileUpload();
		fileUpload.setMtBoardNo(mtBoard.getMtboardNo());
		fileUpload.setFileUploadOri(originName);
		fileUpload.setFileUploadStor(storedName);
		
		// 기존 게시글 파일 삭제
		mtBoardDao.deleteFile(mtBoard);
		
		mtBoardDao.insertFile(fileUpload);		
	}

	@Override
	public void delete(MtBoard mtBoard) {
		mtBoardDao.deleteFile(mtBoard);
		mtBoardDao.deleteMtBoard(mtBoard);
	}

	@Override
	public void applyMt(MtBoard mtBoard) {
		mtBoardDao.applyMt(mtBoard);
	}

	@Override
	public void applyMnt(MtBoard mtBoard) {
		mtBoardDao.applyMnt(mtBoard);
	}

	/*
	 * @Override public CommtPaging getCommtPaging(int curPage, int mtboardNo) { int
	 * totalCount = mtBoardDao.CntReview(mtboardNo); CommtPaging commtPaging = new
	 * CommtPaging(totalCount, curPage); return commtPaging; }
	 * 
	 * @Override public List<HashMap<String, Object>> reviewList(CommtPaging
	 * reviewPaging, int mtboardNo) {
	 * 
	 * HashMap<String, Object> map = new HashMap<>(); map.put("paging",
	 * reviewPaging); map.put("mtboardNo", mtboardNo);
	 * 
	 * return mtBoardDao.reviewList(map); }
	 * 
	 * @Override public int getCntReview(int mtboardNo) { int totalCount =
	 * mtBoardDao.CntReview(mtboardNo); return totalCount; }
	 * 
	 * // 글목록 리뷰수
	 * 
	 * @Override public void mtBoardRvw(int mtboardNo) {
	 * mtBoardDao.mtBoardRvw(mtboardNo); }
	 */

	 

}
