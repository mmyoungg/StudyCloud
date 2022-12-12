package dao.face;

import dto.Member;

public interface MemberDao {

	/**
	 * 
	 * 테스트
	 * @param member
	 * @return
	 */
	public String selectFindId(Member member);


	/**
	 * id/pw 가 일치하는 사용자 수를 반환한다
	 * 	-> 로그인 인증에 활용한다
	 * 
	 * @param member - 조회할 id/pw 정보
	 * @return 조회된 행 수
	 */
	public int selectCntMember(Member member);
	
	/**
	 * id를 이용하여 nick을 조회한다
	 * 
	 * @param member - 조회하려는 회원의 id를 가진 객체
	 * @return 조회된 nick
	 */
	public String selectMemberNick(Member member);
	
	
	/**
	 * id를 이용하여 member num을 조회한다
	 * 
	 * @param member - 조회하려는 회원의 id를 가진 객체
	 * @return 조회된 num
	 */
	public String selectMemberNo(Member member);
	
	/**
	 * 신규 회원 정보를 삽입한다
	 * 
	 * @param member - 신규 회원 정보
	 */
	public void insert(Member member);
	
	/**
	 * 회원 id가 존재하는 값인지 확인한다
	 * 	-> 중복된 id인지 확인
	 * 
	 * @param member - 조회하려는 회원의 id를 가진 객체
	 * @return 존재 여부 (0-없음, 1-있음)
	 */
	public int selectCntById(Member member);
	
	public Member getMemberById(String id);

	/**
	 * 아이디찾기
	 * 
	 * @param memberEmail
	 * @return
	 */
	//public static String findid(String memberEmail); 
	
	
	
	// 비밀번호 변경
	
	public int updatePw(Member member);


	public int readMember(String memberEmail);


	public Member selectMemberByEmail(String memberEmail);


	
	//아이디 중복체크
	public int idchk(String memberId);


	public Member getMemberByMemberNo(Member member);
	
	
	






	
}
