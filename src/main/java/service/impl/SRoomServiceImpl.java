package service.impl;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.face.SRoomDao;
import dto.SroomQna;
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
	
	
	
	
	
}
