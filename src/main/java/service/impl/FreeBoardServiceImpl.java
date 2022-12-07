package service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.face.FreeBoardDao;
import dto.Commt;
import dto.FileUpload;
import dto.FreeBoard;
import service.face.FreeBoardService;
import util.CmtPaging;
import util.Paging;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {
	
	@Autowired FreeBoardDao freeBoardDao;
	@Autowired ServletContext context;
	
	@Override
	public CmtPaging getPaging(int curPage) {
		int totalCount = freeBoardDao.countBoard();
		CmtPaging paging = new CmtPaging(totalCount, curPage);
		return paging;
	}
	
	@Override
	public List<HashMap<String, Object>> getList(CmtPaging paging) {
		
		return freeBoardDao.getListWithPaging(paging);
	}
	
	@Override
	public HashMap<String, Object> view(int fBoardNo) {
		
		// 조회수 증가
		freeBoardDao.plusHit(fBoardNo);
		
		return freeBoardDao.ViewfBoardByfBoardNo(fBoardNo);
	}
	
	@Override
	public void write(FreeBoard freeBoard, List<MultipartFile> fBoardFile) {
		
		// 게시글 삽입
		freeBoardDao.fBoardInsert(freeBoard);
		
		if(fBoardFile.size() <= 0) { return; }
		
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		System.out.println("[파일 RealPath : " + storedPath);
		// 파일이 저장될 이름
		List<Map<String, String>> fileList = new ArrayList<>();	
		
		for(int i=0; i<fBoardFile.size(); i++) {
			String originName = fBoardFile.get(i).getOriginalFilename();
			System.out.println("[파일업로드 수정 서비스] originName : " + originName);
			String storedName = originName + UUID.randomUUID().toString().split("-")[1];
			System.out.println("[파일업로드 수정 서비스] storedName : " + storedName);
			
			Map<String, String> map = new HashMap<>();
			map.put("originName", originName);
			map.put("storedName", storedName);
			
			fileList.add(map);
			
		}
		
		// 저장할 파일의 정보 객체
		for(int i=0; i<fBoardFile.size(); i++) {
		File dest = new File( storedFolder, fileList.get(i).get("storedName"));
		try {
			fBoardFile.get(i).transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 첨부파일 정보 DB 기록
		FileUpload fileUpload = new FileUpload();
		fileUpload.setfBoardNo(freeBoard.getfBoardNo());
		fileUpload.setFileUploadOri(fileList.get(i).get("originName"));
		fileUpload.setFileUploadStor(fileList.get(i).get("storedName"));
			
		freeBoardDao.insertFile(fileUpload);
		}
		
		
	}
	
	@Override
	public List<HashMap<String, Object>> getAttachFile(int fBoardNo) {
		return freeBoardDao.selectFileByfBoardNo(fBoardNo);
	}
	
	@Override
	public HashMap<String, Object> updateView(FreeBoard freeBoard) {
		
		return freeBoardDao.getDetailViewByfBoardNo(freeBoard);
	}
	
	@Override
	public FileUpload getFile(FileUpload fileUpload) {
		
		return freeBoardDao.selectUploadFileByFileNo(fileUpload);
	}
	
	@Override
	public void update(FreeBoard freeBoard, List<MultipartFile> fBoardFile) {
		freeBoardDao.updateFreeBoard(freeBoard);
		
		// 첨부파일 수정
		
		if( fBoardFile.size() <= 0 ) {
			return;
		}
	
		freeBoardDao.deleteFile(freeBoard);
				
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		List<Map<String, String>> fileList = new ArrayList<>();	
		
		//파일이 저장될 이름
		for(int i=0; i<fBoardFile.size(); i++) {
			String originName = fBoardFile.get(i).getOriginalFilename();
			System.out.println("[파일업로드 서비스] originName : " + originName);
			String storedName = originName + UUID.randomUUID().toString().split("-")[1];
			System.out.println("[파일업로드 서비스] storedName : " + storedName);
			
			Map<String, String> map = new HashMap<>();
			map.put("originName", originName);
			map.put("storedName", storedName);
			
			fileList.add(map);
			
		}
		//저장할 파일의 정보 객체
		for(int i=0; i<fBoardFile.size(); i++) {
		File dest = new File( storedFolder, fileList.get(i).get("storedName"));
		
		try {
			fBoardFile.get(i).transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//--------------------------------------------
		
		//첨부파일 정보 DB 기록
		FileUpload fileUpload = new FileUpload();
		fileUpload.setfBoardNo( freeBoard.getfBoardNo() );
		fileUpload.setFileUploadOri(fileList.get(i).get("originName"));
		fileUpload.setFileUploadStor(fileList.get(i).get("storedName"));
		
		//기존에 게시글에 연결된 첨부파일을 삭제한다
				
		freeBoardDao.insertFile(fileUpload);		
		}
	}
	
	@Override
	public void delete(FreeBoard freeBoard) {
		freeBoardDao.deleteByfBoardNo(freeBoard);
	}
	
	@Override
	public List<HashMap<String, Object>> getCmtList(Map<String, Object> map) {
		return freeBoardDao.getfBoardCmtList(map);
	}
	
	@Override
	public CmtPaging getCmtPaging(Integer curPage, Integer fBoardNo) {
		int totalCount = freeBoardDao.countBoardCmt(fBoardNo);
		System.out.println("[페이징계산..] curPage : " + curPage + "totalCount : " + totalCount);
		CmtPaging paging = new CmtPaging(totalCount, curPage);
		return paging;
	}
	
	@Override
	public int getCmtCount(Integer fBoardNo) {
		int totalCount = freeBoardDao.countBoardCmt(fBoardNo);
		return totalCount;
	}
	
	@Override
	public Commt insertCmt(Commt commt) {
		freeBoardDao.insertCmtfBoard(commt);
		
		int commtNo = commt.getCommtNo();
		System.out.println("[COMMTNO] : " + commtNo);
		Commt comInsertRes = freeBoardDao.selectCmtByCmtNo(commtNo);
		return comInsertRes;
	}
	
	@Override
	public void updateCmt(Commt commt) {
		freeBoardDao.updateCmtfBoard(commt);
	}
	
	@Override
	public void deleteCmt(int commtNo) {
		freeBoardDao.deleteCmtfBoard(commtNo);
	}
	
	@Override
	public List<HashMap<String, Object>> getSearchList(HashMap<String, Object> map) {
		return freeBoardDao.getfBoardSearchList(map);
	}
	
	@Override
	public CmtPaging getSearchPaging(HashMap<String, Object> map) {
		int totalCount = freeBoardDao.countSearchList(map);
		int curPage = (int) map.get("curPagee");
		CmtPaging paging = new CmtPaging(totalCount, curPage);
		return paging;
		
	}
}
