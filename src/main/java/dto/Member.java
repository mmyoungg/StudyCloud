package dto;

public class Member {
	
	private int member_no;
	private String member_id;
	private String member_pw;
	private String member_email;
	private int authority;
	private String member_photo;
	private String member_name;
	private String member_nick;
	private String member_phone;
	
	public Member() {}

	public Member(int member_no, String member_id, String member_pw, String member_email, int authority,
			String member_photo, String member_name, String member_nick, String member_phone) {
		super();
		this.member_no = member_no;
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_email = member_email;
		this.authority = authority;
		this.member_photo = member_photo;
		this.member_name = member_name;
		this.member_nick = member_nick;
		this.member_phone = member_phone;
	}

	@Override
	public String toString() {
		return "Member [member_no=" + member_no + ", member_id=" + member_id + ", member_pw=" + member_pw
				+ ", member_email=" + member_email + ", authority=" + authority + ", member_photo=" + member_photo
				+ ", member_name=" + member_name + ", member_nick=" + member_nick + ", member_phone=" + member_phone
				+ "]";
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public int getAuthority() {
		return authority;
	}

	public void setAuthority(int authority) {
		this.authority = authority;
	}

	public String getMember_photo() {
		return member_photo;
	}

	public void setMember_photo(String member_photo) {
		this.member_photo = member_photo;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_nick() {
		return member_nick;
	}

	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	
	
}

	