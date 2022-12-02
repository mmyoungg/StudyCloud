package service.face.admin;

import java.util.List;

import dto.ApplyMt;
import dto.Member;
import util.Paging;

public interface ApplyMtService_admin {

	/**
	 * 게시글 목록을 위한 페이징 객체를 생성한다
	 * 
	 * 파라미터 curPage (현재 페이지)
	 * DB에서 조회한 totalCount(총 게시글 수)
	 * 두 가지 데이터를 활용하여 페이징 객체를 생성하여 반환한다
	 * 
	 * @param curPage - 요청 페이지 번호
	 * @return 계산이 완료된 Paging 객체
	 */
	public Paging getPaging(int curPage);
	
	/**
	 * 페이징이 적용된 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<ApplyMt> list(Paging paging);
	
	/**
	 * 회원 권한을 변경한다
	 * @return 
	 * 
	 */
	public Member updateMember(Member member);

	/**
	 * 신청서 상세보기
	 * 
	 * @param applyMt - 상세 조회할 게시글 번호 객체
	 * @return 조회된 상세 게시글 객체
	 */
	public ApplyMt view(ApplyMt applyMt);

}
