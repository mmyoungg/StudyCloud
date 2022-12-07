package dao.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dto.FileUpload;
import dto.FreeBoard;
import util.Paging;

public interface FreeBoardDao {

	public int countBoard();

	public List<HashMap<String, Object>> getListWithPaging(Paging paging);

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




}
