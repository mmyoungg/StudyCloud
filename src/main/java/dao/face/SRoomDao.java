package dao.face;

import java.util.HashMap;
import java.util.List;

import dto.SroomQna;
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

}
