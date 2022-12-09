package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dto.SroomQna;
import service.face.SRoomService;
import util.CmtPaging;

@Controller
public class StudyRoomController {
	
	private Logger logger = LoggerFactory.getLogger(StudyRoomController.class);
	@Autowired SRoomService sRoomService;
	
	@RequestMapping("/sRoom/list")
	public void list(Model model, @RequestParam(defaultValue="1") int curPage) {
		
		logger.info("/sRoom/list [GET]");
		
		CmtPaging paging = sRoomService.getPaging(curPage);
		System.out.println(paging);
		model.addAttribute("paging", paging);
				
		List<HashMap<String, Object>> sRoomList = sRoomService.getsRoomList(paging);
		model.addAttribute("sRoomList", sRoomList);
	}
	
	@RequestMapping("/sRoom/sRoomListAjax")
	public void sRoomPagingList(int curPage, Model model) {
		
		logger.info("/sRoom/sRoomListAjax [GET] 호출, curPage : {}", curPage);
		
		CmtPaging paging = sRoomService.getPaging(curPage);	
		model.addAttribute("paging", paging);
		List<HashMap<String, Object>> sRoomList = sRoomService.getsRoomList(paging);
		model.addAttribute("sRoomList", sRoomList);
		
	}
	
	// 지역선택 조건 조회
	@RequestMapping(value="/sRoom/locSearch", method=RequestMethod.POST)
	public String sRoomLocSearch(Model model, String sRoomLoc, @RequestParam(defaultValue="1") Integer curPage) {
		logger.info("/sRoom/locSearch [POST] 호출, 지역 : {}", sRoomLoc);
		logger.info("/sRoom/locSearch [POST] 호출, 페이지번호 : {}", curPage);
		
		HashMap<String, Object> getPagingMap = new HashMap<>();
		getPagingMap.put("sRoomLoc", sRoomLoc);
		getPagingMap.put("locCurpage", curPage);
		CmtPaging LocSearchpaging = sRoomService.getPaging(getPagingMap);	
		System.out.println(" 지역검색 페이징 결과 : " + LocSearchpaging);
		
		int startNo = LocSearchpaging.getStartNo();
		int endNo = LocSearchpaging.getEndNo();
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("paging", getPagingMap);
		map.put("sRoomLoc", sRoomLoc);
		map.put("startNo", startNo);
		map.put("endNo", endNo);
		
		List<HashMap<String, Object>> locSearchList = sRoomService.getListByLocation(map);
		model.addAttribute("sRoomLocSearchList", locSearchList);
		model.addAttribute("paging", LocSearchpaging);
		model.addAttribute("sRoomLoc", sRoomLoc);
		
		return "/sRoom/locSearch";
	}
	
	// 인원수 조건 조회
	@RequestMapping(value="/sRoom/peopleSearch", method=RequestMethod.POST)
	public String sRoomPeopleSearch(Model model, Integer sRoompNum, @RequestParam(defaultValue="1") Integer curPage) {
		logger.info("/sRoom/peopleSearch [POST] 호출, 인원수 : {}", sRoompNum);
		logger.info("/sRoom/peopleSearch [POST] 호출, 페이지번호 : {}", curPage);
		
		HashMap<String, Object> getPagingMap = new HashMap<>();
		getPagingMap.put("sRoompNum", sRoompNum);
		getPagingMap.put("pNumCurpage", curPage);
		CmtPaging pNumSearchpaging = sRoomService.getPagingWithPnum(getPagingMap);	
		System.out.println(" 지역검색 페이징 결과 : " + pNumSearchpaging);
		
		int startNo = pNumSearchpaging.getStartNo();
		int endNo = pNumSearchpaging.getEndNo();
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("paging", getPagingMap);
		map.put("sRoompNum", sRoompNum);
		map.put("startNo", startNo);
		map.put("endNo", endNo);
		
		List<HashMap<String, Object>> pNumSearchList = sRoomService.getListByPeople(map);
		model.addAttribute("sRoomPeopleSearchList", pNumSearchList);
		model.addAttribute("paging", pNumSearchpaging);
		model.addAttribute("sRoompNum", sRoompNum);
		
		return "/sRoom/peopleSearch";
	}
	
	// 정렬
	@RequestMapping(value="/sRoom/seletedSort", method=RequestMethod.POST)
	public void sRoomSort(int selectNum, @RequestParam(defaultValue="1") Integer curPage) {
		logger.info("/sRoom/seletedSort [POST] 호출, selectNum : {}", selectNum);
		
		CmtPaging paging = sRoomService.getPaging(curPage);
		
//		if ( selectNum == 1 ) { // 최신순
//			
//		} else if ( selectNum == 2 ) { // 인기순(좋아요 많은순)
//		
//		} else if ( selectNum == 3 ) { // 평점순
//			
//		} else if ( selectNum == 4 ) { // 낮은가격순
//			
//		} else if ( selectNum == 5 ) { // 높은가격순
//			
//		}
		
		
		
	}
	
	//------------------------------상세페이지------------------------------
	
	// 메인
	@RequestMapping("/sRoom/detail")
	public void detail(int sRoomNo, Model model) {
		logger.info("/sRoom/detail [GET] 호출, sRoomNo : {}", sRoomNo);
		
		HashMap<String, Object> map = sRoomService.getDetail(sRoomNo);
		model.addAttribute("sRoomView", map);
		
		// Qna 리스트 불러오기
		List<HashMap<String, Object>> qnaList = sRoomService.getQnaList(sRoomNo);
		model.addAttribute("qnaList", qnaList);
		
	}
	
	// QnA 등록
	@RequestMapping(value="/sRoom/qnaInsert", method=RequestMethod.POST)
	public String sRoomQnAInsertProc
				(Model model, String sRoomQnATitle, String sRoomQnAContent, int sRoomQnaSecret, int sRoomNo, HttpSession session) {
		logger.info("/sRoom/qnaInsert [POST] 호출, sRoomQnATitle : {}", sRoomQnATitle);
		logger.info("/sRoom/qnaInsert [POST] 호출, sRoomQnAContent : {}", sRoomQnAContent);
		logger.info("/sRoom/qnaInsert [POST] 호출, sRoomQnaSecret : {}", sRoomQnaSecret);
		logger.info("/sRoom/qnaInsert [POST] 호출, sRoomNo : {}", sRoomNo);
		
		//memberNo 구현시 수정
		session.setAttribute("member_no", 4);
		sRoomService.insertQna(sRoomQnATitle, sRoomQnAContent, sRoomQnaSecret, sRoomNo, session);
		
		List<HashMap<String, Object>> qnaList = sRoomService.getQnaList(sRoomNo);
		model.addAttribute("qnaList", qnaList);
		
		return "/sRoom/sRoomQnaList";
	}
	
	public void sRoomQnaList() {
		
		
	}
	
	
	
	
	@RequestMapping("/sRoom/payResult")
	public void pay() {}
	
	@RequestMapping("/sRoom/reserve")
	public void reserve() {}
	
	@RequestMapping("/sRoom/insert")
	public void insert() {}
	
}
