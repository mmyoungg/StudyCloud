package dto;

import java.util.Date;

public class Mboard {
	
	private int mboard_no; //게시글 번호
	private int member_no; //회원번호
	private String member_nick; //회원 닉네임
	private String mboard_title; //게시글 제목
	private String mboard_content; //게시글 내용
	private Date mboard_date; //게시글 작성 날짜
	private int mboard_hit; //게시글 조회수
	private int mboard_cmt; //게시글 댓글 수
	
	public Mboard() {}
	
	public Mboard(int mboard_no, int member_no, String memebr_nick, String mboard_title, String mboard_content, Date mboard_date,
			int mboard_hit, int mboard_cmt) {
		super();
		this.mboard_no = mboard_no;
		this.member_no = member_no;
		this.member_nick = member_nick;
		this.mboard_title = mboard_title;
		this.mboard_content = mboard_content;
		this.mboard_date = mboard_date;
		this.mboard_hit = mboard_hit;
		this.mboard_cmt = mboard_cmt;
	}
	
	
	@Override
	public String toString() {
		return "Mboard [mboard_no=" + mboard_no + ", member_no=" + member_no + ", member_nick=" + member_nick
				+ ", mboard_title=" + mboard_title + ", mboard_content=" + mboard_content + ", mboard_date="
				+ mboard_date + ", mboard_hit=" + mboard_hit + ", mboard_cmt=" + mboard_cmt + "]";
	}

	public int getMboard_no() {
		return mboard_no;
	}

	public void setMboard_no(int mboard_no) {
		this.mboard_no = mboard_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	

	public String getMember_nick() {
		return member_nick;
	}

	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}

	public String getMboard_title() {
		return mboard_title;
	}

	public void setMboard_title(String mboard_title) {
		this.mboard_title = mboard_title;
	}

	public String getMboard_content() {
		return mboard_content;
	}

	public void setMboard_content(String mboard_content) {
		this.mboard_content = mboard_content;
	}

	public Date getMboard_date() {
		return mboard_date;
	}

	public void setMboard_date(Date mboard_date) {
		this.mboard_date = mboard_date;
	}

	public int getMboard_hit() {
		return mboard_hit;
	}

	public void setMboard_hit(int mboard_hit) {
		this.mboard_hit = mboard_hit;
	}

	public int getMboard_cmt() {
		return mboard_cmt;
	}

	public void setMboard_cmt(int mboard_cmt) {
		this.mboard_cmt = mboard_cmt;
	}
	
	

}
