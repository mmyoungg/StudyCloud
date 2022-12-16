package dao.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dto.ApplyMnt;
import dto.ApplyMt;
import dto.FileUpload;
import dto.MntBoard;
import dto.MtBoard;
import dto.MtMark;
import util.Paging;
import util.PagingVUp;

public interface MtBoardDao {

	// 게시글 수 
	public int CntMtBaord(Map<String, Object> map);

	// 게시글 목록
	public List<HashMap<String, Object>> MtBoardList(Map<String, Object> map);

	//페이징 게시글 목록
	public List<HashMap<String, Object>> MtBoardListPaging(PagingVUp paging);
	
	// 조회수 증가
	public void mtBoardHit(int viewBoard);

	// 게시글 조회
	public HashMap<String, Object> selectMtBoard(int mtboardNo);

	// 게시글 삽입
	public void insertBoard(MtBoard mtBoard);
	
	// 첨부파일 삽입
	public void insertFile(FileUpload fileUpload);

	// 게시글 번호 -> 첨부파일
	public FileUpload selectMtBoardFileByBoardNo(int mtboardNo);

	// 파일 번호 -> 첨부파일
	public FileUpload selectBoardFileByFileNo(FileUpload fileUpload);

	public HashMap<String, Object> mtBoardView(MtBoard mtBoard);

	public void updateMtBoard(MtBoard mtBoard);

	public void deleteFile(MtBoard mtBoard);

	public void deleteMtBoard(MtBoard mtBoard);

	
	// 찜하기
	public int selectCntMark(MtMark mtMark);

	public void deleteMark(MtMark mtMark);

	public void inserMark(MtMark mtMark);

	public int getTotalCntMark(MtMark mtMark);

	// 찜하기 수
	public void mntBoardLike(MtBoard viewBoard);
	
	
	
	
	// 검색
	public List<HashMap<String, Object>> getSearchList(HashMap<String, Object> map);

	public int cntSearchList(HashMap<String, Object> map);

	

	
	
	
//	// 멘토지원
//	public void applyMt(ApplyMt applyMt);
//	/* public void applyMt(MtBoard mtBoard); */
//
//	// 멘토링신청
//	public void applyMnt(ApplyMnt applyMnt);
//	/* public void applyMnt(MtBoard mtBoard); */

	
	// 리뷰
	//public int CntReview(int mtboardNo);
	
	//public List<HashMap<String, Object>> reviewList(HashMap<String, Object> map);


	//public void mtBoardRvw(int mtboardNo);
	
	
}
