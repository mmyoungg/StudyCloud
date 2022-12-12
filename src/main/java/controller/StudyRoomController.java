package controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dto.Reservation;
import dto.StudyRoom;
import service.face.SRoomService;
import util.CmtPaging;

@Controller
public class StudyRoomController {

	private Logger logger = LoggerFactory.getLogger(StudyRoomController.class);
	@Autowired
	SRoomService sRoomService;

	@RequestMapping("/sRoom/list")
	public void list(Model model, @RequestParam(defaultValue = "1") int curPage) {

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
	@RequestMapping(value = "/sRoom/locSearch", method = RequestMethod.POST)
	public String sRoomLocSearch(Model model, String sRoomLoc, @RequestParam(defaultValue = "1") Integer curPage) {
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
	@RequestMapping(value = "/sRoom/peopleSearch", method = RequestMethod.POST)
	public String sRoomPeopleSearch(Model model, Integer sRoompNum, @RequestParam(defaultValue = "1") Integer curPage) {
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
	@RequestMapping(value = "/sRoom/seletedSort", method = RequestMethod.POST)
	public void sRoomSort(int selectNum, @RequestParam(defaultValue = "1") Integer curPage) {
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

	// ------------------------------상세페이지------------------------------

	// 메인
	@RequestMapping("/sRoom/detail")
	public void detail(int sRoomNo, Model model) {
		logger.info("/sRoom/detail [GET] 호출, sRoomNo : {}", sRoomNo);

		HashMap<String, Object> map = sRoomService.getDetail(sRoomNo);
		model.addAttribute("sRoomView", map);

		// Qna 리스트 불러오기
		List<HashMap<String, Object>> qnaList = sRoomService.getQnaList(sRoomNo);
		model.addAttribute("qnaList", qnaList);
		
		// 리뷰리스트 불러오기
		List<HashMap<String, Object>> reveiwList = sRoomService.getReviewList(sRoomNo);
		model.addAttribute("reveiwList", reveiwList);

	}

	// QnA 등록
	@RequestMapping(value = "/sRoom/qnaInsert", method = RequestMethod.POST)
	public String sRoomQnAInsertProc(Model model, String sRoomQnATitle, String sRoomQnAContent, int sRoomQnaSecret,
			int sRoomNo, HttpSession session) {
		logger.info("/sRoom/qnaInsert [POST] 호출, sRoomQnATitle : {}", sRoomQnATitle);
		logger.info("/sRoom/qnaInsert [POST] 호출, sRoomQnAContent : {}", sRoomQnAContent);
		logger.info("/sRoom/qnaInsert [POST] 호출, sRoomQnaSecret : {}", sRoomQnaSecret);
		logger.info("/sRoom/qnaInsert [POST] 호출, sRoomNo : {}", sRoomNo);

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
		logger.info("/sRoom/sRoomQnaUpdate [POST], sRoomQnaNo : {}", sRoomQnaNo);
		logger.info("/sRoom/sRoomQnaUpdate [POST], sRoomQnaTitle : {}", sRoomQnaTitle);
		logger.info("/sRoom/sRoomQnaUpdate [POST], sRoomQnaContent : {}", sRoomQnaContent);
		logger.info("/sRoom/sRoomQnaUpdate [POST], sRoomQnaSecret : {}", sRoomQnaSecret);
		logger.info("/sRoom/sRoomQnaUpdate [POST], sRoomNo : {}", sRoomNo);
		int memberNo = (int) session.getAttribute("member_no");
		logger.info("/sRoom/sRoomQnaUpdate [POST], memberNo : {}", memberNo);

		sRoomService.updateQna(sRoomQnaNo, sRoomQnaTitle, sRoomQnaContent, sRoomQnaSecret, memberNo);

		List<HashMap<String, Object>> qnaList = sRoomService.getQnaList(sRoomNo);
		model.addAttribute("qnaList", qnaList);

		return "/sRoom/sRoomQnaList";
	}
	
	//QnA 삭제
	@RequestMapping(value = "/sRoom/sRoomQnaDelete", method = RequestMethod.POST)
	public String sRoomQnADelete(Model model, int sRoomQnaNo, int sRoomNo) {
		logger.info("/sRoom/sRoomQnaDelete [POST], sRoomQnaNo : {}", sRoomQnaNo);
		logger.info("/sRoom/sRoomQnaDelete [POST], sRoomNo : {}", sRoomNo);

		sRoomService.deleteQna(sRoomQnaNo);

		List<HashMap<String, Object>> qnaList = sRoomService.getQnaList(sRoomNo);
		model.addAttribute("qnaList", qnaList);

		return "/sRoom/sRoomQnaList";
	}

	public void sRoomQnaList() {

	}
	
	// 결제전 예약정보 확인
	@RequestMapping(value = "/sRoom/reserve", method = RequestMethod.GET)
	public void reserve(Reservation reservation, StudyRoom studyRoom, HttpSession session, Model model) {
		logger.info("/sRoom/reserve [POST] 전송 성공");
		logger.info("/sRoom/reserve [POST] Reservation : {}", reservation);
		logger.info("/sRoom/reserve [POST] StudyRoom : {}", studyRoom);

		int memberNo = (int) session.getAttribute("member_no");
		sRoomService.insertResevation(reservation, studyRoom, memberNo);

		HashMap<String, Object> reserveMap = sRoomService.getReserveInfo(reservation);
		model.addAttribute("reserveInfo", reserveMap);

	}
	
	// 결제등록
	@RequestMapping(value = "/sRoom/reserve", method = RequestMethod.POST)
	public void pay(Model model, String sRoomPayUid, String sRoomPayApply, int reserveNo, String sRoomPayMsg,
			int sRoomPayPrice, String sRoomPayMethod) {
		logger.info("/sRoom/payResult [POST], sRoomPayUid[결제번호] : {}", sRoomPayUid);
		logger.info("/sRoom/payResult [POST], sRoomPayApply[카드승인번호] : {}", sRoomPayApply);
		logger.info("/sRoom/payResult [POST], reserveNo[예약번호] : {}", reserveNo);
		logger.info("/sRoom/payResult [POST], sRoomPayMsg[요청사항] : {}", sRoomPayMsg);
		logger.info("/sRoom/payResult [POST], sRoomPayPrice[결제가격] : {}", sRoomPayPrice);
		logger.info("/sRoom/payResult [POST], sRoomPayMethod[결제수단] : {}", sRoomPayMethod);

		HashMap<String, Object> payInfo = sRoomService.insertPay(sRoomPayUid, sRoomPayApply, reserveNo, sRoomPayMsg,
				sRoomPayPrice, sRoomPayMethod);
		logger.info("삽입된 결제내역 정보들 : {}", payInfo);

	}

	  // 결제내역
	  @RequestMapping(value="/sRoom/payResult", method=RequestMethod.GET) 
	  public void payResult(@RequestParam("sRoomPayUid") String sRoomPayUid, Model model) {
		  logger.info("/sRoom/payResult [GET] sRoomPayUid : {}", sRoomPayUid);
		  HashMap<String, Object> payResultInfo = sRoomService.selectPayInfo(sRoomPayUid);
		  logger.info("삽입된 결제내역 정보들nnnnnnn : {}", payResultInfo);
		  
		  model.addAttribute("payResult", payResultInfo);
		  
	  }
	  
	  // 리뷰 등록
	  @RequestMapping(value="/sRoom/reviewInsert", method=RequestMethod.POST)
	  public String sRoomReviewInsertProc(Model model, String sRoomReviewScore, String sRoomReviewContent, int sRoomNo, HttpSession session) {
		  logger.info("/sRoom/reviewInsert [POST] sRoomReviewScore  : {}", sRoomReviewScore);
		  logger.info("/sRoom/reviewInsert [POST] sRoomReviewContent  : {}", sRoomReviewContent);
		  logger.info("/sRoom/reviewInsert [POST] sRoomNo  : {}", sRoomNo);
		  
		  session.getAttribute("member_no");
		  sRoomService.insertReview(sRoomReviewScore, sRoomReviewContent, sRoomNo, session);

			List<HashMap<String, Object>> reveiwList = sRoomService.getReviewList(sRoomNo);
			model.addAttribute("reviewList", reveiwList);

			return "/sRoom/sRoomReviewList";
		  
	  }
	  

}
