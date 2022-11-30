package dto;

import java.util.Date;

public class Sboard {
	
	private int sboard_no;
	private int member_no;
	private String sboard_title;
	private String sboard_content;
	private Date sboard_date;
	private int sboard_like;
	private int sboard_cmt;
	private int sboard_hit;
	private int location_no;
	
	public Sboard() {} 
	
	public Sboard(int sbaord_no, int member_no, String sboard_title, String sboard_content, Date sboard_date,
			int sboard_like, int Sboard_cmt, int sboard_hit, int location_no) {
		super();
		this.sboard_no = sboard_no;
		this.member_no = member_no;
		this.sboard_title = sboard_title;
		this.sboard_content = sboard_content;
		this.sboard_date = sboard_date;
		this.sboard_like = sboard_like;
		this.sboard_cmt = sboard_cmt;
		this.sboard_hit = sboard_hit;
		this.location_no = location_no;
		
	}
	
	@Override
	public String toString() {
		return "Sboard [sboard_no=" + sboard_no + ", member_no=" + member_no + ", sboard_title=" + sboard_title
				+ ", sboard_content=" + sboard_content + ", sboard_date=" + sboard_date + ", sboard_like=" + sboard_like
				+ ", sboard_cmt=" + sboard_cmt + ", sboard_hit=" + sboard_hit + ", location_no=" + location_no + "]";
	}
	
	public void setSboard_no(int sboard_no) {
		this.sboard_no = sboard_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public String getSboard_title() {
		return sboard_title;
	}
	public void setSboard_title(String sboard_title) {
		this.sboard_title = sboard_title;
	}
	public String getSboard_content() {
		return sboard_content;
	}
	public void setSboard_content(String sboard_content) {
		this.sboard_content = sboard_content;
	}
	public Date getSboard_date() {
		return sboard_date;
	}
	public void setSboard_date(Date sboard_date) {
		this.sboard_date = sboard_date;
	}
	public int getSboard_like() {
		return sboard_like;
	}
	public void setSboard_like(int sboard_like) {
		this.sboard_like = sboard_like;
	}
	public int getSboard_cmt() {
		return sboard_cmt;
	}
	public void setSboard_cmt(int sboard_cmt) {
		this.sboard_cmt = sboard_cmt;
	}
	public int getSboard_hit() {
		return sboard_hit;
	}
	public void setSboard_hit(int sboard_hit) {
		this.sboard_hit = sboard_hit;
	}
	public int getLocation_no() {
		return location_no;
	}
	public void setLocation_no(int location_no) {
		this.location_no = location_no;
	}
	
	

}
