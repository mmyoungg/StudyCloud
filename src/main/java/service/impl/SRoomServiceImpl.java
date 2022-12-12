package service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.face.SRoomDao;
import dto.Reservation;
import dto.SroomPayment;
import dto.SroomQna;
import dto.SroomReview;
import dto.StudyRoom;
import service.face.SRoomService;
import util.CmtPaging;

@Service
public class SRoomServiceImpl implements SRoomService {
	
	@Autowired SRoomDao sRoomDao;
	
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
	
	
	//------------------QnA------------------
	@Override
	public void insertQna(String sRoomQnATitle, String sRoomQnAContent, int sRoomQnaSecret, int sRoomNo,
			HttpSession session) {
		SroomQna sRoomQna = new SroomQna();
		
		sRoomQna.setMemberNo( (int)session.getAttribute("member_no") );
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
	public void updateQna(int sRoomQnaNo, String sRoomQnaTitle, String sRoomQnaContent, int sRoomQnaSecret, int memberNo) {
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
	public HashMap<String, Object> insertPay(String sRoomPayUid, String sRoomPayApply, int reserveNo, String sRoomPayMsg,
			int sRoomPayPrice, String sRoomPayMethod) {
		
		SroomPayment sRoomPayment = new SroomPayment();
		sRoomPayment.setReserveNo(reserveNo);
		sRoomPayment.setsRoomPayApply(sRoomPayApply);
		sRoomPayment.setsRoomPayMethod(sRoomPayMethod);
		sRoomPayment.setsRoomPayMsg(sRoomPayMsg);
		sRoomPayment.setsRoomPayPrice(sRoomPayPrice);
		sRoomPayment.setsRoomPayUid(sRoomPayUid);
		
		sRoomDao.insertSroomPayment(sRoomPayment);
		
		int sRoomPayNo = sRoomPayment.getsRoomPayNo();
		System.out.println("[DB삽입된 결제시퀀스 조회] : " + sRoomPayNo );
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
		
		sRoomReview.setMemberNo( (int)session.getAttribute("member_no") );
		sRoomReview.setsRoomNo(sRoomNo);
		sRoomReview.setsRoomReviewScore(Integer.parseInt(sRoomReviewScore));
		sRoomReview.setsRoomReviewContent(sRoomReviewContent);
	
		sRoomDao.insertReview(sRoomReview);
		
	}
	
	@Override
	public List<HashMap<String, Object>> getReviewList(int sRoomNo) {
		return sRoomDao.getReviewLstBySroomNo(sRoomNo);
	}
	
}
