package service.face;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import dto.ApplyMnt;
import dto.ApplyMt;
import dto.FileUpload;
import dto.MtBoard;
import dto.MtMark;
import util.CommtPaging;
import util.PagingVUp;

public interface MtBoardService {

	
	public PagingVUp getPaging(Map<String, Object> map, int curPage);

	public List<HashMap<String, Object>> list(Map<String, Object> map);

	public List<HashMap<String, Object>> list(PagingVUp paging);
	
	public HashMap<String, Object> view(int viewBoardNo);

	public void write(MtBoard mtBoard, MultipartFile file);
	
	// 첨부파일
	public FileUpload getAttachFile(int viewBoardNo);
	public FileUpload getFile(FileUpload fileUpload);

	
	public HashMap<String, Object> updateBoard(MtBoard mtBoard);

	public void update(MtBoard mtBoard, MultipartFile file);

	public void delete(MtBoard mtBoard);
	

	
	// 찜하기
	public boolean mark(MtMark mtMark);
	
	public boolean mtboardMark(MtMark mtMark);
	
	public int getTotalCntMark(MtMark mtMark);
	
	
	
	
	// 검색
	public List<HashMap<String, Object>> getSearchList(HashMap<String, Object> map);
	
	public CommtPaging getSearchPaging(HashMap<String, Object> map);





	
	
	
	
	
	
	
	

//	public void applyMt(ApplyMt applyMt);
//	
//	// 멘토링신청
//	public void applyMnt(ApplyMnt applyMnt);

	// 후기
	//public CommtPaging getCommtPaging(int curPage, int mtboardNo);

	//public List<HashMap<String, Object>> reviewList(CommtPaging reviewPaging, int mtboardNo);

	//public int getCntReview(int mtboardNo);

	//public void mtBoardRvw(int mtboardNo);



	
}
