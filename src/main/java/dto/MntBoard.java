package dto;

import java.util.Date;

public class MntBoard {

	private int mntboardNo;
	private int memberNo;
	private String field;
	private String mntboardTitle;
	private String mntboardContent;
	private int mntboardCmcnt;
	private int mntboardHit;
	private Date mntboardDate;

	
	public MntBoard() {}

	public MntBoard(int mntboardNo, int memberNo, String field, String mntboardTitle, String mntboardContent,
			int mntboardCmcnt, int mntboardHit, Date mntboardDate) {
		super();
		this.mntboardNo = mntboardNo;
		this.memberNo = memberNo;
		this.field = field;
		this.mntboardTitle = mntboardTitle;
		this.mntboardContent = mntboardContent;
		this.mntboardCmcnt = mntboardCmcnt;
		this.mntboardHit = mntboardHit;
		this.mntboardDate = mntboardDate;
	}

	@Override
	public String toString() {
		return "MntBoard [mntboardNo=" + mntboardNo + ", memberNo=" + memberNo + ", field=" + field + ", mntboardTitle="
				+ mntboardTitle + ", mntboardContent=" + mntboardContent + ", mntboardCmcnt=" + mntboardCmcnt
				+ ", mntboardHit=" + mntboardHit + ", mntboardDate=" + mntboardDate + "]";
	}

	public int getMntboardNo() {
		return mntboardNo;
	}

	public void setMntboardNo(int mntboardNo) {
		this.mntboardNo = mntboardNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getMntboardTitle() {
		return mntboardTitle;
	}

	public void setMntboardTitle(String mntboardTitle) {
		this.mntboardTitle = mntboardTitle;
	}

	public String getMntboardContent() {
		return mntboardContent;
	}

	public void setMntboardContent(String mntboardContent) {
		this.mntboardContent = mntboardContent;
	}

	public int getMntboardCmcnt() {
		return mntboardCmcnt;
	}

	public void setMntboardCmcnt(int mntboardCmcnt) {
		this.mntboardCmcnt = mntboardCmcnt;
	}

	public int getMntboardHit() {
		return mntboardHit;
	}

	public void setMntboardHit(int mntboardHit) {
		this.mntboardHit = mntboardHit;
	}

	public Date getMntboardDate() {
		return mntboardDate;
	}

	public void setMntboardDate(Date mntboardDate) {
		this.mntboardDate = mntboardDate;
	}
	
	
}
