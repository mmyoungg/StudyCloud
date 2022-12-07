package service.face;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	 * 게시글 상세 조회
	 * @param mboardNo - 게시글 번호로 상세 조회
	 * @return
	 */
	public HashMap<String, Object> detail(int mboardNo);
	
	/**
	 * 게시글 번호로 파일 첨부하기
	 * @param mboardNo
	 * @return
	 */
	public List<HashMap<String, Object>> getAttachFile(int mboardNo);

	/**
	 * 게시글 작성
	 * @param mboard
	 * @param file
	 * @return 
	 */
	public void write(Mboard mboard, MultipartFile file);

	/**
	 * 게시글 수정
	 * @param mboard
	 * @param file
	 */
	public void update(Mboard mboard, MultipartFile file);
	
	/**
	 * 첨부파일 불러오기
	 * @param fileUpload
	 * @return
	 */
	public FileUpload getFile(FileUpload fileUpload);

	/**
	 * 게시글 삭제
	 * @param mboard
	 */
	public void delete(Mboard mboard);

	/**
	 * 좋아요
	 * @param mboardLike
	 */
	public void setMboardLike(MboardLike mboardLike);
	
	
	


	
	

	
	






}
