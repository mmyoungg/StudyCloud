package dao.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dto.Commt;
import dto.FileUpload;
import dto.FreeBoard;
import util.CmtPaging;

public interface FreeBoardDao {
	
	public int countBoard();

	public List<HashMap<String, Object>> getListWithPaging(CmtPaging paging);

	public void plusHit(int fBoard_no);

	public HashMap<String, Object> ViewfBoardByfBoardNo(int fBoard_no);

	public void fBoardInsert(FreeBoard freeBoard);

	public void insertFile(FileUpload fileUpload);

	public List<HashMap<String, Object>> selectFileByfBoardNo(int fBoard_no);

	public HashMap<String, Object> getDetailViewByfBoardNo(FreeBoard freeBoard);

	public FileUpload selectUploadFileByFileNo(FileUpload fileUpload);

	public void updateFreeBoard(FreeBoard freeBoard);

	public void deleteFile(FreeBoard freeBoard);

	public void deleteByfBoardNo(FreeBoard freeBoard);

	
	
	public List<Map<String, Object>> detailFile(FreeBoard freeBoard);

	public List<HashMap<String, Object>> getfBoardCmtList(Map<String, Object> map);

	public int countBoardCmt(Integer fBoardNo);

	public void insertCmtfBoard(Commt commt);
	
	// 삽입된 댓글 조회
	public Commt selectCmtByCmtNo(int commtNo);

	public void updateCmtfBoard(Commt commt);

	public void deleteCmtfBoard(int commtNo);

	public List<HashMap<String, Object>> getfBoardSearchList(HashMap<String, Object> map);

	public int countSearchList(HashMap<String, Object> map);

	public void deleteComtByFboardNo(FreeBoard freeBoard);

	public String getNickByMemberNo(int memberNo);

	




}
