package dao.face;

import java.util.HashMap;
import java.util.List;

import dto.FileUpload;
import dto.Mboard;
import util.Paging;

public interface MboardDao {
	
	/**
	 * 전체 게시글 수 조회
	 * @return 총 게시글 수
	 */
	public int selectCntAll();
	
//	/**
//	 * 페이징 적용하여 게시글 목록 조회
//	 * @param paging
//	 * @return
//	 */
//	List<Mboard> selectList(Paging paging);

	public List<HashMap<String, Object>> selectMboardHash(Paging paging);
	
	/**
	 * mboardno로 게시글 상세 조회
	 * @param mboardNo
	 * @return
	 */
	public HashMap<String, Object> selectMboardByMboardNo(int mboardNo);
	
	/**
	 * 조회수 +1 증가
	 * @param detailMboard
	 */
	public void updateHit(Mboard detailMboard);
	
	/**
	 * 
	 * @param detailMboard
	 * @return
	 */
	public HashMap<String, Object> selectMboard(Mboard detailMboard);
	/**
	 * 게시글 등록(삽입)
	 * @param mboard - 삽입할 게시글 정보
	 */
	public void insertMboard(Mboard mboard);
	
	/**
	 * 첨부파일 정보 삽입
	 * @param fileUpload
	 */
	public void insertFile(FileUpload fileUpload);

	/**
	 * 게시글 번호 이용하여 첨부파일 정보 조회
	 * @param detailMboard
	 * @return
	 */
	public FileUpload selectMboardFileByMboardNo(Mboard detailMboard);
	
	/**
	 * 파일번호 이용하여 첨부파일 정보 조회
	 * @param fileUpload
	 * @return
	 */
	public FileUpload selectMboardFileByFileUploadNo(FileUpload fileUpload);
	
	/**
	 * 게시글 수정
	 * @param mboard
	 */
	public void updateMboard(Mboard mboard);
	
	/**
	 * 첨부파일 삭제
	 * @param mboard
	 */
	public void deleteFile(Mboard mboard);
	
	/**
	 * 게시글 삭제
	 * @param mboard
	 */
	public void deleteMboard(Mboard mboard);

}
