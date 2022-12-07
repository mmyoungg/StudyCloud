package dao.face;

import java.util.ArrayList;
import java.util.HashMap;

import dto.StudyBoard;
import util.Paging;

public interface SboardDao {

	public int selectCntAll();

	public ArrayList<HashMap<String, Object>> selectSboardHash(Paging paging);

	public HashMap<String, Object> detailPageBySboardNo(int studyNo);

	public void insert(StudyBoard sboard);

}
