package service.face.admin;

import org.springframework.web.multipart.MultipartFile;

import dto.StudyRoom;

public interface SroomService_admin {

	public void write(StudyRoom studyroom, MultipartFile file);

}
