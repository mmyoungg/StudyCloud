package service.face;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import dto.FileUpload;
import dto.FreeBoard;
import util.Paging;

public interface FreeBoardService {
	
	// 페이징 처리
	public Paging getPaging(int curPage);

	// 글목록 리스트
	public List<HashMap<String, Object>> getList(Paging paging);
	
	// 게시글 조회
	public HashMap<String, Object> view(int fBoard_no);
	
	// 게시글 작성
	public void write(FreeBoard freeBoard, MultipartFile fBoard_file);

	public FileUpload getAttachFile(int fBoard_no);



}
