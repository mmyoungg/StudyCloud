package service.face;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import dto.Commt;
import dto.FileUpload;
import dto.MntBoard;
import dto.MntBoardLike;
import util.CommtPaging;
import util.Paging;

public interface MntBoardService {

	/**
	 * 
	 * 게시글 목록을 위한 페이징 객체 생성
	 * 
	 * @param curPage - 요청 페이지 번호
	 * @return 계산이 완료된 Paging 객체
	 */
	public Paging getPaging(int curPage);

	/**
	 * 페이징 적용된 게시글 목록 조회
	 * 
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글목록
	 */
	public List<HashMap<String, Object>> list(Paging paging);
	
	
	/**
	 * 게시글 상세
	 * 
	 * @param viewBoard - 상세 조회할 게시글 번호 객체
	 * @return 조회된 상세 게시글 객체
	 */
	public HashMap<String, Object> view(MntBoard viewBoard);
	

	/**
	 * 게시글 정보, 첨부파일 함께 처리
	 * 
	 * @param mntBoard 게시글정보
	 * @param file 첨부파일정보
	 */
	public void write(MntBoard mntBoard, MultipartFile file);

	
	/**
	 * 게시글 정보 / 첨부파일 처리
	 * 
	 * @param viewBoard 게시글 정보
	 * @return file 첨부파일 정보
	 */
	public FileUpload getAttachFile(MntBoard viewBoard);
	
	
	/**
	 * 
	 * @param fileUpload 조회할 파일 번호 
	 * @return 첨부 파일 정보
	 */
	public FileUpload getFile(FileUpload fileUpload);

	
	/**
	 * 
	 * @param mntBoard
	 * @return 
	 */
	public HashMap<String, Object> updateBoard(MntBoard mntBoard);

	
	/**
	 * 
	 * @param mntBoard 
	 * @param file 수정된 파일정보
	 */
	public void update(MntBoard mntBoard, MultipartFile file);

	
	
	/**
	 * 게시글 삭제
	 * @param mntBoard
	 */
	public void delete(MntBoard mntBoard);

	
	// --------------- 댓글 ---------------
	
	public int getCntCommt(int mntboardNo);
	
	public List<HashMap<String, Object>> commtList(CommtPaging commtPaging, int mntboardNo);

	public void mntBoardCmt(int mntboardNo);
	
	public CommtPaging getCommtPaging(int curPage, int mntboardNo);
	
	public void writeCommt(Commt commt);

	public void updateCommt(Commt commt);
	
	public void deleteCommt(int commtNo);
	

	

	

	/*
	 * // 댓글수정 public List<HashMap<String, Object>> commtList(Commt commt);
	 */
	
	
	
	
	
	
	
}



















