package dao.face;

import java.util.List;

import dto.Mboard;
import util.Paging;

public interface MboardDao {
	
	/**
	 * 전체 게시글 수 조회
	 * @return 총 게시글 수
	 */
	public int selectCntAll();
	
	/**
	 * 페이징 적용하여 게시글 목록 조회
	 * @param paging
	 * @return
	 */
	List<Mboard> selectList(Paging paging);


}
