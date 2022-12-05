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

import dao.face.MntBoardDao;
import dto.Commt;
import dto.FileUpload;
import dto.MntBoard;
import service.face.MntBoardService;
import util.Paging;

@Service
public class MntBoardServiceImpl implements MntBoardService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	MntBoardDao mntBoardDao;
	
	// @Autowired MntCommtDao mntCommtDao;
	  @Autowired ServletContext context;

	  // 페이징
	  @Override 
	  public Paging getPaging(int curPage) { 
		  
		  int totalCount = mntBoardDao.CntBoard();
		  Paging paging = new Paging(totalCount, curPage);
		  return paging; 
		  
	  }

	 // 페이징 글목록
	@Override
	public List<HashMap<String, Object>> list(Paging paging) {
		
		return mntBoardDao.MntBoardList(paging);
	}

	
	
	//	게시글 상세보기
	@Override
	public HashMap<String, Object> view(MntBoard viewBoard) {
		
		// 조회수 증가
		mntBoardDao.mntBoardHit(viewBoard);
		
		// 상세보기 조회결과 
		return mntBoardDao.selectMntBoard(viewBoard);
	}

	@Override
	public void write(MntBoard mntBoard, MultipartFile file) {
		
//		// 게시글 처리 ( 게시판 제목 Not Null임 )
//		if("".equals( mntBoard.getMntboardTitle())) {
//				mntBoard.setMntboardTitle("(제목없음)");
//		}
		
		
		mntBoardDao.insertBoard(mntBoard);
		
		// ----------------------------------------------------
		
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
				fileUpload.setMntBoardNo(mntBoard.getMntboardNo());
				fileUpload.setFileUploadOri(originName);
				fileUpload.setFileUploadStor(storedName);
				
				mntBoardDao.insertFile(fileUpload);
		
				
		
	}

	@Override
	public FileUpload getAttachFile(MntBoard viewBoard) {
		return mntBoardDao.selectMntBoardFileByBoardNo(viewBoard);
		
	}

	@Override
	public FileUpload getFile(FileUpload fileUpload) {
		return mntBoardDao.selectBoardFileByFileNo(fileUpload);
	}

	@Override
	public HashMap<String, Object> updateBoard(MntBoard mntBoard) {
		return mntBoardDao.mntBoardView(mntBoard);
		
	}

	@Override
	public void update(MntBoard mntBoard, MultipartFile file) {
		
		mntBoardDao.updateMntBoard(mntBoard);
		
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
		fileUpload.setMntBoardNo(mntBoard.getMntboardNo());
		fileUpload.setFileUploadOri(originName);
		fileUpload.setFileUploadStor(storedName);
		
		// 기존 게시글 파일 삭제
		mntBoardDao.deleteFile(mntBoard);
		
		mntBoardDao.insertFile(fileUpload);
	}

	
	@Override
	public void delete(MntBoard mntBoard) {
		
		//첨부파일 삭제
		mntBoardDao.deleteFile(mntBoard);
				
		//게시글 삭제
		mntBoardDao.deleteMntBoard(mntBoard);
				
	}

	

	
	// --------- 댓글 ---------
	

	

	@Override
	public List<HashMap<String, Object>> commtList(MntBoard viewBoard) {
		return mntBoardDao.mntCommtList(viewBoard);
	}

	@Override
	public void writeCommt(Commt commt) {
		mntBoardDao.insertCommt(commt);
	}

	/*
	* @Override public List<HashMap<String, Object>> commtList(Commt commt) {
	* return mntCommtDao.updateCommt(commt); }
	*/

	
	
	
	
	
	 
	
	
	
	

}














