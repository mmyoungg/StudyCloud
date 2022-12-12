package service.face;

import java.util.ArrayList;
import java.util.HashMap;

import dto.StudyBoard;
import util.Paging;

public interface SboardService {

	public Paging getPaging(int curPage);

	public ArrayList<HashMap<String, Object>> selectSboardHash(Paging paging);

	public HashMap<String, Object> detail(int studyNo);

	public void enroll(StudyBoard sboard);

	public void update(StudyBoard sboard);

	public void delete(StudyBoard sboard);

}
