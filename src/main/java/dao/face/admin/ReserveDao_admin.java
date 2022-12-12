package dao.face.admin;

import java.util.HashMap;
import java.util.List;

import dto.Reservation;
import util.Paging;

public interface ReserveDao_admin {

	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @return - 총 게시글 수
	 */
	public int selectCntAll();

	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<HashMap<String, Object>> selectHash(Paging paging);

	/**
	 * 게시글 번호를 이용하여 게시글을 조회한다
	 * 
	 * @param selectReserve - 조회하려는 게시글 번호
	 * @return 조회된 게시글 정보
	 */
	public List<HashMap<String, Object>> selectReserve(Reservation res);
	
	/**
	 * 게시글 번호를 이용하여 게시글을 조회한다
	 * 
	 * @return 조회된 게시글 정보
	 */
	public List<HashMap<String, Object>> previewReserve();

	/**
	 * 키워드를 이용하여 검색한다
	 * 
	 * @param search_option - 검색할 키워드
	 * @return 조회된 게시글 목록
	 */
	public List<HashMap<String, Object>> searchReserve(String search_option);

}
