package dao.face;

import java.util.Map;

import javax.servlet.http.HttpSession;


import dto.FileUpload;
import dto.Member;

public interface MypageDao {
	


	/**
	 * 회원정보 수정
	 * 
	 * 
	 * @param member
	 */
	public void userUpdate(Member member);
	
	
	/**
	 * 프로필사진 변경
	 * 
	 * @param member
	 * @param imageList
	 * @param webPath
	 * @param folderPath
	 * @return
	 * @throws Exception
	 */
	public void insertProfile(FileUpload fileupload);


	public Object selectFileByMemberNo(Member member);


	/**
	 * 회원탈퇴
	 * 
	 * @param member
	 * @param session
	 */
	public void withdrawal(Member member, HttpSession session);


	/**
	 * 비밀번호 확인
	 * 
	 * @param member
	 * @return
	 */
	public int passCheck(Member member);


	public FileUpload selectProfile(int memberNo);
	
	public void updateProfile(FileUpload file);
	
	
	
	


	



	

}
