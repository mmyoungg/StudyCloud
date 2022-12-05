package dto;

import java.util.Date;

public class Commt {

	private int commtNo;
	private int fBoardNo;
	private int mntBoardNo;
	private int mBoardNo;
	private int studyNo;
	private int memberNo;
	private String commtContent;
	private Date commtDate;
	
	public Commt() {}

	public Commt(int commtNo, int fBoardNo, int mntBoardNo, int mBoardNo, int studyNo, int memberNo,
			String commtContent, Date commtDate) {
		super();
		this.commtNo = commtNo;
		this.fBoardNo = fBoardNo;
		this.mntBoardNo = mntBoardNo;
		this.mBoardNo = mBoardNo;
		this.studyNo = studyNo;
		this.memberNo = memberNo;
		this.commtContent = commtContent;
		this.commtDate = commtDate;
	}

	@Override
	public String toString() {
		return "Commt [commtNo=" + commtNo + ", fBoardNo=" + fBoardNo + ", mntBoardNo=" + mntBoardNo + ", mBoardNo="
				+ mBoardNo + ", studyNo=" + studyNo + ", memberNo=" + memberNo + ", commtContent=" + commtContent
				+ ", commtDate=" + commtDate + "]";
	}

	public int getCommtNo() {
		return commtNo;
	}

	public void setCommtNo(int commtNo) {
		this.commtNo = commtNo;
	}

	public int getfBoardNo() {
		return fBoardNo;
	}

	public void setfBoardNo(int fBoardNo) {
		this.fBoardNo = fBoardNo;
	}

	public int getMntBoardNo() {
		return mntBoardNo;
	}

	public void setMntBoardNo(int mntBoardNo) {
		this.mntBoardNo = mntBoardNo;
	}

	public int getmBoardNo() {
		return mBoardNo;
	}

	public void setmBoardNo(int mBoardNo) {
		this.mBoardNo = mBoardNo;
	}

	public int getStudyNo() {
		return studyNo;
	}

	public void setStudyNo(int studyNo) {
		this.studyNo = studyNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getCommtContent() {
		return commtContent;
	}

	public void setCommtContent(String commtContent) {
		this.commtContent = commtContent;
	}

	public Date getCommtDate() {
		return commtDate;
	}

	public void setCommtDate(Date commtDate) {
		this.commtDate = commtDate;
	}

	
	
}