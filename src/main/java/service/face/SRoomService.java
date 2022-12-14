package service.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import dto.Reservation;
import dto.StudyRoom;
import dto.StudyRoomList;
import util.CmtPaging;

public interface SRoomService {

	public CmtPaging getPaging(int curPage);

	// 스터디룸 리스트 조회
	public List<HashMap<String, Object>> getsRoomList(CmtPaging paging);

	// 지역검색 리스트 조회
	public List<HashMap<String, Object>> getListByLocation(HashMap<String, Object> map);

	// 지역검색 결과 카운트
	public CmtPaging getPaging(HashMap<String, Object> getPagingMap);

	// 인원검색 결과 카운트
	public CmtPaging getPagingWithPnum(HashMap<String, Object> getPagingMap);

	// 인원검색 리스트 조회
	public List<HashMap<String, Object>> getListByPeople(HashMap<String, Object> map);

	// 선택한 스터디룸 상세조회
	public HashMap<String, Object> getDetail(int sRoomNo);

	// QnA 등록
	public void insertQna(String sRoomQnATitle, String sRoomQnAContent, int sRoomQnaSecret, int sRoomNo,
			HttpSession session);

	// QnA 리스트 조회
	public List<HashMap<String, Object>> getQnaList(int sRoomNo);

	// QnA 수정
	public void updateQna(int sRoomQnaNo, String sRoomQnaTitle, String sRoomQnaContent, int sRoomQnaSecret,
			int memberNo);

	// QnA 삭제
	public void deleteQna(int sRoomQnaNo);

	// 예약정보 삽입(결제전 확인)
	public void insertResevation(Reservation reservation, StudyRoom studyRoom, int memberNo);

	// 예약정보 확인(결제전 확인)
	public HashMap<String, Object> getReserveInfo(Reservation reservation);

	// 결제정보 삽입(결제 성공 후)
	public HashMap<String, Object> insertPay(String sRoomPayUid, String sRoomPayApply, int reserveNo,
			String sRoomPayMsg, int sRoomPayPrice, String sRoomPayMethod);

	// 결제내역
	public HashMap<String, Object> selectPayInfo(String sRoomPayUid);

	// 리뷰 등록
	public void insertReview(String sRoomReviewScore, String sRoomReviewContent, int sRoomNo, HttpSession session);

	// 리뷰리스트 조회
	public List<HashMap<String, Object>> getReviewList(int sRoomNo);
	
	// 리뷰 수정
	public void updateReview(int sRoomReviewNo, String sRoomReviewScore, String sRoomReviewContent, int sRoomNo,
			int memberNo);

	// 리뷰 삭제
	public void deleteReview(int sRoomReviewNo);
	
	// 좋아요 처리
	public int insertMark(int sRoomNo, int memberNo);
	
	// 좋아요 조회
	public int getMark(int memberNo, int sRoomNo);
	
	// 리뷰개수 & 별점평균 불러오기
	public HashMap<String, Object> getReviewInfo(int sRoomNo);
	
	// 리뷰조건 검증을위한 결제정보 확인
	public int getPayInfo(int sRoomNo, int memberNo);
	
	// 리뷰조건 검증을위한 리뷰작성 유무 확인
	public int getRevCount(int memberNo, int sRoomNo);

	// 셀렉트박스 선택조회
	public List<HashMap<String, Object>> getSelectedRoomList(CmtPaging paging, Integer selectNum);
	
	// 키워드검색 
	public List<HashMap<String, Object>> keywordProc(String keywordWord, HttpSession session, CmtPaging paging);
	
	// 인기검색어 키워드 리스트
	public List<HashMap<String, Integer>> getKeywordList();
	
	// 인기검색어 클릭 리스트
	public List<HashMap<String, Object>> keywordSearch(String keywordWord, CmtPaging paging);

	
	

}
