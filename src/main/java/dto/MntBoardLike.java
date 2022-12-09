package dto;

public class MntBoardLike {
	
	private int mntboardlikeNo;
	private int mntboardNo;
	private int memberNo;
	private int mlike;
	
	public MntBoardLike() {}

	public MntBoardLike(int mntboardlikeNo, int mntboardNo, int memberNo, int mlike) {
		super();
		this.mntboardlikeNo = mntboardlikeNo;
		this.mntboardNo = mntboardNo;
		this.memberNo = memberNo;
		this.mlike = mlike;
	}

	@Override
	public String toString() {
		return "MntBoardLike [mntboardlikeNo=" + mntboardlikeNo + ", mntboardNo=" + mntboardNo + ", memberNo="
				+ memberNo + ", mlike=" + mlike + "]";
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

	public int getMlike() {
		return mlike;
	}

	public void setMlike(int mlike) {
		this.mlike = mlike;
	}
	
	
	
	
}
