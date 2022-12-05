package dto;

public class MboardLike {
	
	private int mlikeNo;
	private int mboardNo;
	private int memberNo;
	
	public MboardLike() {}
	
	public MboardLike(int mlikNo, int mboardNo, int memberNo) {
		
		super();
		this.mlikeNo = mlikeNo;
		this.mboardNo = mboardNo;
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "MboardLike [mlikeNo=" + mlikeNo + ", mboardNo=" + mboardNo + ", memberNo=" + memberNo + "]";
	}

	public int getMlikeNo() {
		return mlikeNo;
	}

	public void setMlikeNo(int mlikeNo) {
		this.mlikeNo = mlikeNo;
	}

	public int getMboardNo() {
		return mboardNo;
	}

	public void setMboardNo(int mboardNo) {
		this.mboardNo = mboardNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
	
	

}
