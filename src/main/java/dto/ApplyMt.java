package dto;

import java.util.Date;

public class ApplyMt {

	private int applymtNo;
	private int memberNo;
	private String field;
	private String applymtContent;
	private Date applymtDate;
	private Member member;
	
	public ApplyMt() {}

	public ApplyMt(int applymtNo, int memberNo, String field, String applymtContent, Date applymtDate, Member member) {
		super();
		this.applymtNo = applymtNo;
		this.memberNo = memberNo;
		this.field = field;
		this.applymtContent = applymtContent;
		this.applymtDate = applymtDate;
		this.member = member;
	}

	@Override
	public String toString() {
		return "ApplyMt [applymtNo=" + applymtNo + ", memberNo=" + memberNo + ", field=" + field + ", applymtContent="
				+ applymtContent + ", applymtDate=" + applymtDate + ", member=" + member + "]";
	}

	public int getApplymtNo() {
		return applymtNo;
	}

	public void setApplymtNo(int applymtNo) {
		this.applymtNo = applymtNo;
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

	public String getApplymtContent() {
		return applymtContent;
	}

	public void setApplymtContent(String applymtContent) {
		this.applymtContent = applymtContent;
	}

	public Date getApplymtDate() {
		return applymtDate;
	}

	public void setApplymtDate(Date applymtDate) {
		this.applymtDate = applymtDate;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

}
