package dto;

public class StudyRoom {
	private int sRoomNo;
	private String sRoomName;
	private String sRoomAddr;
	private int sRoomPrice;
	private int sRoomPeople;
	private String sRoomIntro;
	private String sRoomInfo;
	private String sRoomRole;
	
	public StudyRoom() {}

	public StudyRoom(int sRoomNo, String sRoomName, String sRoomAddr, int sRoomPrice, int sRoomPeople,
			String sRoomIntro, String sRoomInfo, String sRoomRole) {
		super();
		this.sRoomNo = sRoomNo;
		this.sRoomName = sRoomName;
		this.sRoomAddr = sRoomAddr;
		this.sRoomPrice = sRoomPrice;
		this.sRoomPeople = sRoomPeople;
		this.sRoomIntro = sRoomIntro;
		this.sRoomInfo = sRoomInfo;
		this.sRoomRole = sRoomRole;
	}

	@Override
	public String toString() {
		return "StudyRoom [sRoomNo=" + sRoomNo + ", sRoomName=" + sRoomName + ", sRoomAddr=" + sRoomAddr
				+ ", sRoomPrice=" + sRoomPrice + ", sRoomPeople=" + sRoomPeople + ", sRoomIntro=" + sRoomIntro
				+ ", sRoomInfo=" + sRoomInfo + ", sRoomRole=" + sRoomRole + "]";
	}

	public int getsRoomNo() {
		return sRoomNo;
	}

	public void setsRoomNo(int sRoomNo) {
		this.sRoomNo = sRoomNo;
	}

	public String getsRoomName() {
		return sRoomName;
	}

	public void setsRoomName(String sRoomName) {
		this.sRoomName = sRoomName;
	}

	public String getsRoomAddr() {
		return sRoomAddr;
	}

	public void setsRoomAddr(String sRoomAddr) {
		this.sRoomAddr = sRoomAddr;
	}

	public int getsRoomPrice() {
		return sRoomPrice;
	}

	public void setsRoomPrice(int sRoomPrice) {
		this.sRoomPrice = sRoomPrice;
	}

	public int getsRoomPeople() {
		return sRoomPeople;
	}

	public void setsRoomPeople(int sRoomPeople) {
		this.sRoomPeople = sRoomPeople;
	}

	public String getsRoomIntro() {
		return sRoomIntro;
	}

	public void setsRoomIntro(String sRoomIntro) {
		this.sRoomIntro = sRoomIntro;
	}

	public String getsRoomInfo() {
		return sRoomInfo;
	}

	public void setsRoomInfo(String sRoomInfo) {
		this.sRoomInfo = sRoomInfo;
	}

	public String getsRoomRole() {
		return sRoomRole;
	}

	public void setsRoomRole(String sRoomRole) {
		this.sRoomRole = sRoomRole;
	}

	
	
}
