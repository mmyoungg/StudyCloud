package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import dao.face.admin.SroomDao_admin;
import dao.face.main.MtBoardDao_main;
import dao.face.main.SboardDao_main;
import dto.FileUpload;
import dto.StudyRoom;
import service.face.admin.SroomService_admin;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired MtBoardDao_main mtBoardDao_main;
	@Autowired SboardDao_main sBoardDao_main;
	@Autowired SroomDao_admin sRoomDao_admin;
	@Autowired SroomService_admin sRoomService_admin;
	
	@RequestMapping("/mainpage")
	public void main(StudyRoom studyroom, FileUpload fileupload, MultipartFile file, Model model) {
		
		logger.info("/main [GET]");
		
		//인기멘토링
		List<HashMap<String, Object>> mtList = mtBoardDao_main.mtList();
		
		model.addAttribute("mtList", mtList);
		
		
		//마감임박 스터디
		List<HashMap<String, Object>> sList = sBoardDao_main.sList();
		
		model.addAttribute("sList", sList);
		
		
		//인기 스터디룸
//		FileUpload sRoomFile = sRoomService_admin.getAttachFile(studyroom);
//		model.addAttribute("sRoomFile", sRoomFile);
//
//		List<StudyRoom> srList = sRoomDao_admin.srlist(studyroom);
//		model.addAttribute("srList", srList);
		
		//테스트
//		List<HashMap<String, Object>> srListFile = sRoomService_main.srListFile();
//		model.addAttribute("srListFile", srListFile);
		
//		Map<String,Object> map = new HashMap<>();
//		map.put("StudyRoom", studyroom);
//		map.put("FileUpload", fileupload);
		
//		map = sRoomDao_admin.selectMap();
		
		List<Map<String, Object>> srList = sRoomService_admin.srListWithFile(studyroom);
		
		logger.info("srList : {}", srList);
		
		model.addAttribute("srList",srList);
		
		
		
		
		
		
		
		
		
		//멘토링 리뷰(최신순 정렬)
		List<HashMap<String, Object>> mtReviewList = mtBoardDao_main.mtReviewList();
		
		model.addAttribute("mtReviewList", mtReviewList);
		

	}
	
}
