package dao.face;

import java.util.HashMap;
import java.util.List;

import util.Paging;

public interface MtBoardDao {

	
	public int CntMtBaord();

	public List<HashMap<String, Object>> MtBoardList(Paging paging);
}
