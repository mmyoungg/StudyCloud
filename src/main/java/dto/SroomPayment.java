package dto;

import java.util.Date;

public class SroomPayment {
	private int sRoomPayNo; // pk
	private int reserveNo; // 예약번호
	private String sRoomPayUid; // 고유결제번호
	private String sRoomPayApply; // 카드승인번호
	private Date sRoomPayDate; // 결제일시
	private String sRoomPayMsg; // 요청메세지
	private int sRoomPayPrice; // 결제된 가격
	private String sRoomPayMethod; // 결제수단
	
	public SroomPayment() {}

	public SroomPayment(int sRoomPayNo, int reserveNo, String sRoomPayUid, String sRoomPayApply, Date sRoomPayDate,
			String sRoomPayMsg, int sRoomPayPrice, String sRoomPayMethod) {
		super();
		this.sRoomPayNo = sRoomPayNo;
		this.reserveNo = reserveNo;
		this.sRoomPayUid = sRoomPayUid;
		this.sRoomPayApply = sRoomPayApply;
		this.sRoomPayDate = sRoomPayDate;
		this.sRoomPayMsg = sRoomPayMsg;
		this.sRoomPayPrice = sRoomPayPrice;
		this.sRoomPayMethod = sRoomPayMethod;
	}

	@Override
	public String toString() {
		return "SroomPayment [sRoomPayNo=" + sRoomPayNo + ", reserveNo=" + reserveNo + ", sRoomPayUid=" + sRoomPayUid
				+ ", sRoomPayApply=" + sRoomPayApply + ", sRoomPayDate=" + sRoomPayDate + ", sRoomPayMsg=" + sRoomPayMsg
				+ ", sRoomPayPrice=" + sRoomPayPrice + ", sRoomPayMethod=" + sRoomPayMethod + "]";
	}

	public int getsRoomPayNo() {
		return sRoomPayNo;
	}

	public void setsRoomPayNo(int sRoomPayNo) {
		this.sRoomPayNo = sRoomPayNo;
	}

	public int getReserveNo() {
		return reserveNo;
	}

	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}

	public String getsRoomPayUid() {
		return sRoomPayUid;
	}

	public void setsRoomPayUid(String sRoomPayUid) {
		this.sRoomPayUid = sRoomPayUid;
	}

	public String getsRoomPayApply() {
		return sRoomPayApply;
	}

	public void setsRoomPayApply(String sRoomPayApply) {
		this.sRoomPayApply = sRoomPayApply;
	}

	public Date getsRoomPayDate() {
		return sRoomPayDate;
	}

	public void setsRoomPayDate(Date sRoomPayDate) {
		this.sRoomPayDate = sRoomPayDate;
	}

	public String getsRoomPayMsg() {
		return sRoomPayMsg;
	}

	public void setsRoomPayMsg(String sRoomPayMsg) {
		this.sRoomPayMsg = sRoomPayMsg;
	}

	public int getsRoomPayPrice() {
		return sRoomPayPrice;
	}

	public void setsRoomPayPrice(int sRoomPayPrice) {
		this.sRoomPayPrice = sRoomPayPrice;
	}

	public String getsRoomPayMethod() {
		return sRoomPayMethod;
	}

	public void setsRoomPayMethod(String sRoomPayMethod) {
		this.sRoomPayMethod = sRoomPayMethod;
	}

	
		
}
