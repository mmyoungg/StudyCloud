package dao.face.main;

import java.util.HashMap;
import java.util.List;

public interface SboardDao_main {

	/**
	 * 스터디 게시글 목록 조회
	 * 
	 * @return - 게시글 목록
	 */
	public List<HashMap<String, Object>> sList();

}
