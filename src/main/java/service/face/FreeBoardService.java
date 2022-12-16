package service.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import dto.Commt;
import dto.FileUpload;
import dto.FreeBoard;
import util.CmtPaging;
import util.Paging;

public interface FreeBoardService {
	
	// 페이징 처리
	public CmtPaging getPaging(int curPage);

	// 글목록 리스트
	public List<HashMap<String, Object>> getList(CmtPaging paging);
	
	// 게시글 조회
	public HashMap<String, Object> view(int fBoard_no);
	
	// 게시글 작성
	public void write(FreeBoard freeBoard, List<MultipartFile> fBoardFile);

	public List<HashMap<String, Object>> getAttachFile(int fBoard_no);

	// 글수정을 위한 view값 
	public HashMap<String, Object> updateView(FreeBoard freeBoard);
	
	// 다운로드할 파일정보 불러오기
	public FileUpload getFile(FileUpload fileUpload);

	// 게시글 수정
	public void update(FreeBoard freeBoard, List<MultipartFile> fBoardFile);
	
	// 게시글 삭제
	public void delete(FreeBoard freeBoard);
	
	// 댓글 페이징 처리
	public List<HashMap<String, Object>> getCmtList(Map<String, Object> map);
	
	// 댓글 페이징 Ajax처리
	public CmtPaging getCmtPaging(Integer curPage, Integer fBoardNo);
	
	// 댓글 개수구하기
	public int getCmtCount(Integer fBoardNo);
	
	// 댓글 삽입
	public Commt insertCmt(Commt commt);
	
	// 댓글 수정
	public void updateCmt(Commt commt);

	// 댓글 삭제
	public void deleteCmt(int commtNo);
	
	// 검색결과 조회 리스트
	public List<HashMap<String, Object>> getSearchList(HashMap<String, Object> map);
	
	// 검색결과 리스트 페이징
	public CmtPaging getSearchPaging(HashMap<String, Object> map);
	
	// 게시글 작성시 유저닉네임 불러오기
	public String getUserNick(int memberNo);
	

}
