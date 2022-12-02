package dao.face.admin;

import java.util.List;

import dto.FileUpload;
import dto.StudyRoom;
import util.Paging;

public interface SroomDao_admin {
	
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
	public List<StudyRoom> selectList(Paging paging);

	/**
	 * 게시글 정보를 삽입한다
	 * 
	 * @param studyroom - 삽입할 스터디룸 정보
	 */
	public void insertsRoom(StudyRoom studyroom);
	
	/**
	 * 스터디룸 첨부파일 정보를 삽입한다
	 * 
	 * @param fileUpload
	 */
	public void insertFile(FileUpload fileUpload);


	

}
