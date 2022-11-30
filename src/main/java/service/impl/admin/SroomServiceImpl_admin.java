package service.impl.admin;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.face.admin.SroomDao_admin;
import dto.FileUpload;
import dto.StudyRoom;
import service.face.admin.SroomService_admin;

@Service
public class SroomServiceImpl_admin implements SroomService_admin {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SroomDao_admin sRoomDao_admin;
	
	@Autowired ServletContext context; //파일 업로드

	@Override
	public void write(StudyRoom studyroom, MultipartFile file) {
		
		//게시글 처리
		
		sRoomDao_admin.insertsRoom(studyroom);

		//--------------
		
		//첨부파일 처리

		//빈 파일 경우
		if( file.getSize() <= 0 ) {
			
			return;
		}
		
		//파일이 저장될 경로
		String storedPath = context.getRealPath("upload");
		File storedFolder = new File( storedPath );
		
		//폴더 없을 경우 생성
		if( !storedFolder.exists() ) {
			storedFolder.mkdir();
		}
		
		//파일이 저장될 이름
		String originName = file.getOriginalFilename();
		String storedName = originName + UUID.randomUUID().toString().split("-")[4];
		
		//저장할 파일의 정보 객체
		File dest = new File( storedFolder, storedName );
		
		try {
			file.transferTo(dest);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	
		//--------------------------------------------------------------------------
		
		//첨부파일 정보 DB 기록
		FileUpload sRoomFile = new FileUpload();
		sRoomFile.setSroom_no( studyroom.getsRoom_no() );
		sRoomFile.setFileUpload_ori(originName);
		sRoomFile.setFileUpload_stor(storedName);
		
		sRoomDao_admin.insertFile(sRoomFile);
		
	}


}
