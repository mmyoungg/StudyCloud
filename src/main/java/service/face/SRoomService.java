package service.face;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

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
	


}
