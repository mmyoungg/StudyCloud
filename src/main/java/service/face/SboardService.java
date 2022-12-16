package service.face;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import dto.Commt;
import dto.StudyBoard;
import util.Paging;

public interface SboardService {

	public Paging getPaging(int curPage);

	public ArrayList<HashMap<String, Object>> selectSboardHash(Paging paging);

	public HashMap<String, Object> detail(int studyNo);

	public void enroll(StudyBoard sboard);

	public void update(StudyBoard sboard);

	public void delete(StudyBoard sboard);

	public ArrayList<HashMap<String, Object>> sboardcmt(int studyNo);

	public int getScmtcnt(int studyNo);

	public void sboardcmtcnt(int studyNo);
	
	public void insertcmmt(Commt commt);

	public void deletecmt(int commtNo);

	public List<StudyBoard> getSearchList(StudyBoard sboard);



}
