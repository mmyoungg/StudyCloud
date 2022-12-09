package dto;

import java.util.Date;

public class SroomReview {

	private int sRoomReviewNo;
	private int sRoomNo;
	private int reserveNo;
	private int memberNo;
	private int sRoomReviewScore;
	private String sRoomReviewContent;
	private Date sRoomReviewDate;
	
	public SroomReview() {}

	public SroomReview(int sRoomReviewNo, int sRoomNo, int reserveNo, int memberNo, int sRoomReviewScore,
			String sRoomReviewContent, Date sRoomReviewDate) {
		super();
		this.sRoomReviewNo = sRoomReviewNo;
		this.sRoomNo = sRoomNo;
		this.reserveNo = reserveNo;
		this.memberNo = memberNo;
		this.sRoomReviewScore = sRoomReviewScore;
		this.sRoomReviewContent = sRoomReviewContent;
		this.sRoomReviewDate = sRoomReviewDate;
	}

	@Override
	public String toString() {
		return "SroomReview [sRoomReviewNo=" + sRoomReviewNo + ", sRoomNo=" + sRoomNo + ", reserveNo=" + reserveNo
				+ ", memberNo=" + memberNo + ", sRoomReviewScore=" + sRoomReviewScore + ", sRoomReviewContent="
				+ sRoomReviewContent + ", sRoomReviewDate=" + sRoomReviewDate + "]";
	}

	public int getsRoomReviewNo() {
		return sRoomReviewNo;
	}

	public void setsRoomReviewNo(int sRoomReviewNo) {
		this.sRoomReviewNo = sRoomReviewNo;
	}

	public int getsRoomNo() {
		return sRoomNo;
	}

	public void setsRoomNo(int sRoomNo) {
		this.sRoomNo = sRoomNo;
	}

	public int getReserveNo() {
		return reserveNo;
	}

	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getsRoomReviewScore() {
		return sRoomReviewScore;
	}

	public void setsRoomReviewScore(int sRoomReviewScore) {
		this.sRoomReviewScore = sRoomReviewScore;
	}

	public String getsRoomReviewContent() {
		return sRoomReviewContent;
	}

	public void setsRoomReviewContent(String sRoomReviewContent) {
		this.sRoomReviewContent = sRoomReviewContent;
	}

	public Date getsRoomReviewDate() {
		return sRoomReviewDate;
	}

	public void setsRoomReviewDate(Date sRoomReviewDate) {
		this.sRoomReviewDate = sRoomReviewDate;
	}
	
	
}
