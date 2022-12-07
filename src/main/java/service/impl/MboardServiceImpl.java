package service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.apache.commons.io.IOExceptionWithCause;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.face.MboardDao;
import dto.FileUpload;
import dto.Mboard;
import dto.MboardLike;
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
		
	
	}
	
	@Override
	public List<HashMap<String, Object>> selectMboardHash(Paging paging) {
		return mboardDao.selectMboardHash(paging);
	}

	@Override
	public HashMap<String, Object> detail(int mboardNo) {
		
		//조회수 증가
		mboardDao.updateHit(mboardNo);
		
		//상세보기 조회 결과 리턴
		return mboardDao.detailPageByMboardNo(mboardNo);
	}


	@Override
	public void write(Mboard mboard, MultipartFile file) {
		
		//게시글 처리
		if("".equals( mboard.getMboardTitle())) {
			mboard.setMboardTitle("(제목없음)");
		}
		
		mboardDao.insert(mboard);
		
		//빈 파일인 경우
		if( file.getSize() <= 0 ) {
			return;
		}
		
		//파일 저장 될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		//파일 저장 될 이름
		String fileUploadOri = file.getOriginalFilename();
		String fileUploadStor = fileUploadOri + UUID.randomUUID().toString().split("-")[4];
		
		//저장할 파일의 정보 객체
		File dest = new File( storedFolder, fileUploadStor );
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//첨부파일 정보 DB 기록
		FileUpload fileUpload = new FileUpload();
		fileUpload.setmBoardNo( mboard.getMboardNo() );
		fileUpload.setFileUploadOri(fileUploadOri);
		fileUpload.setFileUploadStor(fileUploadStor);
		
		mboardDao.insertFile(fileUpload);
		
		
	}

	@Override
	public List<HashMap<String, Object>> getAttachFile(int mboardNo) {
		return mboardDao.selectMboardFileByMboardNo(mboardNo);
	}
	
	@Override
	public FileUpload getFile(FileUpload fileUpload) {
		return mboardDao.selectMboardFileByFileUploadNo(fileUpload);
	}


	@Override
	public void update(Mboard mboard, MultipartFile file) {
		
		//게시글 처리
		if("".equals( mboard.getMboardTitle())) {
			mboard.setMboardTitle("(제목없음)");
		}
				
		mboardDao.update(mboard);
				
		//빈 파일인 경우
		if( file.getSize() <= 0 ) {
			return;
		}
				
		//파일 저장 될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		//파일 저장 될 이름
		String fileUploadOri = file.getOriginalFilename();
		String fileUploadStor = fileUploadOri + UUID.randomUUID().toString().split("-")[4];
				
		//저장할 파일의 정보 객체
		File dest = new File( storedFolder, fileUploadStor );
				
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
				
		//첨부파일 정보 DB 기록
		FileUpload fileUpload = new FileUpload();
		fileUpload.setmBoardNo( mboard.getMboardNo() );
		fileUpload.setFileUploadOri(fileUploadOri);
		fileUpload.setFileUploadStor(fileUploadStor);
		
		//기존 게시글에 연결된 첨부파일을 삭제한다
		mboardDao.deleteFile(mboard);
				
		mboardDao.insertFile(fileUpload);
		
	}

	@Override
	public void delete(Mboard mboard) {
		
		//첨부파일 삭제
		mboardDao.deleteFile(mboard);
		
		//게시글 삭제
		mboardDao.delete(mboard);
	}

	@Override
	public void setMboardLike(MboardLike mboardLike) {
		
	}





	



	

}
