package dto;

import java.util.Date;

public class SroomKeyword {
	
	private int keywordNo;
	private int memberNo;
	private String keywordWord;
	private Date keywordDate;
	
	public SroomKeyword() {}

	public SroomKeyword(int keywordNo, int memberNo, String keywordWord, Date keywordDate) {
		super();
		this.keywordNo = keywordNo;
		this.memberNo = memberNo;
		this.keywordWord = keywordWord;
		this.keywordDate = keywordDate;
	}

	@Override
	public String toString() {
		return "SroomKeyword [keywordNo=" + keywordNo + ", memberNo=" + memberNo + ", keywordWord=" + keywordWord
				+ ", keywordDate=" + keywordDate + "]";
	}

	public int getKeywordNo() {
		return keywordNo;
	}

	public void setKeywordNo(int keywordNo) {
		this.keywordNo = keywordNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getKeywordWord() {
		return keywordWord;
	}

	public void setKeywordWord(String keywordWord) {
		this.keywordWord = keywordWord;
	}

	public Date getKeywordDate() {
		return keywordDate;
	}

	public void setKeywordDate(Date keywordDate) {
		this.keywordDate = keywordDate;
	}

	

}
