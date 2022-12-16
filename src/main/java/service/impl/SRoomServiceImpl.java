package service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.face.SRoomDao;
import dto.Reservation;
import dto.SroomKeyword;
import dto.SroomMark;
import dto.SroomPayment;
import dto.SroomQna;
import dto.SroomReview;
import dto.StudyRoom;
import service.face.SRoomService;
import util.CmtPaging;

@Service
public class SRoomServiceImpl implements SRoomService {

	@Autowired
	SRoomDao sRoomDao;

	@Override
	public CmtPaging getPaging(int curPage) {
		int totalCount = sRoomDao.countSroom();
		CmtPaging paging = new CmtPaging(totalCount, curPage);
		return paging;
	}

	@Override
	public List<HashMap<String, Object>> getsRoomList(CmtPaging paging) {
		return sRoomDao.getSRoomPagingList(paging);
	}

	@Override
	public List<HashMap<String, Object>> getListByLocation(HashMap<String, Object> map) {
		return sRoomDao.getSRoomListByLocation(map);
	}

	@Override
	public CmtPaging getPaging(HashMap<String, Object> getPagingMap) {
		int totalCount = sRoomDao.countLocSroom(getPagingMap);
		int curPage = (int) getPagingMap.get("locCurpage");
		CmtPaging paging = new CmtPaging(totalCount, curPage);
		return paging;
	}

	@Override
	public CmtPaging getPagingWithPnum(HashMap<String, Object> getPagingMap) {
		int totalCount = sRoomDao.countpNumSroom(getPagingMap);
		int curPage = (int) getPagingMap.get("pNumCurpage");
		CmtPaging paging = new CmtPaging(totalCount, curPage);
		return paging;
	}

	@Override
	public List<HashMap<String, Object>> getListByPeople(HashMap<String, Object> map) {
		return sRoomDao.getSRoomListByNumOfPeople(map);
	}

	@Override
	public HashMap<String, Object> getDetail(int sRoomNo) {
		return sRoomDao.getSroomDetailBySroomNo(sRoomNo);
	}

	// ------------------QnA------------------
	@Override
	public void insertQna(String sRoomQnATitle, String sRoomQnAContent, int sRoomQnaSecret, int sRoomNo,
			HttpSession session) {
		SroomQna sRoomQna = new SroomQna();

		sRoomQna.setMemberNo((int) session.getAttribute("member_no"));
		sRoomQna.setsRoomNo(sRoomNo);
		sRoomQna.setsRoomQnaTitle(sRoomQnATitle);
		sRoomQna.setsRoomQnaContent(sRoomQnAContent);
		sRoomQna.setsRoomQnaSecret(sRoomQnaSecret);

		sRoomDao.insertSroomQna(sRoomQna);
	}

	@Override
	public List<HashMap<String, Object>> getQnaList(int sRoomNo) {
		return sRoomDao.getListQnAListBySroomNo(sRoomNo);
	}

	@Override
	public void updateQna(int sRoomQnaNo, String sRoomQnaTitle, String sRoomQnaContent, int sRoomQnaSecret,
			int memberNo) {
		SroomQna sRoomQna = new SroomQna();
		sRoomQna.setMemberNo(memberNo);
		sRoomQna.setsRoomQnaNo(sRoomQnaNo);
		sRoomQna.setsRoomQnaTitle(sRoomQnaTitle);
		sRoomQna.setsRoomQnaContent(sRoomQnaContent);
		sRoomQna.setsRoomQnaSecret(sRoomQnaSecret);

		sRoomDao.updateQnaBySroomQnaNo(sRoomQna);
	}

	@Override
	public void deleteQna(int sRoomQnaNo) {
		sRoomDao.deleteQnaBySroomQnaNo(sRoomQnaNo);
	}

	@Override
	public void insertResevation(Reservation reservation, StudyRoom studyRoom, int memberNo) {
		reservation.setMemberNo(memberNo);
		reservation.setSroomNo(studyRoom.getsRoomNo());

		sRoomDao.insertReservation(reservation);
	}

	@Override
	public HashMap<String, Object> getReserveInfo(Reservation reservation) {
		return sRoomDao.selectReserveInfo(reservation);
	}

	@Override
	public HashMap<String, Object> insertPay(String sRoomPayUid, String sRoomPayApply, int reserveNo,
			String sRoomPayMsg, int sRoomPayPrice, String sRoomPayMethod) {

		SroomPayment sRoomPayment = new SroomPayment();
		sRoomPayment.setReserveNo(reserveNo);
		sRoomPayment.setsRoomPayApply(sRoomPayApply);
		sRoomPayment.setsRoomPayMethod(sRoomPayMethod);
		sRoomPayment.setsRoomPayMsg(sRoomPayMsg);
		sRoomPayment.setsRoomPayPrice(sRoomPayPrice);
		sRoomPayment.setsRoomPayUid(sRoomPayUid);

		sRoomDao.insertSroomPayment(sRoomPayment);

		int sRoomPayNo = sRoomPayment.getsRoomPayNo();
		System.out.println("[DB삽입된 결제시퀀스 조회] : " + sRoomPayNo);
		return sRoomDao.seletPayInfoBySroomPayNo(sRoomPayNo);

	}

	@Override
	public HashMap<String, Object> selectPayInfo(String sRoomPayUid) {
		SroomPayment pay = new SroomPayment();
		pay.setsRoomPayUid(sRoomPayUid);
		return sRoomDao.selectPayInfoByUid(pay);
	}

	@Override
	public void insertReview(String sRoomReviewScore, String sRoomReviewContent, int sRoomNo, HttpSession session) {
		SroomReview sRoomReview = new SroomReview();

		sRoomReview.setMemberNo((int) session.getAttribute("member_no"));
		sRoomReview.setsRoomNo(sRoomNo);
		sRoomReview.setsRoomReviewScore(Integer.parseInt(sRoomReviewScore));
		sRoomReview.setsRoomReviewContent(sRoomReviewContent);

		sRoomDao.insertReview(sRoomReview);

	}

	@Override
	public List<HashMap<String, Object>> getReviewList(int sRoomNo) {
		return sRoomDao.getReviewLstBySroomNo(sRoomNo);
	}

	@Override
	public void updateReview(int sRoomReviewNo, String sRoomReviewScore, String sRoomReviewContent, int sRoomNo,
			int memberNo) {
		SroomReview sRoomReviewUpdate = new SroomReview();
		sRoomReviewUpdate.setsRoomReviewNo(sRoomReviewNo);
		sRoomReviewUpdate.setMemberNo(memberNo);
		sRoomReviewUpdate.setsRoomNo(sRoomNo);
		sRoomReviewUpdate.setsRoomReviewScore(Integer.parseInt(sRoomReviewScore));
		sRoomReviewUpdate.setsRoomReviewContent(sRoomReviewContent);

		sRoomDao.updateSroomReview(sRoomReviewUpdate);
	}

	@Override
	public void deleteReview(int sRoomReviewNo) {
		sRoomDao.deleteSroomReview(sRoomReviewNo);
	}

	@Override
	public int insertMark(int sRoomNo, int memberNo) {

		SroomMark sRoomMark = new SroomMark();
		sRoomMark.setMemberNo(memberNo);
		sRoomMark.setsRoomNo(sRoomNo);

		int markCount = sRoomDao.isMarkCount(sRoomMark);
		if (markCount == 0) {
			sRoomDao.insertMark(sRoomMark);
			markCount = 1;
		} else {
			sRoomDao.deleteMark(sRoomMark);
			markCount = 0;
		}

		return markCount;
	}

	@Override
	public int getMark(int memberNo, int sRoomNo) {
		SroomMark sRoomMark = new SroomMark();
		sRoomMark.setMemberNo(memberNo);
		sRoomMark.setsRoomNo(sRoomNo);
		int markCount = sRoomDao.isMarkCount(sRoomMark);
		return markCount;
	}

	@Override
	public HashMap<String, Object> getReviewInfo(int sRoomNo) {
		return sRoomDao.getReveiwInfoBySroomNo(sRoomNo);
	}

	@Override
	public int getPayInfo(int sRoomNo, int memberNo) {
				
		Map<String, Integer> map = new HashMap<>();
		map.put("sRoomNo", sRoomNo);
		map.put("memberNo", memberNo);

		return sRoomDao.getPayInfo(map);
	}

	@Override
	public List<HashMap<String, Object>> getSelectedRoomList(CmtPaging paging, Integer selectNum) {

		HashMap<String, Object> map = new HashMap<>();
		map.put("paging", paging);
		map.put("selecNum", selectNum);
		map.put("startNo", paging.getStartNo());
		map.put("endNo", paging.getEndNo());

		return sRoomDao.getRoomListByselectNum(map);
	}

	@Override
	public List<HashMap<String, Object>> keywordProc(String keywordWord, HttpSession session, CmtPaging paging) {
		SroomKeyword sRoomKeyword = new SroomKeyword();
		int memberNo;
		if (session.getAttribute("member_no") != null) { //
			memberNo = (int) session.getAttribute("member_no");
			sRoomKeyword.setMemberNo(memberNo);
			sRoomKeyword.setKeywordWord(keywordWord);
			sRoomDao.insertKeyword(sRoomKeyword); // 키워드삽입
		} else {
			sRoomDao.insertKeywordNoLogin(keywordWord);
		}


		HashMap<String, Object> map = new HashMap<>();
		map.put("startNo", paging.getStartNo());
		map.put("endNo", paging.getEndNo());
		map.put("keywordWord", keywordWord);
		
		// 인기검색어 테이블에 삽입

		return sRoomDao.selectSearchListByKeyword(map); //검색결과 리스트

	}
	
	@Override
	public List<HashMap<String, Integer>> getKeywordList() {
		return sRoomDao.getBestSearchKeyword();
	}
	
	@Override
	public List<HashMap<String, Object>> keywordSearch(String keywordWord, CmtPaging paging) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("startNo", paging.getStartNo());
		map.put("endNo", paging.getEndNo());
		map.put("keywordWord", keywordWord);
		
		return sRoomDao.searchListByBestKeyword(map);
	}
	
	@Override
	public int getRevCount(int memberNo, int sRoomNo) {
		
		SroomReview sRoomReview = new SroomReview();
		sRoomReview.setMemberNo(memberNo);
		sRoomReview.setsRoomNo(sRoomNo);	
		
		return sRoomDao.getIsCountReview(sRoomReview);
	}
	
	
}
