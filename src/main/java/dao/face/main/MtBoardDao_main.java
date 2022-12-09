package dao.face.main;

import java.util.HashMap;
import java.util.List;

public interface MtBoardDao_main {

	/**
	 * 멘토링 게시글 목록 조회
	 * 
	 * @return - 게시글 목록
	 */
	public List<HashMap<String, Object>> mtList();

	/**
	 * 멘토링 리뷰 목록 조회
	 * 
	 * @return - 리뷰 목록
	 */
	public List<HashMap<String, Object>> mtReviewList();

}
