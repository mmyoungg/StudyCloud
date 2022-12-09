package dto;

import java.util.Date;

public class SroomQna {
	private int sRoomQnaNo; 
	private int sRoomNo;
	private int memberNo;
	private int sRoomQnaGrpNo; //그룹번호(답글 달 때 하나의 그룹으로됨 QnaNo처럼 시퀀스로 증가)
	private int sRoomQnaGrpOrd; // 답글 번호
	private int sRoomQnaStep; // 답변시 들여쓰기 설정
	private String sRoomQnaTitle; 
	private String sRoomQnaContent; 
	private Date sRoomQnaDate;
	private int sRoomQnaSecret; // 비밀글 여부
	
	public SroomQna () {}

	public SroomQna(int sRoomQnaNo, int sRoomNo, int memberNo, int sRoomQnaGrpNo, int sRoomQnaGrpOrd, int sRoomQnaStep,
			String sRoomQnaTitle, String sRoomQnaContent, Date sRoomQnaDate, int sRoomQnaSecret) {
		super();
		this.sRoomQnaNo = sRoomQnaNo;
		this.sRoomNo = sRoomNo;
		this.memberNo = memberNo;
		this.sRoomQnaGrpNo = sRoomQnaGrpNo;
		this.sRoomQnaGrpOrd = sRoomQnaGrpOrd;
		this.sRoomQnaStep = sRoomQnaStep;
		this.sRoomQnaTitle = sRoomQnaTitle;
		this.sRoomQnaContent = sRoomQnaContent;
		this.sRoomQnaDate = sRoomQnaDate;
		this.sRoomQnaSecret = sRoomQnaSecret;
	}

	@Override
	public String toString() {
		return "SroomQna [sRoomQnaNo=" + sRoomQnaNo + ", sRoomNo=" + sRoomNo + ", memberNo=" + memberNo
				+ ", sRoomQnaGrpNo=" + sRoomQnaGrpNo + ", sRoomQnaGrpOrd=" + sRoomQnaGrpOrd + ", sRoomQnaStep="
				+ sRoomQnaStep + ", sRoomQnaTitle=" + sRoomQnaTitle + ", sRoomQnaContent=" + sRoomQnaContent
				+ ", sRoomQnaDate=" + sRoomQnaDate + ", sRoomQnaSecret=" + sRoomQnaSecret + "]";
	}

	public int getsRoomQnaNo() {
		return sRoomQnaNo;
	}

	public void setsRoomQnaNo(int sRoomQnaNo) {
		this.sRoomQnaNo = sRoomQnaNo;
	}

	public int getsRoomNo() {
		return sRoomNo;
	}

	public void setsRoomNo(int sRoomNo) {
		this.sRoomNo = sRoomNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public int getsRoomQnaGrpNo() {
		return sRoomQnaGrpNo;
	}

	public void setsRoomQnaGrpNo(int sRoomQnaGrpNo) {
		this.sRoomQnaGrpNo = sRoomQnaGrpNo;
	}

	public int getsRoomQnaGrpOrd() {
		return sRoomQnaGrpOrd;
	}

	public void setsRoomQnaGrpOrd(int sRoomQnaGrpOrd) {
		this.sRoomQnaGrpOrd = sRoomQnaGrpOrd;
	}

	public int getsRoomQnaStep() {
		return sRoomQnaStep;
	}

	public void setsRoomQnaStep(int sRoomQnaStep) {
		this.sRoomQnaStep = sRoomQnaStep;
	}

	public String getsRoomQnaTitle() {
		return sRoomQnaTitle;
	}

	public void setsRoomQnaTitle(String sRoomQnaTitle) {
		this.sRoomQnaTitle = sRoomQnaTitle;
	}

	public String getsRoomQnaContent() {
		return sRoomQnaContent;
	}

	public void setsRoomQnaContent(String sRoomQnaContent) {
		this.sRoomQnaContent = sRoomQnaContent;
	}

	public Date getsRoomQnaDate() {
		return sRoomQnaDate;
	}

	public void setsRoomQnaDate(Date sRoomQnaDate) {
		this.sRoomQnaDate = sRoomQnaDate;
	}

	public int getsRoomQnaSecret() {
		return sRoomQnaSecret;
	}

	public void setsRoomQnaSecret(int sRoomQnaSecret) {
		this.sRoomQnaSecret = sRoomQnaSecret;
	}
	
	
	
}
