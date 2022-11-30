package dto;

import java.util.Date;

public class FreeBoard {
	private int fBoard_no;
	private String category_name;
	private int member_no;
	private String fBoard_title;
	private String fBoard_content;
	private int fBoard_hit;
	private Date fBoard_date;
	private int fBoard_cmtCount;
	
	public FreeBoard() {}

	public FreeBoard(int fBoard_no, String category_name, int member_no, String fBoard_title, String fBoard_content,
			int fBoard_hit, Date fBoard_date, int fBoard_cmtCount) {
		super();
		this.fBoard_no = fBoard_no;
		this.category_name = category_name;
		this.member_no = member_no;
		this.fBoard_title = fBoard_title;
		this.fBoard_content = fBoard_content;
		this.fBoard_hit = fBoard_hit;
		this.fBoard_date = fBoard_date;
		this.fBoard_cmtCount = fBoard_cmtCount;
	}

	@Override
	public String toString() {
		return "FreeBoard [fBoard_no=" + fBoard_no + ", category_name=" + category_name + ", member_no=" + member_no
				+ ", fBoard_title=" + fBoard_title + ", fBoard_content=" + fBoard_content + ", fBoard_hit=" + fBoard_hit
				+ ", fBoard_date=" + fBoard_date + ", fBoard_cmtCount=" + fBoard_cmtCount + "]";
	}

	public int getfBoard_no() {
		return fBoard_no;
	}

	public void setfBoard_no(int fBoard_no) {
		this.fBoard_no = fBoard_no;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getfBoard_title() {
		return fBoard_title;
	}

	public void setfBoard_title(String fBoard_title) {
		this.fBoard_title = fBoard_title;
	}

	public String getfBoard_content() {
		return fBoard_content;
	}

	public void setfBoard_content(String fBoard_content) {
		this.fBoard_content = fBoard_content;
	}

	public int getfBoard_hit() {
		return fBoard_hit;
	}

	public void setfBoard_hit(int fBoard_hit) {
		this.fBoard_hit = fBoard_hit;
	}

	public Date getfBoard_date() {
		return fBoard_date;
	}

	public void setfBoard_date(Date fBoard_date) {
		this.fBoard_date = fBoard_date;
	}

	public int getfBoard_cmtCount() {
		return fBoard_cmtCount;
	}

	public void setfBoard_cmtCount(int fBoard_cmtCount) {
		this.fBoard_cmtCount = fBoard_cmtCount;
	}

	

	
}

