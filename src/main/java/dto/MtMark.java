package dto;

public class MtMark {

	private int mtmarkNo;
	private int mtboardNo;
	private int memberNo;
	
	public MtMark() {}

	public MtMark(int mtmarkNo, int mtboardNo, int memberNo) {
		super();
		this.mtmarkNo = mtmarkNo;
		this.mtboardNo = mtboardNo;
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "MtMark [mtmarkNo=" + mtmarkNo + ", mtboardNo=" + mtboardNo + ", memberNo=" + memberNo + "]";
	}

	public int getMtmarkNo() {
		return mtmarkNo;
	}

	public void setMtmarkNo(int mtmarkNo) {
		this.mtmarkNo = mtmarkNo;
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
	
	
}
