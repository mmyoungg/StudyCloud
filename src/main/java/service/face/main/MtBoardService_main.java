package service.face.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import dto.MtBoard;

public interface MtBoardService_main {
	
	/**
	 * 게시글 번호를 이용해 첨부파일과 회원 정보를 함께 조회한다.
	 * 
	 * @param mtBoard - 게시글 번호
	 * @return 게시글 + 첨부파일 + 회원정보
	 */
	public List<Map<String, Object>> mtListWithFile(MtBoard mtBoard);

	/**
	 * 게시글 번호를 이용해 회원 정보를 조회한다
	 * 
	 * @param mtBoard - 게시글 번호
	 * @return 게시글 + 회원정보
	 */
	public List<HashMap<String, Object>> mtReivewList(MtBoard mtBoard);

}
