package service.face;

import java.util.ArrayList;
import java.util.HashMap;

import dto.StudyBoard;
import util.Paging;

public interface SboardService {

	Paging getPaging(int curPage);

	ArrayList<HashMap<String, Object>> selectSboardHash(Paging paging);

	HashMap<String, Object> detail(int studyNo);

	void enroll(StudyBoard sboard);

	void update(StudyBoard sboard);

	void delete(StudyBoard sboard);

}
