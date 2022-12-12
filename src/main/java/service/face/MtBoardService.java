package service.face;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import dto.FileUpload;
import dto.MntBoard;
import dto.MtBoard;
import util.CommtPaging;
import util.Paging;

public interface MtBoardService {

	
	public Paging getPaging(int curPage);

	public List<HashMap<String, Object>> list(Paging paging);

	public HashMap<String, Object> view(MtBoard viewBoard);

	public void write(MtBoard mtBoard, MultipartFile file);
	
	public FileUpload getAttachFile(MtBoard viewBoard);

	public FileUpload getFile(FileUpload fileUpload);

	public HashMap<String, Object> updateBoard(MtBoard mtBoard);

	public void update(MtBoard mtBoard, MultipartFile file);

	public void delete(MtBoard mtBoard);

	public void applyMt(MtBoard mtBoard);

	// 멘토링신청
	public void applyMnt(MtBoard mtBoard);

	// 후기
	//public CommtPaging getCommtPaging(int curPage, int mtboardNo);

	//public List<HashMap<String, Object>> reviewList(CommtPaging reviewPaging, int mtboardNo);

	//public int getCntReview(int mtboardNo);

	//public void mtBoardRvw(int mtboardNo);



	
}
