package dto;

import java.util.Date;

public class Mboard {
	
	private int mboardNo; //게시글 번호
	private int memberNo; //회원번호
	private String mboardTitle; //게시글 제목
	private String mboardContent; //게시글 내용
	private Date mboardDate; //게시글 작성 날짜
	private int mboardHit; //게시글 조회수
	private int mboardCmtcnt; //게시글 댓글 수
	
	public Mboard() {}
	
	public Mboard(int mboardNo, int memberNo, String mboardTitle, String mboardContent, Date mboardDate,
			int mboardHit, int mboardCmtcnt) {
		super();
		this.mboardNo = mboardNo;
		this.memberNo = memberNo;
		this.mboardTitle = mboardTitle;
		this.mboardContent = mboardContent;
		this.mboardDate = mboardDate;
		this.mboardHit = mboardHit;
		this.mboardCmtcnt = mboardCmtcnt;
	}
	

	@Override
	public String toString() {
		return "Mboard [mboardNo=" + mboardNo + ", memberNo=" + memberNo + ", mboardTitle=" + mboardTitle
				+ ", mboardContent=" + mboardContent + ", mboardDate=" + mboardDate + ", mboardHit=" + mboardHit
				+ ", mboardCmtcnt=" + mboardCmtcnt + "]";
	}

	public int getMboardNo() {
		return mboardNo;
	}

	public void setMboardNo(int mboardNo) {
		this.mboardNo = mboardNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMboardTitle() {
		return mboardTitle;
	}

	public void setMboardTitle(String mboardTitle) {
		this.mboardTitle = mboardTitle;
	}

	public String getMboardContent() {
		return mboardContent;
	}

	public void setMboardContent(String mboardContent) {
		this.mboardContent = mboardContent;
	}

	public Date getMboardDate() {
		return mboardDate;
	}

	public void setMboardDate(Date mboardDate) {
		this.mboardDate = mboardDate;
	}

	public int getMboardHit() {
		return mboardHit;
	}

	public void setMboardHit(int mboardHit) {
		this.mboardHit = mboardHit;
	}

	public int getMboardCmtcnt() {
		return mboardCmtcnt;
	}

	public void setMboardCmtcnt(int mboardCmtcnt) {
		this.mboardCmtcnt = mboardCmtcnt;
	}
	
	
	


}
