package dto;

public class MntBoardLike {
	
	private int mntboardlikeNo;
	private int mntboardNo;
	private int memberNo;
	
	public MntBoardLike() {}

	public MntBoardLike(int mntboardlikeNo, int mntboardNo, int memberNo) {
		super();
		this.mntboardlikeNo = mntboardlikeNo;
		this.mntboardNo = mntboardNo;
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "MntBoardLike [mntboardlikeNo=" + mntboardlikeNo + ", mntboardNo=" + mntboardNo + ", memberNo="
				+ memberNo + "]";
	}

	public int getMntboardlikeNo() {
		return mntboardlikeNo;
	}

	public void setMntboardlikeNo(int mntboardlikeNo) {
		this.mntboardlikeNo = mntboardlikeNo;
	}

	public int getMntboardNo() {
		return mntboardNo;
	}

	public void setMntboardNo(int mntboardNo) {
		this.mntboardNo = mntboardNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
	
}
