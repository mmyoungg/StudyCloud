package dao.face.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface MtBoardDao_main {

	//메인페이지
	
	/**
	 * 게시글 번호를 이용해 첨부파일 함께 조회한다
	 * 
	 * @return - 게시글 + 첨부파일
	 */
	public List<Map<String, Object>> selectMtList();

	/**
	 * 게시글 번호를 이용해 회원정보를 조회한다
	 * 
	 * @return - 게시글 + 작성자 정보
	 */
	public List<HashMap<String, Object>> selectMtReviewList();

}
