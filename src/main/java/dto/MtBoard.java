package dto;

import java.util.Date;

public class MtBoard {

	private int mtboardNo;
	private int memberNo;
	private String field;
	private String jobDuty;
	private String jobGroup;
	private String career;
	private String mtboardTitle;
	private String mtboardContent;
	private int mtboardCmcnt;
	private int mtboardHit;
	private Date mtboardDate;
	private String coName;
	private int mtPrice;
	private int mark_cnt;
	
	public MtBoard() {}

	public MtBoard(int mtboardNo, int memberNo, String field, String jobDuty, String jobGroup, String career,
			String mtboardTitle, String mtboardContent, int mtboardCmcnt, int mtboardHit, Date mtboardDate,
			String coName, int mtPrice, int mark_cnt) {
		super();
		this.mtboardNo = mtboardNo;
		this.memberNo = memberNo;
		this.field = field;
		this.jobDuty = jobDuty;
		this.jobGroup = jobGroup;
		this.career = career;
		this.mtboardTitle = mtboardTitle;
		this.mtboardContent = mtboardContent;
		this.mtboardCmcnt = mtboardCmcnt;
		this.mtboardHit = mtboardHit;
		this.mtboardDate = mtboardDate;
		this.coName = coName;
		this.mtPrice = mtPrice;
		this.mark_cnt = mark_cnt;
	}

	@Override
	public String toString() {
		return "MtBoard [mtboardNo=" + mtboardNo + ", memberNo=" + memberNo + ", field=" + field + ", jobDuty="
				+ jobDuty + ", jobGroup=" + jobGroup + ", career=" + career + ", mtboardTitle=" + mtboardTitle
				+ ", mtboardContent=" + mtboardContent + ", mtboardCmcnt=" + mtboardCmcnt + ", mtboardHit=" + mtboardHit
				+ ", mtboardDate=" + mtboardDate + ", coName=" + coName + ", mtPrice=" + mtPrice + ", mark_cnt="
				+ mark_cnt + "]";
	}

	public int getMtboardNo() {
		return mtboardNo;
	}

	public void setMtboardNo(int mtboardNo) {
		this.mtboardNo = mtboardNo;
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

	public String getJobDuty() {
		return jobDuty;
	}

	public void setJobDuty(String jobDuty) {
		this.jobDuty = jobDuty;
	}

	public String getJobGroup() {
		return jobGroup;
	}

	public void setJobGroup(String jobGroup) {
		this.jobGroup = jobGroup;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getMtboardTitle() {
		return mtboardTitle;
	}

	public void setMtboardTitle(String mtboardTitle) {
		this.mtboardTitle = mtboardTitle;
	}

	public String getmtboardContent() {
		return mtboardContent;
	}

	public void setmtboardContent(String mtboardContent) {
		this.mtboardContent = mtboardContent;
	}

	public int getMtboardCmcnt() {
		return mtboardCmcnt;
	}

	public void setMtboardCmcnt(int mtboardCmcnt) {
		this.mtboardCmcnt = mtboardCmcnt;
	}

	public int getMtboardHit() {
		return mtboardHit;
	}

	public void setMtboardHit(int mtboardHit) {
		this.mtboardHit = mtboardHit;
	}

	public Date getMtboardDate() {
		return mtboardDate;
	}

	public void setMtboardDate(Date mtboardDate) {
		this.mtboardDate = mtboardDate;
	}

	public String getCoName() {
		return coName;
	}

	public void setCoName(String coName) {
		this.coName = coName;
	}

	public int getMtPrice() {
		return mtPrice;
	}

	public void setMtPrice(int mtPrice) {
		this.mtPrice = mtPrice;
	}

	public int getMark_cnt() {
		return mark_cnt;
	}

	public void setMark_cnt(int mark_cnt) {
		this.mark_cnt = mark_cnt;
	}
	
}
