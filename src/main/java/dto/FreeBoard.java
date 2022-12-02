package dto;

import java.util.Date;

public class FreeBoard {
	private int fBoardNo;
	private String categoryName;
	private int memberNo;
	private String fBoardTitle;
	private String fBoardContent;
	private int fBoardHit;
	private Date fBoardDate;
	private int fBoardCmtCount;
	
	public FreeBoard() {}

	public FreeBoard(int fBoardNo, String categoryName, int memberNo, String fBoardTitle, String fBoardContent,
			int fBoardHit, Date fBoardDate, int fBoardCmtCount) {
		super();
		this.fBoardNo = fBoardNo;
		this.categoryName = categoryName;
		this.memberNo = memberNo;
		this.fBoardTitle = fBoardTitle;
		this.fBoardContent = fBoardContent;
		this.fBoardHit = fBoardHit;
		this.fBoardDate = fBoardDate;
		this.fBoardCmtCount = fBoardCmtCount;
	}

	@Override
	public String toString() {
		return "FreeBoard [fBoardNo=" + fBoardNo + ", categoryName=" + categoryName + ", memberNo=" + memberNo
				+ ", fBoardTitle=" + fBoardTitle + ", fBoardContent=" + fBoardContent + ", fBoardHit=" + fBoardHit
				+ ", fBoardDate=" + fBoardDate + ", fBoardCmtCount=" + fBoardCmtCount + "]";
	}

	public int getfBoardNo() {
		return fBoardNo;
	}

	public void setfBoardNo(int fBoardNo) {
		this.fBoardNo = fBoardNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getfBoardTitle() {
		return fBoardTitle;
	}

	public void setfBoardTitle(String fBoardTitle) {
		this.fBoardTitle = fBoardTitle;
	}

	public String getfBoardContent() {
		return fBoardContent;
	}

	public void setfBoardContent(String fBoardContent) {
		this.fBoardContent = fBoardContent;
	}

	public int getfBoardHit() {
		return fBoardHit;
	}

	public void setfBoardHit(int fBoardHit) {
		this.fBoardHit = fBoardHit;
	}

	public Date getfBoardDate() {
		return fBoardDate;
	}

	public void setfBoardDate(Date fBoardDate) {
		this.fBoardDate = fBoardDate;
	}

	public int getfBoardCmtCount() {
		return fBoardCmtCount;
	}

	public void setfBoardCmtCount(int fBoardCmtCount) {
		this.fBoardCmtCount = fBoardCmtCount;
	}

	
}

