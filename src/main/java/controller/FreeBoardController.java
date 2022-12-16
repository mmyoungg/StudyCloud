package controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dto.Commt;
import dto.FileUpload;
import dto.FreeBoard;
import service.face.FreeBoardService;
import util.CmtPaging;
import util.Paging;

@Controller
public class FreeBoardController {
	
	private Logger logger = LoggerFactory.getLogger(FreeBoardController.class);
	
	@Autowired FreeBoardService freeBoardService;
	
	@RequestMapping("/freeBoard/list")
	public void list(Model model, @RequestParam(defaultValue="0") int curPage) {
		
		CmtPaging paging = freeBoardService.getPaging(curPage);
		model.addAttribute("paging", paging);
		
		List<HashMap<String, Object>> list = freeBoardService.getList(paging);
		for( HashMap<String, Object> board : list )	logger.info("{}", board );
		model.addAttribute("fBoardList", list);
		
	}
	
	// AJAX 페이징 메소드
	@RequestMapping("/freeBoard/listAjax")
	public void fBoardlistAjax(int curPage, Model model) {
		
		CmtPaging paging = freeBoardService.getPaging(curPage);		
		model.addAttribute("paging", paging);
		List<HashMap<String, Object>> list = freeBoardService.getList(paging);
		model.addAttribute("fBoardList", list);
		
	}
	
	@RequestMapping("/freeBoard/view")
	public void view(@RequestParam(defaultValue="1") Integer curPage, Integer fBoardNo, Model model) {
		
		HashMap<String, Object> freeBoardView = freeBoardService.view(fBoardNo);
		model.addAttribute("fBoardView", freeBoardView);
		
		List<HashMap<String, Object>> fileupload = freeBoardService.getAttachFile(fBoardNo);
		model.addAttribute("fileUpload", fileupload);
		
		Map<String, Object> map = new HashMap<>();
		
		CmtPaging paging = freeBoardService.getCmtPaging(curPage, fBoardNo);
		
		int startNo = paging.getStartNo();
		int endNo = paging.getEndNo();
		model.addAttribute("paging", paging);
		
		map.put("fBoardNo", fBoardNo);
		map.put("startNo", startNo);
		map.put("endNo", endNo);
		
		List<HashMap<String, Object>> list = freeBoardService.getCmtList(map);
		model.addAttribute("fBaordCmt", list);
		
	}
	
	
	@RequestMapping(value="/freeBoard/write", method=RequestMethod.GET)
	public void write(HttpSession session) {
		int memberNo = (int)session.getAttribute("member_no");
		String memberNick = freeBoardService.getUserNick(memberNo);
		session.setAttribute("member_nick", memberNick);
	}
	
	@RequestMapping(value="/freeBoard/write", method=RequestMethod.POST)
	public String fBoardWriteProc(FreeBoard freeBoard, List<MultipartFile> fBoardFile, HttpSession session) {
		
		freeBoard.setMemberNo( (int)session.getAttribute("member_no") );
		freeBoardService.write(freeBoard, fBoardFile);
		
		return "redirect:/freeBoard/list";
	}
	
	@RequestMapping(value="/freeBoard/update", method=RequestMethod.GET)
	public void update(int fBoardNo, Model model) {
		
		HashMap<String, Object> freeBoardView = freeBoardService.view(fBoardNo);
		model.addAttribute("updateView", freeBoardView);
		
		List<HashMap<String, Object>> fileupload = freeBoardService.getAttachFile(fBoardNo);
		model.addAttribute("fileUpload", fileupload);
	}
	
	@RequestMapping(value="/freeBoard/update", method=RequestMethod.POST)
	public String updateProc(FreeBoard freeBoard, List<MultipartFile> fBoardFile) {
		
		freeBoardService.update(freeBoard, fBoardFile);
		return "redirect:/freeBoard/list";
	}
	
	
	@RequestMapping("/freeBoard/download")
	public String download(FileUpload fileUpload, Model model) {
		
		fileUpload = freeBoardService.getFile(fileUpload);
		logger.info("fileUpload : {} ", fileUpload);
		model.addAttribute("downFile", fileUpload);
		
		return "down";
	}
	
	@RequestMapping("/freeBoard/delete")
	public String delete(FreeBoard freeBoard) {
		
		freeBoardService.delete(freeBoard);
		
		return "redirect:/freeBoard/list";
	}
	
	@RequestMapping("/freeBoard/display")
	public ResponseEntity<byte[]> display(String fileUploadStor) {
		
		logger.info("/freeBoard/display [GET] filename : {}", fileUploadStor);
		
		ResponseEntity<byte[]> result = null;
		try {
			String srcFileName = URLDecoder.decode(fileUploadStor, "UTF-8");
			logger.info("fileUploadStor : {}", srcFileName);
		
			String uploadPath = "C:\\Users\\82108\\workspace_sts\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\StudyCloud\\upload\\";
			File file = new File(uploadPath+File.separator+srcFileName);
			logger.info("file : {}", file);
			HttpHeaders header = new HttpHeaders();
			
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			 
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK); 
			
			
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	//-----------------------------------댓글 CURD-----------------------------------
	
	@RequestMapping("/freeBoard/cmtListAjax")
	public void fBoardCmtListAjax(@RequestParam(defaultValue="1") Integer curPage, Integer fBoardNo, Model model) {
		
		Map<String, Object> map = new HashMap<>();
		
		CmtPaging paging = freeBoardService.getCmtPaging(curPage, fBoardNo);
		int startNo = paging.getStartNo();
		int endNo = paging.getEndNo();
		model.addAttribute("paging", paging);
		
		map.put("fBoardNo", fBoardNo);
		map.put("startNo", startNo);
		map.put("endNo", endNo);
		
		int CmtCount = freeBoardService.getCmtCount(fBoardNo);
		model.addAttribute("fBaordCmtCount", CmtCount);
		
		List<HashMap<String, Object>> list = freeBoardService.getCmtList(map);
		model.addAttribute("fBaordCmt", list);
		
	}
	
	@RequestMapping(value="/freeBoard/cmtInsert", method=RequestMethod.POST)
	public String cmtInsert(int fBoardNo, String commtContent, HttpSession session, Model model) {
		
		Commt commt = new Commt();
		commt.setfBoardNo(fBoardNo);
		commt.setCommtContent(commtContent);
		commt.setMemberNo( (int)session.getAttribute("member_no") );
		Commt fBoardCmt = freeBoardService.insertCmt(commt);
		
		return "/freeBoard/cmtListAjax";
		
	}
	
	@RequestMapping(value="/freeBoard/cmtUpdate", method=RequestMethod.POST)
	public String cmtUpdate(int commtNo, String commtContent) {
		
		Commt commt = new Commt();
		commt.setCommtNo(commtNo);
		commt.setCommtContent(commtContent);
		freeBoardService.updateCmt(commt);
		
		return "/freeBoard/cmtListAjax";
		
	}
	
	@RequestMapping(value="/freeBoard/cmtDelete", method=RequestMethod.POST)
	public String cmtDelete(int commtNo) {
		
		freeBoardService.deleteCmt(commtNo);
		return "/freeBoard/cmtListAjax";
		
	}
	
	//-----------------------------------검색-----------------------------------
	
	@RequestMapping(value="/freeBoard/search", method=RequestMethod.POST)
	public String searchProc(Model model, @RequestParam(value="searchArr[]") List<String> searchArr, 
							String searchKeyword, @RequestParam(defaultValue="1") Integer curPage) { // 프론트단에서 배열로 보내줬을때 List<>로 받아야한다.
		
		// List를 Map에 담기
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", searchArr); // 체크박스 값 담긴 List
		map.put("keyword", searchKeyword); // 검색 키워드
		map.put("curPagee", curPage); // 페이징처리를 위한 현재페이지
		
		CmtPaging paging = freeBoardService.getSearchPaging(map);
		int startNo = paging.getStartNo();
		int endNo = paging.getEndNo();
		int totalCount = paging.getTotalCount();
		int totalPage = paging.getTotalPage();
		
		map.put("startNo", startNo);
		map.put("endNo", endNo);
		
		List<HashMap<String, Object>> list = freeBoardService.getSearchList(map);
		model.addAttribute("paging", paging);
		
		// --test--
		List<String> searchType = (List<String>)map.get("list");
		String sKeyword = (String)map.get("keyword");
		//---------
		
		map.get("searchKeyword");
		model.addAttribute("fBoardSearchList", list);
		model.addAttribute("checked", searchType);
		model.addAttribute("keyword", sKeyword);
		
		return "/freeBoard/SearchListAjax";
		
	}
	
	
	@RequestMapping("/freeBoard/test")
	public void test() {}
	
	
}
