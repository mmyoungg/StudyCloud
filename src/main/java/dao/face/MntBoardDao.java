package dao.face;

import java.util.HashMap;
import java.util.List;

import dto.FileUpload;
import dto.MntBoard;
import util.Paging;

public interface MntBoardDao {

	/**
	 *  게시글 수 전체 조회
	 * 
	 * @return 총 게시글 수
	 */
	public int CntBoard();

	/**
	 * 페이징이 적용된 게시글 목록 조회
	 * 
	 * @param paging
	 * @return
	 */
	public List<HashMap<String, Object>> MntBoardList(Paging paging);


	/**
	 * 조회수 증가
	 * @param viewBoard
	 */
	public void mntBoardHit(MntBoard viewBoard);

	
	/**
	 * 글번호를 이용해서 게시글 조회
	 * 
	 * @param viewBoard - 조회 할 글번호
	 * @return 조회된 글정보
	 */
	public HashMap<String, Object> selectMntBoard(MntBoard viewBoard);

	
	/**
	 * 게시글 정보 삽입
	 * 
	 * @param mntBoard - 삽입할 게시글 정보
	 */
	public void insertBoard(MntBoard mntBoard);

	
	
	/**
	 * 첨부파일 정보 삽입
	 * 
	 * @param mntBoardFile
	 */
	public void insertFile(FileUpload fileUpload);

	
	/**
	 * 게시글 번호 이용해서 첨부파일 정보 조회
	 * 
	 * @param viewBoard 조회할 게시글 번호
	 * @return 조회된 첨부파일 정보
	 */
	public FileUpload selectMntBoardFileByBoardNo(MntBoard viewBoard);

	
	/**
	 * 파일 번호를 이용 -> 첨부파일 정보 조회
	 * 
	 * @param fileUpload 조회 할 첨부파일
	 * @return 조회된 첨부파일 
	 */
	public FileUpload selectBoardFileByFileNo(FileUpload fileUpload);


	
	
	
	
	
	
}











