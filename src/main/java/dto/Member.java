package dto;

public class Member {
	
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberEmail;
	private int authority;
	private String memberName;
	private String memberNick;
	private String memberPhone;
	
	public Member() {	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberPw=" + memberPw + ", memberEmail="
				+ memberEmail + ", authority=" + authority + ", memberName=" + memberName + ", memberNick=" + memberNick
				+ ", memberPhone=" + memberPhone + "]";
	}

	public Member(int memberNo, String memberId, String memberPw, String memberEmail, int authority, String memberName,
			String memberNick, String memberPhone) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberEmail = memberEmail;
		this.authority = authority;
		this.memberName = memberName;
		this.memberNick = memberNick;
		this.memberPhone = memberPhone;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public int getAuthority() {
		return authority;
	}

	public void setAuthority(int authority) {
		this.authority = authority;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberNick() {
		return memberNick;
	}

	public void setMemberNick(String memberNick) {
		this.memberNick = memberNick;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}


	
}

	