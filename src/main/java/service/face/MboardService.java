package service.face;

import java.util.HashMap;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import dto.FileUpload;
import dto.Mboard;
import dto.MboardLike;
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
	 * 해쉬맵으로 리스트 객체 생성(mboard main)
	 * @param paging
	 * @return
	 */
	public List<HashMap<String, Object>> selectMboardHash(Paging paging);
	
	/**
	 * 번개게시글 번호로 상세페이지 조회
	 * @param detailMboard - 게시글 번호
	 * @return 조회된 상세 게시글 객체
	 */
	public HashMap<String, Object> detail(Mboard detailMboard);

//	/**
//	 * 첨부파일
//	 * @param mboard
//	 * @return
//	 */
//	public FileUpload getAttachFile(HashMap<String, Object> detailmboard);
	
	/**
	 * 파일 번호 이용하여 업로드된 파일 정보 조회
	 * @param fileUpload
	 * @return
	 */
	public FileUpload getFile(FileUpload fileUpload);
	
	/**
	 * 게시글 번호 이용하여 업로드 된 파일 정보 조회
	 * @param mboard
	 * @return
	 */
	public FileUpload getAttachFile(Mboard mboard);
	
	/**
	 * 게시글 작성, 첨부파일도 함께 처리
	 * @param mboard
	 * @param file
	 * @return
	 */
	public void write(Mboard mboard, MultipartFile file);

	/**
	 * 게시글 수정
	 * @param mboard
	 * @param file
	 * @return
	 */
	public void update(Mboard mboard, MultipartFile file);
	
//	/**
//	 * 게시글 삭제
//	 * @param mboard_no
//	 * @return
//	 */
//	public HashMap<String, Object> delete(Mboard mboard);


	public void delete(Mboard mboard);

	//------------------------------------------------------------------------
	
	/**
	 * 좋아요 기능
	 * @param mboardLike
	 */
	public void setMboardLike(MboardLike mboardLike);

	
	






}
