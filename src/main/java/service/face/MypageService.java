package service.face;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import dto.FileUpload;
import dto.Member;
import dto.Reservation;

public interface MypageService {
	
	/**
	 * 회원정보 수정
	 * 
	 * @param member
	 */
	public void userUpdate(Member member);

	
	/**
	 * 프로필사진
	 * 
	 * @param member
	 * @param file
	 */
	public void insertProfile(Member member, MultipartFile file);

	
	/**
	 * 회원탈퇴
	 * 
	 * @param member
	 * @param session
	 */
	public void withdrawal(Member member);


	/**
	 * 비밀번호확인
	 * 
	 * @param member
	 * @return
	 */
	public int passCheck(Member member);
	
	public FileUpload selectProfile(int memberNo);
	
	public void updateProfile(FileUpload file);


	public static Reservation selectList(Reservation reservationlist) {
		return null;
	}


	public List<Reservation> reservationlist(String id);
	
	
}
