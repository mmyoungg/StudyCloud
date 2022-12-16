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
import org.springframework.web.bind.annotation.ResponseBody;

import dto.Reservation;
import dto.SroomMark;
import dto.StudyRoom;
import service.face.SRoomService;
import util.CmtPaging;

@Controller
public class StudyRoomController {

	private Logger logger = LoggerFactory.getLogger(StudyRoomController.class);
	@Autowired
	SRoomService sRoomService;
	
	// ------------------------------상세페이지------------------------------
	
	// 리스트 메인
	@RequestMapping("/sRoom/list")
	public void list(Model model, @RequestParam(defaultValue = "1") int curPage) {

		CmtPaging paging = sRoomService.getPaging(curPage);
		System.out.println(paging);
		model.addAttribute("paging", paging);

		List<HashMap<String, Object>> sRoomList = sRoomService.getsRoomList(paging);
		model.addAttribute("sRoomList", sRoomList);
		
		// 인기검색어 상위5개
		List<HashMap<String, Integer>> keywordList = sRoomService.getKeywordList();
		model.addAttribute("bestKeyword", keywordList);
		
	}
	
	@RequestMapping("/sRoom/sRoomListAjax")
	public void sRoomPagingList(int curPage, Model model) {

		CmtPaging paging = sRoomService.getPaging(curPage);
		model.addAttribute("paging", paging);
		List<HashMap<String, Object>> sRoomList = sRoomService.getsRoomList(paging);
		model.addAttribute("sRoomList", sRoomList);

	}

	// 지역선택 조건 조회
	@RequestMapping(value = "/sRoom/locSearch", method = RequestMethod.POST)
	public String sRoomLocSearch(Model model, String sRoomLoc, @RequestParam(defaultValue = "1") Integer curPage) {

		HashMap<String, Object> getPagingMap = new HashMap<>();
		getPagingMap.put("sRoomLoc", sRoomLoc);
		getPagingMap.put("locCurpage", curPage);
		CmtPaging LocSearchpaging = sRoomService.getPaging(getPagingMap);

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
	@RequestMapping(value = "/sRoom/peopleSearch", method = RequestMethod.POST)
	public String sRoomPeopleSearch(Model model, Integer sRoompNum, @RequestParam(defaultValue = "1") Integer curPage) {

		HashMap<String, Object> getPagingMap = new HashMap<>();
		getPagingMap.put("sRoompNum", sRoompNum);
		getPagingMap.put("pNumCurpage", curPage);
		CmtPaging pNumSearchpaging = sRoomService.getPagingWithPnum(getPagingMap);

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
	@RequestMapping(value = "/sRoom/seletedSort", method = RequestMethod.POST)
	public String sRoomSort(Integer selectNum, @RequestParam(defaultValue = "1") Integer curPage, Model model) {

		CmtPaging paging = sRoomService.getPaging(curPage);
		model.addAttribute("paging", paging);        
		
		// select 값으로 조회
		List<HashMap<String, Object>> sRoomList = sRoomService.getSelectedRoomList(paging, selectNum);
		model.addAttribute("sRoomList", sRoomList);
		
		return "/sRoom/sRoomListAjax";

	}
	
	// 스터디룸 리스트 통합검색
	@RequestMapping(value="/sRoom/totalSearch", method=RequestMethod.POST)
	public String sRoomTotalSearch(Model model, String keywordWord, HttpSession session, @RequestParam(defaultValue = "1") Integer curPage) {

		CmtPaging paging = sRoomService.getPaging(curPage);
		List<HashMap<String, Object>> list = sRoomService.keywordProc(keywordWord, session, paging);
		
		model.addAttribute("sRoomList", list);

		return "/sRoom/sRoomListAjax";
	}
	
	
	// 인기키워드 클릭 리스트
	@RequestMapping(value="sRoom/keywordSearch", method=RequestMethod.POST)
	public String bestKeywordSearch(Model model, String keywordWord, @RequestParam(defaultValue = "1") Integer curPage) {
		
		CmtPaging paging = sRoomService.getPaging(curPage);
		List<HashMap<String, Object>> clickList = sRoomService.keywordSearch(keywordWord, paging);
		model.addAttribute("sRoomList", clickList);
		return "/sRoom/sRoomListAjax";
	}
	

	// ------------------------------상세페이지------------------------------

	// 상세페이지(detail) 메인
	@RequestMapping("/sRoom/detail")
	public void detail(int sRoomNo, Model model, HttpSession session) {

		HashMap<String, Object> map = sRoomService.getDetail(sRoomNo);
		model.addAttribute("sRoomView", map);

		// Qna 리스트 불러오기
		List<HashMap<String, Object>> qnaList = sRoomService.getQnaList(sRoomNo);
		model.addAttribute("qnaList", qnaList);

		// 리뷰리스트 불러오기
		List<HashMap<String, Object>> reveiwList = sRoomService.getReviewList(sRoomNo);
		model.addAttribute("reviewList", reveiwList);
		
		// 좋아요 상황 불러오기
		int markNum;
		if( session.getAttribute("member_no") != null ) { // int로 형변환하지 않고 null일경우로 설정해야됨
			int memberNo = (int) session.getAttribute("member_no");
			markNum = sRoomService.getMark(memberNo, sRoomNo);
		} else {
			markNum = 0;
		}
		
		model.addAttribute("markCount", markNum);
		
		// 리뷰개수 & 평점 불러오기
		HashMap<String, Object> reviewInfo = sRoomService.getReviewInfo(sRoomNo);
		model.addAttribute("reviewInfo", reviewInfo);
		
		// 리뷰쓰기 조건검증
		if (session.getAttribute("member_no") != null) {
			// 리뷰쓰기 조건검증1 - 결제내역 존재유무 확인
			int memberNo = (int) session.getAttribute("member_no");
			int payInfo = sRoomService.getPayInfo(sRoomNo, memberNo);
			model.addAttribute("payInfo", payInfo);
		}
	}

	// QnA 등록
	@RequestMapping(value = "/sRoom/qnaInsert", method = RequestMethod.POST)
	public String sRoomQnAInsertProc(Model model, String sRoomQnATitle, String sRoomQnAContent, int sRoomQnaSecret,
			int sRoomNo, HttpSession session) {

		session.getAttribute("member_no");
		sRoomService.insertQna(sRoomQnATitle, sRoomQnAContent, sRoomQnaSecret, sRoomNo, session);

		List<HashMap<String, Object>> qnaList = sRoomService.getQnaList(sRoomNo);
		model.addAttribute("qnaList", qnaList);

		return "/sRoom/sRoomQnaList";
	}

	// QnA 수정
	@RequestMapping(value = "/sRoom/sRoomQnaUpdate", method = RequestMethod.POST)
	public String sRoomQnAUpdate(Model model, int sRoomQnaNo, String sRoomQnaTitle, String sRoomQnaContent,
			int sRoomQnaSecret, int sRoomNo, HttpSession session) {
		
		int memberNo = (int) session.getAttribute("member_no");
		sRoomService.updateQna(sRoomQnaNo, sRoomQnaTitle, sRoomQnaContent, sRoomQnaSecret, memberNo);

		List<HashMap<String, Object>> qnaList = sRoomService.getQnaList(sRoomNo);
		model.addAttribute("qnaList", qnaList);

		return "/sRoom/sRoomQnaList";
	}

	// QnA 삭제
	@RequestMapping(value = "/sRoom/sRoomQnaDelete", method = RequestMethod.POST)
	public String sRoomQnADelete(Model model, int sRoomQnaNo, int sRoomNo) {

		sRoomService.deleteQna(sRoomQnaNo);

		List<HashMap<String, Object>> qnaList = sRoomService.getQnaList(sRoomNo);
		model.addAttribute("qnaList", qnaList);

		return "/sRoom/sRoomQnaList";
	}

	public void sRoomQnaList() {

	}
	
	// ------------------------------예약 & 결제------------------------------
	
	// 결제전 예약정보 확인
	@RequestMapping(value = "/sRoom/reserve", method = RequestMethod.GET)
	public void reserve(Reservation reservation, StudyRoom studyRoom, HttpSession session, Model model) {

		int memberNo = (int) session.getAttribute("member_no");
		sRoomService.insertResevation(reservation, studyRoom, memberNo);

		HashMap<String, Object> reserveMap = sRoomService.getReserveInfo(reservation);
		model.addAttribute("reserveInfo", reserveMap);

	}

	// 결제등록
	@RequestMapping(value = "/sRoom/reserve", method = RequestMethod.POST)
	public void pay(Model model, String sRoomPayUid, String sRoomPayApply, int reserveNo, String sRoomPayMsg,
			int sRoomPayPrice, String sRoomPayMethod) {

		HashMap<String, Object> payInfo = sRoomService.insertPay(sRoomPayUid, sRoomPayApply, reserveNo, sRoomPayMsg,
				sRoomPayPrice, sRoomPayMethod);

	}

	// 결제내역
	@RequestMapping(value = "/sRoom/payResult", method = RequestMethod.GET)
	public void payResult(@RequestParam("sRoomPayUid") String sRoomPayUid, Model model) {
		HashMap<String, Object> payResultInfo = sRoomService.selectPayInfo(sRoomPayUid);

		model.addAttribute("payResult", payResultInfo);

	}

	// 리뷰 등록
	@RequestMapping(value = "/sRoom/reviewInsert", method = RequestMethod.POST)
	public String sRoomReviewInsertProc(Model model, String sRoomReviewScore, String sRoomReviewContent, int sRoomNo,
			HttpSession session) {

		session.getAttribute("member_no");
		int memberNo = (int) session.getAttribute("member_no");
		sRoomService.insertReview(sRoomReviewScore, sRoomReviewContent, sRoomNo, session);

		List<HashMap<String, Object>> reveiwList = sRoomService.getReviewList(sRoomNo);
		model.addAttribute("reviewList", reveiwList);
		
		HashMap<String, Object> reviewInfo = sRoomService.getReviewInfo(sRoomNo);
		model.addAttribute("reviewInfo", reviewInfo);

		return "/sRoom/sRoomReviewList";

	}
	
	// 리뷰 수정
	@RequestMapping(value = "/sRoom/sRoomRevUpdate", method = RequestMethod.POST)
	public String sRoomReviewUpdateProc(Model model, int sRoomReviewNo, String sRoomReviewScore,
			String sRoomReviewContent, int sRoomNo, HttpSession session) {
		int memberNo = (int) session.getAttribute("member_no");

		sRoomService.updateReview(sRoomReviewNo, sRoomReviewScore, sRoomReviewContent, sRoomNo, memberNo);

		List<HashMap<String, Object>> reveiwList = sRoomService.getReviewList(sRoomNo);
		model.addAttribute("reviewList", reveiwList);

		HashMap<String, Object> reviewInfo = sRoomService.getReviewInfo(sRoomNo);
		model.addAttribute("reviewInfo", reviewInfo);
		
		return "/sRoom/sRoomReviewList";

	}
	
	// 리뷰 삭제
	@RequestMapping(value="/sRoom/sRoomRevDelete", method=RequestMethod.POST)
	public String sRoomReviewDeleteProc(Model model, int sRoomReviewNo, int sRoomNo, HttpSession session) {
		sRoomService.deleteReview(sRoomReviewNo);
		List<HashMap<String, Object>> reveiwList = sRoomService.getReviewList(sRoomNo);
		model.addAttribute("reviewList", reveiwList);
		HashMap<String, Object> reviewInfo = sRoomService.getReviewInfo(sRoomNo);
		model.addAttribute("reviewInfo", reviewInfo);

		return "/sRoom/sRoomReviewList";
	}
	
	// 리뷰 쓰기전 검증
	@RequestMapping(value="/sRoom/ReviewCount", method=RequestMethod.POST)
	public @ResponseBody int revCnt(int sRoomNo, HttpSession session) {
		
		int memberNo = (int) session.getAttribute("member_no");
		int revCnt = sRoomService.getRevCount(memberNo, sRoomNo);
		return revCnt;
	}
	
	
	// 좋아요
	@RequestMapping("/sRoom/sRoomMark")
	public @ResponseBody int res(int sRoomNo, HttpSession session) {
		
		int memberNo = (int) session.getAttribute("member_no");
		int res = sRoomService.insertMark(sRoomNo, memberNo);
		
		logger.info("[좋아요 검증] result : {}", res);
		return res;
		
	}

}
