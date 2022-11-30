package dto;

import java.util.Date;

public class Commt {

	private int commt_no;
	private int fBoard_no;
	private int mntBoard_no;
	private int mBoard_no;
	private int sBoard_no;
	private int member_no;
	private String commt_content;
	private Date commt_date;
	
	public Commt() {}

	public Commt(int commt_no, int fBoard_no, int mntBoard_no, int mBoard_no, int sBoard_no, int member_no,
			String commt_content, Date commt_date) {
		super();
		this.commt_no = commt_no;
		this.fBoard_no = fBoard_no;
		this.mntBoard_no = mntBoard_no;
		this.mBoard_no = mBoard_no;
		this.sBoard_no = sBoard_no;
		this.member_no = member_no;
		this.commt_content = commt_content;
		this.commt_date = commt_date;
	}

	@Override
	public String toString() {
		return "Commt [commt_no=" + commt_no + ", fBoard_no=" + fBoard_no + ", mntBoard_no=" + mntBoard_no
				+ ", mBoard_no=" + mBoard_no + ", sBoard_no=" + sBoard_no + ", member_no=" + member_no
				+ ", commt_content=" + commt_content + ", commt_date=" + commt_date + "]";
	}

	public int getCommt_no() {
		return commt_no;
	}

	public void setCommt_no(int commt_no) {
		this.commt_no = commt_no;
	}

	public int getfBoard_no() {
		return fBoard_no;
	}

	public void setfBoard_no(int fBoard_no) {
		this.fBoard_no = fBoard_no;
	}

	public int getMntBoard_no() {
		return mntBoard_no;
	}

	public void setMntBoard_no(int mntBoard_no) {
		this.mntBoard_no = mntBoard_no;
	}

	public int getmBoard_no() {
		return mBoard_no;
	}

	public void setmBoard_no(int mBoard_no) {
		this.mBoard_no = mBoard_no;
	}

	public int getsBoard_no() {
		return sBoard_no;
	}

	public void setsBoard_no(int sBoard_no) {
		this.sBoard_no = sBoard_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getCommt_content() {
		return commt_content;
	}

	public void setCommt_content(String commt_content) {
		this.commt_content = commt_content;
	}

	public Date getCommt_date() {
		return commt_date;
	}

	public void setCommt_date(Date commt_date) {
		this.commt_date = commt_date;
	}
	
	
}
