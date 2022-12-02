package service.face;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import dto.FileUpload;
import dto.Mboard;
import util.Paging;

public interface MboardService {
	
	/**
	 * 게시글 목록 페이징 객체 생성
	 * 
	 * @param curPage - 요청 페이지 번호
	 * @return 계산 완료 된 Paging 객체
	 */
	public Paging getPaging(int curPage);
	
	/**
	 * 페이징 적용 된 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징 적용 된 게시글 목록
	 */
	public List<Mboard> list(Paging paging);
	
	/**
	 * 게시글 상세페이지
	 * 
	 * @param detailMboard - 상세 조회 할 게시글 번호 객체
	 * @return 조회된 상세 게시글 객체
	 */
	public Mboard detail(Mboard detailMboard);

	public FileUpload getAttachFile(Mboard detailMboard);

	public void write(Mboard mboard, MultipartFile file);



}
