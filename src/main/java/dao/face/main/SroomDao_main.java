package dao.face.main;

import java.util.HashMap;
import java.util.List;

import dto.FileUpload;
import dto.StudyRoom;

public interface SroomDao_main {

	/**
	 * 스터디룸 게시글 목록 조회
	 * 
	 * @param studyroom 
	 * @return - 게시글 목록
	 */
	public List<StudyRoom> srList(StudyRoom studyroom);
	
	/**
	 * 게시글 번호를 이용하여 첨부파일 정보를 조회한다
	 * 
	 * @param studyroom - 조회할 게시글 번호
	 * @return 조회된 첨부파일 정보
	 */
	public FileUpload selectFileBySroomNo(StudyRoom studyroom);

	//테스트
//	public List<HashMap<String, Object>> selectSroomFile();

}
