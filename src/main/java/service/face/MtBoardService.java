package service.face;

import java.util.HashMap;
import java.util.List;

import util.Paging;

public interface MtBoardService {

	
	Paging getPaging(int curPage);

	List<HashMap<String, Object>> list(Paging paging);

	
}
