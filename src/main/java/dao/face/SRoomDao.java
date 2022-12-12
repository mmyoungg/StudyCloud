package dao.face;

import java.util.HashMap;
import java.util.List;

import dto.Member;
import dto.Reservation;
import dto.SroomPayment;
import dto.SroomQna;
import dto.SroomReview;
import dto.StudyRoom;
import dto.StudyRoomList;
import util.CmtPaging;

public interface SRoomDao {

	
	public int countSroom();

	public List<HashMap<String, Object>> getSRoomPagingList(CmtPaging paging);

	public List<HashMap<String, Object>> getSRoomListByLocation(HashMap<String, Object> map);

	public int countLocSroom(HashMap<String, Object> getPagingMap);

	public int countpNumSroom(HashMap<String, Object> getPagingMap);

	public List<HashMap<String, Object>> getSRoomListByNumOfPeople(HashMap<String, Object> map);

	public HashMap<String, Object> getSroomDetailBySroomNo(int sRoomNo);

	public void insertSroomQna(SroomQna sRoomQna);

	public List<HashMap<String, Object>> getListQnAListBySroomNo(int sRoomNo);

	public void updateQnaBySroomQnaNo(SroomQna sRoomQna);

	public void deleteQnaBySroomQnaNo(int sRoomQnaNo);

	public void insertReservation(Reservation reservation);

	public HashMap<String, Object> selectReserveInfo(Reservation reservation);

	public void insertSroomPayment(SroomPayment sRoomPayment);

	public HashMap<String, Object> seletPayInfoBySroomPayNo(int sRoomPayNo);

	public HashMap<String, Object> selectPayInfoByUid(SroomPayment pay);

	public void insertReview(SroomReview sRoomReview);

	public List<HashMap<String, Object>> getReviewLstBySroomNo(int sRoomNo);



}
