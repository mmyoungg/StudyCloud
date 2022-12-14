package dao.face;

import java.util.ArrayList;
import java.util.HashMap;

import dto.Commt;
import dto.StudyBoard;
import util.Paging;

public interface SboardDao {

	public int selectCntAll();

	public ArrayList<HashMap<String, Object>> selectSboardHash(Paging paging);

	public HashMap<String, Object> detailPageBySboardNo(int studyNo);

	public void enroll(StudyBoard sboard);
	
	public void update(StudyBoard sboard);

	public void delete(StudyBoard sboard);

	public ArrayList<HashMap<String, Object>> getsboardcmtmain(int studyNo);

	public int sboardcmtcnt(int studyNo);

	public void insertcmt(Commt commt);

	public Commt selectCmtByCommtNo(int commtNo);

	public void deletecmt(int commtNo);


}
