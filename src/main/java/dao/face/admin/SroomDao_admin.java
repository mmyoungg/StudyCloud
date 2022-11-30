package dao.face.admin;

import dto.FileUpload;
import dto.StudyRoom;

public interface SroomDao_admin {
	
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
