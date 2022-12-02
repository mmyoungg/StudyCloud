package service.impl.admin;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.face.admin.ApplyMtDao_admin;
import dto.ApplyMt;
import dto.Member;
import service.face.admin.ApplyMtService_admin;
import util.Paging;

@Service
public class ApplyMtServiceImpl_admin implements ApplyMtService_admin {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired ApplyMtDao_admin applyMtDao_admin;
	
	@Override
	public Paging getPaging(int curPage) {
		
		//총 게시글 수 조회
		int totalCount = applyMtDao_admin.selectCntAll();
		
		//페이징 계산
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;
	}

	@Override
	public List<ApplyMt> list(Paging paging) {
		return applyMtDao_admin.selectApplyList(paging);
	}

	@Override
	public Member updateMember(Member member) {
		return applyMtDao_admin.updateMember(member);
		
	}

	@Override
	public ApplyMt view(ApplyMt applyMt) {
		
		//상세보기 조회 결과 리턴
		return applyMtDao_admin.selectApplyMt(applyMt);
	}

}
