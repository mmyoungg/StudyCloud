package dto;

public class SroomMark {

	private int sRoomMarkNo;
	private int sRoomNo;
	private int memberNo;
	public SroomMark(int sRoomMarkNo, int sRoomNo, int memberNo) {
		super();
		this.sRoomMarkNo = sRoomMarkNo;
		this.sRoomNo = sRoomNo;
		this.memberNo = memberNo;
	}
	
	public SroomMark() {}

	@Override
	public String toString() {
		return "SroomMark [sRoomMarkNo=" + sRoomMarkNo + ", sRoomNo=" + sRoomNo + ", memberNo=" + memberNo + "]";
	}

	public int getsRoomMarkNo() {
		return sRoomMarkNo;
	}

	public void setsRoomMarkNo(int sRoomMarkNo) {
		this.sRoomMarkNo = sRoomMarkNo;
	}

	public int getsRoomNo() {
		return sRoomNo;
	}

	public void setsRoomNo(int sRoomNo) {
		this.sRoomNo = sRoomNo;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
	
}
