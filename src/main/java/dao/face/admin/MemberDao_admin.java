package dao.face.admin;

import java.util.List;

import dto.Member;
import util.Paging;

public interface MemberDao_admin {

	/**
	 * 전체 게시글 수를 조회한다
	 * 
	 * @return - 총 게시글 수
	 */
	public int selectCntAll();

	/**
	 * 페이징을 적용하여 게시글 목록 조회
	 * 
	 * @param paging - 페이징 정보 객체
	 * @return 페이징이 적용된 게시글 목록
	 */
	public List<Member> selectList(Paging paging);

	/**
	 * ID/PW가 일치하는 사용자 수를 반환한다
	 * 	-> 로그인 인증에 활용한다
	 * 
	 * @param member - 조회할 id/pw 정보
	 * @return 조회된 행 수
	 */
	public int selectCntMember(Member member);
	
	/**
	 * 전달된 id를 이용하여 사용자 정보를 조회한다
	 * 
	 * @param loginid - 조회하려는 대상의 id
	 * @return 조회된 회원의 정보
	 */
	public Member selectLoginById(String loginid);

}
