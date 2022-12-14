package service.face;

import javax.servlet.http.HttpServletResponse;

import dto.FileUpload;
import dto.Member;

public interface MemberService {
	
	/**
	 * 로그인 인증 처리
	 * 	
	 * @param member - 입력한 ID/PW 정보
	 * @return 로그인 인증 경과
	 */
	public boolean login(Member member);

	/**
	 * 회원의 이름 조회
	 * 
	 * @param member - 닉네임을 조회할 사용자의 정보
	 * @return 사용자의 이름
	 */
	public String getMemberNick(Member member);
	
	/**
	 * 회원의 번호 조회
	 * 
	 * @param member - 회원번호를 조회할 사용자의 정보
	 * @return 사용자의 이름
	 */
	public String getMemberNo(Member member);

	/**
	 * 신규 회원 가입
	 * 
	 * @param member - 신규 회원의 정보
	 * @return 회원가입 결과
	 */
	public boolean join(Member member);

	/**
	 * 아이디 찾기
	 * 
	 * @param memberEmail
	 * @return
	 */
	public String findid(String memberEmail);
	
	/**
	 * 
	 * @param member
	 * @return
	 */
	public String selectid(Member member);
	
	/**
	 * 메일 발송
	 * 
	 * @param member
	 * @param div
	 * @throws Exception
	 */
	public void sendEmail(Member member, String div);

	/**
	 * 비밀번호 찾기
	 * 
	 * @param member
	 * @throws Exception
	 */
	public String findPw(Member member);
	
	/**
	 * 회원 아이디로 회원 정보 가져오기
	 * 
	 * @param id
	 * @throws Exception
	 */
	public Member getMemberById(String id);
	
	/**
	 * 아이디 중복 체크
	 * 
	 * @param memberId
	 * @return
	 * @throws Exception
	 */
	public int idchk(String memberId) throws Exception;

	public Member memberInfo(Member member);

	public Member memberInfoByNo(Member member);

	public FileUpload getProfileMemberNo(Member member);

	
	
}
	
	




