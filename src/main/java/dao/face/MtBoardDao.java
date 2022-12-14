package dao.face;

import java.util.HashMap;
import java.util.List;

import dto.ApplyMnt;
import dto.ApplyMt;
import dto.FileUpload;
import dto.MtBoard;
import util.Paging;

public interface MtBoardDao {

	// 게시글 수 
	public int CntMtBaord();

	// 페이징 게시글 목록
	public List<HashMap<String, Object>> MtBoardList(Paging paging);

	// 조회수 증가
	public void mtBoardHit(MtBoard viewBoard);

	// 게시글 조회
	public HashMap<String, Object> selectMtBoard(MtBoard viewBoard);

	// 게시글 삽입
	public void insertBoard(MtBoard mtBoard);
	
	// 첨부파일 삽입
	public void insertFile(FileUpload fileUpload);

	// 게시글 번호 -> 첨부파일
	public FileUpload selectMtBoardFileByBoardNo(MtBoard viewBoard);

	// 파일 번호 -> 첨부파일
	public FileUpload selectBoardFileByFileNo(FileUpload fileUpload);

	public HashMap<String, Object> mtBoardView(MtBoard mtBoard);

	public void updateMtBoard(MtBoard mtBoard);

	public void deleteFile(MtBoard mtBoard);

	public void deleteMtBoard(MtBoard mtBoard);

	// 멘토지원
	public void applyMt(ApplyMt applyMt);
	/* public void applyMt(MtBoard mtBoard); */

	// 멘토링신청
	public void applyMnt(ApplyMnt applyMnt);
	/* public void applyMnt(MtBoard mtBoard); */



	
	// 리뷰
	//public int CntReview(int mtboardNo);
	
	//public List<HashMap<String, Object>> reviewList(HashMap<String, Object> map);


	//public void mtBoardRvw(int mtboardNo);
	
	
}
